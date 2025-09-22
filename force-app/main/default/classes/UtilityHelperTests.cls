/*************************************************************************************************************
 * @name			UtilityHelperTests
 * @author			JulianHurtado <k-julian.hurtado@kaseya.com>
 * @created			21 / 09 / 2025
 * @description		Tests for UtilityHelper class
 *
 * Changes (version)
 * -----------------------------------------------------------------------------------------------------------
 * 				No.		Date			Author					Description
 * 				----	------------	--------------------	----------------------------------------------
 * @version		1.0		2025-09-21		Julian Hurtado			Code coverage tests for UtilityHelper. 100% coverage
 *
 **************************************************************************************************************/
@IsTest
public with sharing class UtilityHelperTests {
	@IsTest
	static void testBuildListMap() {
		User systemAdminUser = generateAdminUser();
		System.runAs(systemAdminUser) {
			fflib_ApexMocks mocks = new fflib_ApexMocks();
			Id caseIdArgentina = fflib_IDGenerator.generate(Case.SObjectType);
			Id caseIdBrazil = fflib_IDGenerator.generate(Case.SObjectType);
			Id caseIdCanada = fflib_IDGenerator.generate(Case.SObjectType);
			Id caseIdColombia = fflib_IDGenerator.generate(Case.SObjectType);
			Id caseIdMexico = fflib_IDGenerator.generate(Case.SObjectType);
			List<Case> caseList = new List<Case>{
				new Case(Id = caseIdArgentina, Origin = Case_Constants.CASE_ORIGIN.PHONE),
				new Case(Id = caseIdBrazil, Origin = Case_Constants.CASE_ORIGIN.PHONE),
				new Case(Id = caseIdCanada, Origin = Case_Constants.CASE_ORIGIN.EMAIL),
				new Case(Id = caseIdColombia, Origin = Case_Constants.CASE_ORIGIN.BILLING),
				new Case(Id = caseIdMexico, Origin = Case_Constants.CASE_ORIGIN.NEMO)
			};
			Test.startTest();
			Map<String, List<Case>> caseMapEmpty = UtilityHelper.buildListMap(Case.Origin, null);
			Map<String, List<Case>> caseMap = UtilityHelper.buildListMap(Case.Origin, caseList);
			Test.stopTest();
			System.assertEquals(4, caseMap.size());
			System.assertEquals(2, caseMap.get(Case_Constants.CASE_ORIGIN.PHONE).size());
		}
	}
	@IsTest
	static void testBuildMap() {
		User systemAdminUser = generateAdminUser();
		System.runAs(systemAdminUser) {
			fflib_ApexMocks mocks = new fflib_ApexMocks();
			Id caseIdArgentina = fflib_IDGenerator.generate(Case.SObjectType);
			Id caseIdCanada = fflib_IDGenerator.generate(Case.SObjectType);
			Id caseIdColombia = fflib_IDGenerator.generate(Case.SObjectType);
			Id caseIdMexico = fflib_IDGenerator.generate(Case.SObjectType);
			List<Case> caseList = new List<Case>{
				new Case(Id = caseIdArgentina, Origin = Case_Constants.CASE_ORIGIN.PHONE),
				new Case(Id = caseIdCanada, Origin = Case_Constants.CASE_ORIGIN.EMAIL),
				new Case(Id = caseIdColombia, Origin = Case_Constants.CASE_ORIGIN.BILLING),
				new Case(Id = caseIdMexico, Origin = Case_Constants.CASE_ORIGIN.NEMO)
			};
			Test.startTest();
			Map<String, SObject> caseMap = UtilityHelper.buildMap(Case.Origin, caseList);
			Test.stopTest();
			System.assertEquals(4, caseMap.size());
		}
	}
	@IsTest
	static void testformatPhone() {
		User systemAdminUser = generateAdminUser();
		System.runAs(systemAdminUser) {
			Test.startTest();
			String phoneEmpty = UtilityHelper.formatPhone('', true);
			String phoneCleanTrue = UtilityHelper.formatPhone('6479187745', true);
			String phoneCleanFalse = UtilityHelper.formatPhone('6479187745', false);
			Test.stopTest();
			System.assertEquals('16479187745', phoneCleanTrue);
			System.assertEquals('+16479187745', phoneCleanFalse);
		}
	}
	@IsTest
	static void testgenerateRandomString() {
		User systemAdminUser = generateAdminUser();
		System.runAs(systemAdminUser) {
			Test.startTest();
			String emailRandom = UtilityHelper.generateRandomEmail();
			Test.stopTest();
			System.assertEquals(true, UtilityHelper.isValidEmail(emailRandom));
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