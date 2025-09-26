public with sharing class DynamicRecordCleanup extends QueueableBatchBase implements System.Queueable {
	List<SObject> recordsToProcess { get; set; }
	RecordCleanupWrapper currentSetting;
	@TestVisible
	private static final Integer BATCH_SIZE = 2000;
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
	/*********************************************************************************************************
	 * @name			DynamicRecordCleanup
	 * @author			JulianHurtado <k-julian.hurtado@kaseya.com>
	 * @created			24 / 09 / 2025
	 * @description		Constructor for the DynamicRecordCleanup class
	 * @param			params QueueableBatchParams : The parameters for the batch
	 * @param			settings List<RecordCleanupWrapper> : The settings for the cleanup
	 **********************************************************************************************************/
	public DynamicRecordCleanup(QueueableBatchParams params, List<RecordCleanupWrapper> settings) {
		if (params == null) {
			setCleanupRecords();
			recordsToProcess = getRecordsForDeletion(new Set<Id>());
			params = new QueueableBatchParams(recordsToProcess, BATCH_SIZE);
		} else {
			this.cleanupSettings = settings;
			recordsToProcess = getRecordsForDeletion(params.finishedRecords);
			params.setRecordsToProcess(recordsToProcess);
			this.cleanupSettings = settings;
		}
		this.params = params;
	}

	public void execute(System.QueueableContext qe) {
		List<SObject> recordsToUpdate = new List<SObject>();
		List<SObject> recordsToDelete = new List<SObject>();
		if (recordsToProcess != null && recordsToProcess.size() > 0) {
			System.debug(
				'recordsToProcess size: ' +
					recordsToProcess.size() +
					' recordsToProcess: ' +
					recordsToProcess[0].getSObjectType()
			);
			for (SObject recordToProcess : recordsToProcess) {
				if (
					//(Boolean) recordToProcess.get('Marked_for_Archive__c') &&
					(DateTime) recordToProcess.get('LastModifiedDate') != System.today()
				) {
					recordsToDelete.add(recordToProcess);
				} else {
					//recordToProcess.put('Marked_for_Archive__c', true);
					recordsToUpdate.add(recordToProcess);
				}
			}
			System.debug('Update records: ' + recordsToUpdate.size());
			Database.SaveResult[] updateResults = Database.update(recordsToUpdate, false, AccessLevel.SYSTEM_MODE);
			System.debug('deleted records');
			// Database.DeleteResult[] deleteResults = Database.delete(recordsToDelete, false);
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
			Integer days = Integer.valueOf(thisCleanupSetting.Delete_After_X_Days__c);
			String archivalConditions = thisCleanupSetting.Archive_Conditions__c;
			String archivalFieldsQuery = 'SELECT Id , LastModifiedDate FROM ';
			String exclusionQuery = ' AND Id NOT IN :exclusionSet LIMIT ';
			if (archivalConditions != null) {
				//Marked_for_Archive__c
				String query =
					archivalFieldsQuery +
					sobjectName +
					' WHERE ' +
					archivalConditions +
					' CreatedDate <N_DAYS_AGO:' +
					days +
					exclusionQuery +
					BATCH_SIZE;
				recordsToProcess = Database.query(String.escapeSingleQuotes(query));
			} else {
				String query =
					'SELECT Id , LastModifiedDate FROM ' +
					sobjectName +
					' WHERE ' +
					'CreatedDate <N_DAYS_AGO:' +
					days +
					exclusionQuery +
					BATCH_SIZE;
				recordsToProcess = Database.query(String.escapeSingleQuotes(query));
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
	/*********************************************************************************************************
	 * @name			setCleanupRecords
	 * @author			JulianHurtado <k-julian.hurtado@kaseya.com>
	 * @created			24 / 09 / 2025
	 * @description		Gets the record cleanup settings from the custom metadata and sets them in the cleanup settings
	 **********************************************************************************************************/
	public void setCleanupRecords() {
		this.cleanupSettings = new List<RecordCleanupWrapper>();
		List<Record_Cleanup__mdt> recordCleanupSettings = [
			SELECT SObject_Name__c, Archive_Conditions__c, Delete_After_X_Days__c
			FROM Record_Cleanup__mdt
			WITH SYSTEM_MODE
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
	@SuppressWarnings('PMD.EmptyStatementBlock')
	protected override void finish() {
	}
}