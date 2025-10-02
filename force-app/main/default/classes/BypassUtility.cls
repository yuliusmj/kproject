/*************************************************************************************************************
 * @name			BypassUtility
 * @author			Kaseya Platform Team
 * @created			25 / 09 / 2025
 * @description		Provides utility methods for bypassing triggers and automations
 *
 * Changes (version)
 * -----------------------------------------------------------------------------------------------------------
 * 				No.		Date			Author					Description
 * 				----	------------	--------------------	----------------------------------------------
 * @version		1.0		2025-09-25		Kaseya Platform Team			Implemented
 *
 **************************************************************************************************************/
public without sharing class BypassUtility {
	private static Bypass_Settings__c setting = Bypass_Settings__c.getInstance();
	/*********************************************************************************************************
	 * @name			isGlobalBypassEnabled
	 * @author			Kaseya Platform Team
	 * @created			25 / 09 / 2025
	 * @description		Checks if the global bypass trigger is enabled for the current user
	 * @return			Boolean	True if the bypass is enabled, false otherwise
	 **********************************************************************************************************/
	public static Boolean isGlobalBypassEnabled() {
		if (setting == null) {
			return false;
		}
		return (Boolean) setting.Bypass_Triggers__c;
	}
	/*********************************************************************************************************
	 * @name			isGlobalBypassEnabled
	 * @author			Kaseya Platform Team
	 * @created			25 / 09 / 2025
	 * @description		Checks if the specific automation bypass is enabled for the current user
	 * @param			automationName String The name of the automation to check
	 * @return			Boolean	True if the bypass is enabled, false otherwise
	 **********************************************************************************************************/
	public static Boolean isSpecificAutomationBypassed(String automationName) {
		if (setting == null || String.isEmpty(setting.Specific_Automation_Bypass__c)) {
			return false;
		}
		return setting.Specific_Automation_Bypass__c.contains(automationName.trim());
	}
}