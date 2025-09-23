/*************************************************************************************************************
 * @name			QueueableBatchBase
 * @author			JulianHurtado <k-julian.hurtado@kaseya.com>
 * @created			22 / 09 / 2025
 * @description		Abstract class to be extended by Queueable apex jobs that run in a batch-type
                    pattern of multiple jobs. This yiels the performance benefits of queueble apex
                    while providing a useful way of chunking the executions in order to 
                    avoid the governor limits.
 *
 * Changes (version)
 * -----------------------------------------------------------------------------------------------------------
 * 				No.		Date			Author					Description
 * 				----	------------	--------------------	----------------------------------------------
 * @version		1.0		2025-09-22		Julian Hurtado			Class created
 *
**************************************************************************************************************/
@SuppressWarnings('PMD.EmptyStatementBlock')
public abstract class QueueableBatchBase {
	protected QueueableBatchParams params { get; set; }
	/*********************************************************************************************************
	 * @name			QueueableBatchBase
	 * @author			JulianHurtado <k-julian.hurtado@kaseya.com>
	 * @created			22 / 09 / 2025
	 * @description		Constructor
	 **********************************************************************************************************/
	public QueueableBatchBase() {
	}
	protected abstract void finish();

	protected Boolean isNextRunNeeded() {
		if (!UtilityHelper.isNullOrEmptyList(params.getRecordsToProcess())) {
			params.finishedRecords.addAll(new Map<Id, SObject>(params.getRecordsToProcess()).keySet());
		}
		// Do not do recursive queueable jobs in a test context
		return !Test.isRunningTest() ? params.getIsNextRunNeeded() : false;
	}
}