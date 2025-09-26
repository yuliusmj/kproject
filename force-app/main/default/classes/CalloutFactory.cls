/*************************************************************************************************************
 * @name			CalloutFactory
 * @author			Kaseya Platform team
 * @created			25 / 09 / 2025
 * @description		Generates the correct API callout based on the configuration
 *
 * Changes (version)
 * -----------------------------------------------------------------------------------------------------------
 * 				No.		Date			Author					Description
 * 				----	------------	--------------------	----------------------------------------------
 * @version		1.0		2025-09-25		Julian Hurtado			Class created
 *
 **************************************************************************************************************/
public without sharing class CalloutFactory {
	/*********************************************************************************************************
	 * @name			get
	 * @author			Julian Hurtado <yuliusmj@hotmail.com>
	 * @created			25 / 09 / 2025
	 * @description		Gets the custom metadata for the API resource and returns the correct API callout
	 * @param			configName String : The name of the configuration
	 * @return			IApiCallout : The correct API callout
	 **********************************************************************************************************/
	public static IApiCallout get(String configName) {
		API_Resource_Endpoint__mdt apiResource = [
			SELECT
				DeveloperName,
				Endpoint__c,
				Method__c,
				NamedCredential__c,
				Timeout__c,
				RetryLimit__c,
				Headers__c,
				ImplType__c
			FROM API_Resource_Endpoint__mdt
			WHERE DeveloperName = :configName
			WITH SYSTEM_MODE
			LIMIT 1
		];
		//TODO: Implement SOAP callout
		// if (apiResource.ImplType__c == 'SOAP') {
		// 	return new SoapApiCallout(apiResource);
		// }
		// default
		return new RestApiCallout(apiResource);
	}
}