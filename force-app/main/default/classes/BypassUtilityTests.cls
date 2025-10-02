@isTest
public with sharing class BypassUtilityTests {
	@isTest
	public static void testIsGlobalBypassEnabled() {
		User systemAdminUser = generateAdminUser();
		System.runAs(systemAdminUser) {
			Boolean isBypassEnabled;
			Bypass_Settings__c setting = Bypass_Settings__c.getInstance();
			setting.Bypass_Triggers__c = true;
			setting.SetupOwnerId = UserInfo.getUserId();
			Database.insert(setting, AccessLevel.SYSTEM_MODE);
			Test.startTest();
			isBypassEnabled = BypassUtility.isGlobalBypassEnabled();
			Test.stopTest();
			System.assertEquals(true, isBypassEnabled);
		}
	}
	@isTest
	public static void testIsSpecificAutomationBypassed() {
		User systemAdminUser = generateAdminUser();
		System.runAs(systemAdminUser) {
			Boolean isBypassEnabled;
			Bypass_Settings__c setting = Bypass_Settings__c.getInstance();
			setting.Bypass_Triggers__c = true;
			setting.Specific_Automation_Bypass__c = 'BypassUtilityTests';
			setting.SetupOwnerId = UserInfo.getUserId();
			Database.insert(setting, AccessLevel.SYSTEM_MODE);
			Test.startTest();
			isBypassEnabled = BypassUtility.isSpecificAutomationBypassed('BypassUtilityTests');
			Test.stopTest();
			System.assertEquals(true, isBypassEnabled);
		}
	}
	@isTest
	public static void testNull() {
		User systemAdminUser = generateAdminUser();
		System.runAs(systemAdminUser) {
			Boolean isBypassAutomation;
			Boolean isGlobalBypass;
			Test.startTest();
			isBypassAutomation = BypassUtility.isSpecificAutomationBypassed('');
			isGlobalBypass = BypassUtility.isGlobalBypassEnabled();
			Test.stopTest();
			System.assertEquals(false, isBypassAutomation);
			System.assertEquals(false, isGlobalBypass);
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