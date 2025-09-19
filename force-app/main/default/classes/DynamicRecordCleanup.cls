global with sharing class DynamicRecordCleanup extends QueueableBatchBase implements System.Queueable {
	List<SObject> recordsToProcess { get; set; }
	RecordCleanupWrapper currentSetting;
	@TestVisible
	List<RecordCleanupWrapper> cleanupSettings;
	@TestVisible
	Boolean cleanupsLeft {
		get {
			if (cleanupsLeft == null) {
				cleanupsLeft = true;
			}

			return cleanupsLeft;
		}
		set;
	}

	@TestVisible
	private static final Integer BATCH_SIZE = 2000;

	public DynamicRecordCleanup(QueueableBatchParams params, List<RecordCleanupWrapper> settings) {
		if (params == null) {
			setCleanupRecords();
			recordsToProcess = getRecordsForDeletion(new Set<Id>());
			params = new QueueableBatchParams(recordsToProcess, BATCH_SIZE);
		} else {
			this.cleanupSettings = settings;
			// Using "finishedRecords" to denote failures; actual finished and successful records will no longer meet query criteria
			recordsToProcess = getRecordsForDeletion(params.finishedRecords);
			params.setRecordsToProcess(recordsToProcess);

			this.cleanupSettings = settings;
		}

		this.params = params;
	}

	global void execute(System.QueueableContext qe) {
		List<SObject> recordsToUpdate = new List<SObject>();
		List<SObject> recordsToDelete = new List<SObject>();
		if (recordsToProcess != null && recordsToProcess.size() > 0) {
			for (SObject recordToProcess : recordsToProcess) {
				if (
					(Boolean) recordToProcess.get('Marked_for_Archive__c') &&
					(DateTime) recordToProcess.get('LastModifiedDate') != System.today()
				) {
					recordsToDelete.add(recordToProcess);
				} else {
					recordToProcess.put('Marked_for_Archive__c', true);
					recordsToUpdate.add(recordToProcess);
				}
			}
			Database.SaveResult[] updateResults = Database.update(recordsToUpdate, false);
			Database.DeleteResult[] deleteResults = Database.delete(recordsToDelete, false);
		}

		if (cleanupsLeft && !Test.isRunningTest()) {
			System.enqueueJob(new DynamicRecordCleanup(params, cleanupSettings));
		}
	}

	private List<SObject> getRecordsForDeletion(Set<Id> exclusionSet) {
		RecordCleanupWrapper cleanupWrapper = getNextRecordCleanup();
		if (cleanupWrapper != null) {
			Record_Cleanup__mdt thisCleanupSetting = cleanupWrapper.setting;
			String sobjectName = thisCleanupSetting.SObject_Name__c;
			String archivalConditions = thisCleanupSetting.Archive_Conditions__c;
			if (archivalConditions != null) {
				String query =
					'SELECT Id, Marked_for_Archive__c, LastModifiedDate FROM ' +
					sobjectName +
					' WHERE ' +
					archivalConditions +
					' AND Id NOT IN :exclusionSet LIMIT ' +
					BATCH_SIZE;
				recordsToProcess = Database.query(query);
			} else {
				recordsToProcess = new List<SObject>();
			}
		} else {
			recordsToProcess = new List<SObject>();
		}
		// If we returned the same # of records as the batch size, assume we still have more records to grab on this rule
		// If we don't have more records to grab with this rule, this block will get hit on the next run and proceed to the next rule
		if (cleanupWrapper != null && recordsToProcess.size() < BATCH_SIZE) {
			cleanupWrapper.setFinished();
			if (recordsToProcess.isEmpty()) {
				cleanupWrapper = getNextRecordCleanup();
			}
		}

		currentSetting = cleanupWrapper;
		cleanupsLeft = cleanupWrapper != null || !recordsToProcess.isEmpty();

		return recordsToProcess;
	}

	@TestVisible
	private RecordCleanupWrapper getNextRecordCleanup() {
		for (RecordCleanupWrapper thisWrapper : cleanupSettings) {
			if (!thisWrapper.getIsFinished()) {
				return thisWrapper;
			}
		}

		return null;
	}

	public void setCleanupRecords() {
		this.cleanupSettings = new List<RecordCleanupWrapper>();
		List<Record_Cleanup__mdt> recordCleanupSettings = [
			SELECT SObject_Name__c, Archive_Conditions__c
			FROM Record_Cleanup__mdt
			WHERE Archive_Conditions__c != NULL
			ORDER BY SObject_Name__c
		];
		for (Record_Cleanup__mdt cleanupSetting : recordCleanupSettings) {
			this.cleanupSettings.add(new RecordCleanupWrapper(cleanupSetting));
		}
	}

	// Simple wrapper to track the states of completeness for each Dispersal Routing Rule
	public class RecordCleanupWrapper {
		private Record_Cleanup__mdt setting { get; set; }
		private Boolean finished;

		public RecordCleanupWrapper(Record_Cleanup__mdt cleanupSetting) {
			this.setting = cleanupSetting;
			this.finished = false;
		}

		public void setFinished() {
			this.finished = true;
		}

		public Boolean getIsFinished() {
			return this.finished;
		}

		public Record_Cleanup__mdt getSetting() {
			return this.setting;
		}
	}

	protected override void finish() {
	}
}