@IsTest
public with sharing class DynamicRecordCleanupTests {
	@TestSetup
	static void initData() {
		Map<String, Integer> sObjectToDeleteDays = new Map<String, Integer>();
		List<Record_Cleanup__mdt> recordCleanupSettings = [
			SELECT SObject_Name__c, Delete_After_X_Days__c, Archive_Conditions__c
			FROM Record_Cleanup__mdt
		];
		Record_Cleanup__mdt shoreTelSetting;
		for (Record_Cleanup__mdt thisSetting : recordCleanupSettings) {
			sObjectToDeleteDays.put(thisSetting.SObject_Name__c, (Integer) thisSetting.Delete_After_X_Days__c);
		}

		Integer offsetTime;
		Datetime expiryTime;

		//Create Email_Schedule__c
		Email_Schedule_Setting__mdt setting = new Email_Schedule_Setting__mdt();
		setting.Active__c = true;
		setting.Send_After_X_Hours__c = 4;
		setting.Respect_Business_Hours__c = true;

		TestUtils.insertLoanWithBorrower();

		Email_Schedule__c scheduleToDelete = new Email_Schedule__c(
			Base_Object_Id__c = 'fakeId',
			Email_Setting__c = 'FakeDevName',
			Sent__c = true
		);
		insert scheduleToDelete;

		if (sObjectToDeleteDays.containsKey('Email_Schedule__c')) {
			offsetTime = -(sObjectToDeleteDays.get('Email_Schedule__c') + 1);
			expiryTime = Datetime.now().addDays(offsetTime);
			Test.setCreatedDate(scheduleToDelete.Id, expiryTime);
		}
		//Create Error_Log__c
		Error_Log__c thisLog = new Error_Log__c();
		Database.SaveResult sr = Database.insert(thisLog);
		if (sObjectToDeleteDays.containsKey('Sync_Log__c')) {
			offsetTime = -(sObjectToDeleteDays.get('Sync_Log__c') + 1);
			expiryTime = Datetime.now().addDays(offsetTime);
			Test.setCreatedDate(sr.getId(), expiryTime);
		}
		//Create STCDR_ShoreTel_Connection__c
		STCDR__ShoreTel_Connection__c call1 = new STCDR__ShoreTel_Connection__c();
		call1.STCDR__Connect_Time__c = System.now().addHours(-2);
		insert call1;
		//Create Skill_Coverage_Details__c
		Skill_Coverage_Details__c scd = new Skill_Coverage_Details__c(
			State__c = 'NM',
			Start_Time__c = System.now().addMinutes(-60)
		);
		insert scd;
	}

	@IsTest
	static void dynamicRecordCleanupTest1() {
		Map<String, Integer> sObjectToDeleteDays = new Map<String, Integer>();
		List<Record_Cleanup__mdt> recordCleanupSettings = [
			SELECT SObject_Name__c, Delete_After_X_Days__c, Archive_Conditions__c
			FROM Record_Cleanup__mdt
			ORDER BY SObject_Name__c
		];
		Record_Cleanup__mdt shoreTelSetting;
		String firstSettingSobjectName = recordCleanupSettings[0].SObject_Name__c;
		for (Record_Cleanup__mdt thisSetting : recordCleanupSettings) {
			sObjectToDeleteDays.put(thisSetting.SObject_Name__c, (Integer) thisSetting.Delete_After_X_Days__c);
		}
		Test.startTest();
		System.enqueueJob(new DynamicRecordCleanup(null, null));
		Test.stopTest();

		String soql1 =
			'SELECT Id FROM ' +
			firstSettingSobjectName +
			' WHERE CreatedDate < LAST_N_DAYS:' +
			sObjectToDeleteDays.get(firstSettingSobjectName);
		List<SObject> logs1 = Database.query(soql1);
		//System.assert(logs1.isEmpty());
	}

	static testMethod void testScheduler() {
		Integer numberOfOldJobs = [SELECT COUNT() FROM CronTrigger];

		Test.startTest();
		DynamicRecordCleanupSchedule.schedule();
		Test.stopTest();

		System.assert(
			[SELECT COUNT() FROM CronTrigger] > numberOfOldJobs,
			'The dispersal job should have been scheduled.'
		);
	}

	@IsTest
	static void testNoRecordsFound() {
		Test.startTest();
		System.enqueueJob(new DynamicRecordCleanup(null, null));
		Test.stopTest();
	}

	@IsTest
	static void testNonNullBatchParams() {
		Map<String, Integer> sObjectToDeleteDays = new Map<String, Integer>();
		List<Record_Cleanup__mdt> recordCleanupSettings = [
			SELECT SObject_Name__c, Delete_After_X_Days__c, Archive_Conditions__c
			FROM Record_Cleanup__mdt
			ORDER BY SObject_Name__c
		];
		Record_Cleanup__mdt shoreTelSetting;
		String firstSettingSobjectName = recordCleanupSettings[0].SObject_Name__c;
		for (Record_Cleanup__mdt thisSetting : recordCleanupSettings) {
			sObjectToDeleteDays.put(thisSetting.SObject_Name__c, (Integer) thisSetting.Delete_After_X_Days__c);
		}

		List<DynamicRecordCleanup.RecordCleanupWrapper> cleanupSettings = new List<DynamicRecordCleanup.RecordCleanupWrapper>();

		for (Record_Cleanup__mdt cleanupSetting : recordCleanupSettings) {
			cleanupSettings.add(new DynamicRecordCleanup.RecordCleanupWrapper(cleanupSetting));
		}
		String soql1 =
			'SELECT Id FROM ' +
			firstSettingSobjectName +
			' WHERE CreatedDate < LAST_N_DAYS:' +
			sObjectToDeleteDays.get(firstSettingSobjectName);
		List<SObject> thisList = Database.query(soql1);
		Test.startTest();
		System.enqueueJob(new DynamicRecordCleanup(new QueueableBatchParams(thisList, 1), cleanupSettings));
		Test.stopTest();
	}
	@IsTest
	static void testWrapperLogic() {
		User systemAdminUser = generateAdminUser();
		System.runAs(systemAdminUser) {
			List<Record_Cleanup__mdt> recordCleanupSettings = [
				SELECT SObject_Name__c, Delete_After_X_Days__c, Archive_Conditions__c
				FROM Record_Cleanup__mdt
			];
			DynamicRecordCleanup.RecordCleanupWrapper thisWrapper = new DynamicRecordCleanup.RecordCleanupWrapper(
				recordCleanupSettings[0]
			);
			thisWrapper.setFinished();
			thisWrapper.getIsFinished();
			thisWrapper.getSetting();
			System.assertEquals(recordCleanupSettings[0].SObject_Name__c, thisWrapper.getSetting().SObject_Name__c);
		}
	}
	private static User generateAdminUser() {
		Profile profileCM = [SELECT Id FROM Profile WHERE name = 'System Administrator'];
		UserRole roleCM = [SELECT Id FROM UserRole WHERE PortalType = 'None' LIMIT 1];
		User systemAdminUser = new User(
			UserRoleId = roleCM.Id,
			ProfileId = profileCM.Id,
			Username = 'contactManager@kaseya.com',
			Alias = 'ConMan',
			Email = 'contactManager@kaseya.com',
			EmailEncodingKey = 'UTF-8',
			Firstname = 'test',
			Lastname = 'user',
			languagelocalekey = 'en_US',
			LocaleSidKey = 'en_Us',
			TimeZoneSidKey = 'America/Chicago'
		);
		return systemAdminUser;
	}
}