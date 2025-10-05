@IsTest
public with sharing class ApiCalloutFrameworkTests {
	@TestSetup
	static void makeData() {
		List<API_Resource_Endpoint__mdt> configs = (List<API_Resource_Endpoint__mdt>) Test.loadData(
			API_Resource_Endpoint__mdt.SObjectType,
			'API_Resource_Endpoint_TestData'
		);
	}
	@IsTest
	static void testSuccessfulCalloutDataLoaded() {
		User systemAdminUser = generateAdminUser();
		System.runAs(systemAdminUser) {
			Test.setMock(HttpCalloutMock.class, MockFactory.create(200, '{"message": "Success"}'));
			Test.startTest();
			IApiCallout callout = CalloutFactory.get('OneSource_AddressValidationTest');
			String body = JSON.serialize('acc');
			HttpResponse res = callout.performCallout(body);
			Test.stopTest();
			// Assert
			System.assertEquals(200, res.getStatusCode(), 'Should return success');
			System.assert(res.getBody().contains('Success'));
		}
	}
	@IsTest
	static void testSuccessfulCallout() {
		User systemAdminUser = generateAdminUser();
		System.runAs(systemAdminUser) {
			Test.setMock(HttpCalloutMock.class, MockFactory.create(200, '{"message": "Success"}'));
			API_Resource_Endpoint__mdt accountSync = new API_Resource_Endpoint__mdt(
				DeveloperName = 'AccountSyncAPI',
				MasterLabel = 'Account Sync API',
				Endpoint__c = '/services/data/v51.0/sobjects/Account',
				NamedCredential__c = 'My_Named_Credential',
				Method__c = 'POST',
				Timeout__c = 12000
			);
			// IApiCallout callout = CalloutFactory.get('AccountSyncAPI');
			RestApiCallout restClass = new RestApiCallout(accountSync);
			String body = JSON.serialize('acc');
			HttpResponse res = restClass.performCallout(body);

			// Assert
			System.assertEquals(200, res.getStatusCode(), 'Should return success');
			System.assert(res.getBody().contains('Success'));
		}
	}

	@IsTest
	static void testErrorCallout500() {
		User systemAdminUser = generateAdminUser();
		System.runAs(systemAdminUser) {
			Test.setMock(HttpCalloutMock.class, MockFactory.create(500, '{"error": "Internal Server Error"}'));
			API_Resource_Endpoint__mdt config = new API_Resource_Endpoint__mdt(
				DeveloperName = 'ErrorAPI',
				MasterLabel = 'Error API',
				Endpoint__c = 'callout:My_Named_Credential',
				Method__c = 'GET',
				Timeout__c = 10000
			);
			try {
				// IApiCallout callout = CalloutFactory.get('ErrorAPI');
				RestApiCallout callout = new RestApiCallout(config);
				String body = JSON.serialize('acc');
				HttpResponse res = callout.performCallout(body);
				System.assertEquals(500, res.getStatusCode(), 'Should return error code');
				System.assert(res.getBody().contains('Internal Server Error'));
			} catch (Exception ex) {
				System.assert(ex.getMessage().contains('Internal Server Error'));
			}
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