@IsTest
public with sharing class QueueableBatchParamsTests {
	@IsTest
	static void testSetRecordsToProcess() {
		User systemAdminUser = generateAdminUser();
		System.runAs(systemAdminUser) {
			Test.startTest();
			fflib_ApexMocks mocks = new fflib_ApexMocks();
			List<Case> caseList = new List<Case>{
				new Case(Id = fflib_IDGenerator.generate(Case.SObjectType)),
				new Case(Id = fflib_IDGenerator.generate(Case.SObjectType)),
				new Case(Id = fflib_IDGenerator.generate(Case.SObjectType))
			};
			QueueableBatchParams params = new QueueableBatchParams(caseList, 2);

			Test.stopTest();
			System.assertEquals(2, params.getRecordsToProcess().size());
			System.assert(params.getIsNextRunNeeded());
			params.addRecordsToFinished();
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