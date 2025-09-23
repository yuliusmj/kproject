/*************************************************************************************************************
 * @name			QueueableBatchParams
 * @author			JulianHurtado <k-julian.hurtado@kaseya.com>
 * @created			22 / 09 / 2025
 * @description		Parameters class to be used with QueueableBatchBase - a framework for Queueable apex
                    jobs that run in a batch-type pattern of multiple jobs. This yiels the performance
                    benefits of queueble apex while providing a useful way of chunking the executions
                    in order to avoid the governor limits.
 * @testClass		QueueableBatchParamsTests
 *
 * Changes (version)
 * -----------------------------------------------------------------------------------------------------------
 * 				No.		Date			Author					Description
 * 				----	------------	--------------------	----------------------------------------------
 * @version		1.0		2025-09-22		Julian Hurtado			Class created
 *
**************************************************************************************************************/
public class QueueableBatchParams {
	public Set<Id> finishedRecords;
	private List<SObject> recordsToProcess;
	Boolean nextRunNeeded;
	Integer batchSize;
	/*********************************************************************************************************
	 * @name			QueueableBatchParams
	 * @author			JulianHurtado <k-julian.hurtado@kaseya.com>
	 * @created			22 / 09 / 2025
	 * @description		Constructor
	 * @param			records List<SObject> : List of records to be processed
	 * @param			batchSize Integer : Number of records to be processed in a single batch
	 **********************************************************************************************************/
	public QueueableBatchParams(List<SObject> records, Integer batchSize) {
		this.batchSize = batchSize;
		if (finishedRecords == null) {
			finishedRecords = new Set<Id>();
		}
		setRecordsToProcess(records);
	}

	private void ensureListIsValid() {
		List<SObject> filteredRecords = new List<SObject>();
		for (SObject thisRecord : recordsToProcess) {
			if (!finishedRecords.contains((Id) thisRecord.get('Id'))) {
				filteredRecords.add(thisRecord);
			}
			if (filteredRecords.size() == batchSize) {
				break;
			}
		}
		recordsToProcess = filteredRecords;
	}
	/*********************************************************************************************************
	 * @name			setRecordsToProcess
	 * @author			JulianHurtado <k-julian.hurtado@kaseya.com>
	 * @created			22 / 09 / 2025
	 * @description		Sets the records to be processed
	 * @param			records List<SObject> : List of records to be processed
	 **********************************************************************************************************/
	public void setRecordsToProcess(List<SObject> records) {
		this.recordsToProcess = records;
		ensureListIsValid();
		this.nextRunNeeded = !UtilityHelper.isNullOrEmptyList(records) && recordsToProcess.size() >= batchSize;
	}
	/*********************************************************************************************************
	 * @name			addRecordsToFinished
	 * @author			JulianHurtado <k-julian.hurtado@kaseya.com>
	 * @created			22 / 09 / 2025
	 * @description		Adds the records to the finished records list
	 **********************************************************************************************************/
	public void addRecordsToFinished() {
		finishedRecords.addAll(new Map<Id, SObject>(recordsToProcess).keySet());
		recordsToProcess.clear();
	}
	/*********************************************************************************************************
	 * @name			getRecordsToProcess
	 * @author			JulianHurtado <k-julian.hurtado@kaseya.com>
	 * @created			22 / 09 / 2025
	 * @description		Gets the records to be processed
	 * @return			List<SObject> : List of records to be processed
	 **********************************************************************************************************/
	public List<SObject> getRecordsToProcess() {
		return recordsToProcess;
	}
	/*********************************************************************************************************
	 * @name			getIsNextRunNeeded
	 * @author			JulianHurtado <k-julian.hurtado@kaseya.com>
	 * @created			22 / 09 / 2025
	 * @description		Gets the next run needed flag
	 * @return			Boolean : True if the next run is needed
	 **********************************************************************************************************/
	public Boolean getIsNextRunNeeded() {
		return nextRunNeeded;
	}
}