@IsTest
public with sharing class ApiCalloutFrameworkTests {
	@IsTest
	static void testSuccessfulCallout() {
		Test.setMock(HttpCalloutMock.class, MockFactory.create(200, '{"message": "Success"}'));

		// Arrange: Create CMDT record (mock config) in test context
		API_Resource_Endpoint__mdt config = new API_Resource_Endpoint__mdt(
			DeveloperName = 'AccountSyncAPI',
			MasterLabel = 'Account Sync API',
			Endpoint__c = 'callout:My_Named_Credential',
			Method__c = 'POST',
			Timeout__c = 12000
		);
		// insert config;

		// Act
		IApiCallout callout = CalloutFactory.get('AccountSyncAPI');
		String body = JSON.serialize('acc');
		HttpResponse res = callout.performCallout(body);

		// Assert
		System.assertEquals(200, res.getStatusCode(), 'Should return success');
		System.assert(res.getBody().contains('Success'));
	}

	@IsTest
	static void testErrorCallout500() {
		Test.setMock(HttpCalloutMock.class, MockFactory.create(500, '{"error": "Internal Server Error"}'));

		API_Resource_Endpoint__mdt config = new API_Resource_Endpoint__mdt(
			DeveloperName = 'ErrorAPI',
			MasterLabel = 'Error API',
			Endpoint__c = 'callout:My_Named_Credential',
			Method__c = 'GET',
			Timeout__c = 10000
		);
		// insert config;
		IApiCallout callout = CalloutFactory.get('ErrorAPI');
		String body = JSON.serialize('acc');
		HttpResponse res = callout.performCallout(body);

		System.assertEquals(500, res.getStatusCode(), 'Should return error code');
		System.assert(res.getBody().contains('Internal Server Error'));
	}

	@IsTest
	static void testFactoryUnknownConfig() {
		try {
			IApiCallout callout = CalloutFactory.get('UnknownAPI');
			System.assert(false, 'Expected an exception for unknown config');
		} catch (Exception ex) {
			System.assert(ex.getMessage().contains('No API config found'));
		}
	}
}