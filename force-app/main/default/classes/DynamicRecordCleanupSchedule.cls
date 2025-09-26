/*************************************************************************************************************
 * @name			DynamicRecordCleanupSchedule
 * @author			JulianHurtado <k-julian.hurtado@kaseya.com>
 * @created			24 / 09 / 2025
 * @description		Allows the scheduling of the DynamicRecordCleanup job
 *
 * Changes (version)
 * -----------------------------------------------------------------------------------------------------------
 * 				No.		Date			Author					Description
 * 				----	------------	--------------------	----------------------------------------------
 * @version		1.0		2025-09-24		Julian Hurtado			Create class
 *
 **************************************************************************************************************/
public class DynamicRecordCleanupSchedule implements Schedulable {
	public static final String CRON_EXPRESSION = '0 0 2 * * ?'; // Runs daily at midnight
	public static final String JOB_NAME = !Test.isRunningTest()
		? 'DynamicRecordCleanupSchedule'
		: 'DynamicRecordCleanupScheduleTest';
	/*********************************************************************************************************
	 * @name			execute
	 * @author			JulianHurtado <k-julian.hurtado@kaseya.com>
	 * @created			24 / 09 / 2025
	 * @description		Executes the job scheduling the DynamicRecordCleanup job
	 * @param			sc SchedulableContext : The context of the schedulable class
	 **********************************************************************************************************/
	public void execute(SchedulableContext sc) {
		System.enqueueJob(new DynamicRecordCleanup(null, null));
	}
	/*********************************************************************************************************
	 * @name			schedule
	 * @author			JulianHurtado <k-julian.hurtado@kaseya.com>
	 * @created			24 / 09 / 2025
	 * @description		schedules the job to run every day at midnight
	 **********************************************************************************************************/
	public static void schedule() {
		System.schedule(JOB_NAME, CRON_EXPRESSION, new DynamicRecordCleanupSchedule());
	}
}