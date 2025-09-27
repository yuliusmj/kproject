/*************************************************************************************************************
 * @name			CalloutExceptionUtility
 * @author			JulianHurtado <k-julian.hurtado@kaseya.com>
 * @created			26 / 09 / 2025
 * @description		Handles the exceptions from the callout and returns the correct exception message
 *
 * Changes (version)
 * -----------------------------------------------------------------------------------------------------------
 * 				No.		Date			Author					Description
 * 				----	------------	--------------------	----------------------------------------------
 * @version		1.0		2025-09-26		JulianHurtado			Class created
 *
 **************************************************************************************************************/
public with sharing class CalloutExceptionUtility {
	/*********************************************************************************************************
	 * @name			createHttpException
	 * @author			JulianHurtado <k-julian.hurtado@kaseya.com>
	 * @created			26 / 09 / 2025
	 * @description		Creates the correct exception based on the status code
	 * @param			res HttpResponse : The response from the callout
	 * @return			Exception : The correct exception message based on the status code with the response body
	 **********************************************************************************************************/
	public static Exception createHttpException(HttpResponse res) {
		Integer responseCode = res.getStatusCode();
		String body = res.getBody();
		if (responseCode == 400) {
			return new CalloutException('Bad Request: ' + body);
		}
		if (responseCode == 401 || responseCode == 403) {
			return new CalloutException('Authentication/Authorization Error: ' + body);
		}
		if (responseCode == 404) {
			return new CalloutException('Not Found: ' + body);
		}
		if (responseCode >= 500) {
			return new CalloutException('Server Error: ' + responseCode + ' - ' + body);
		}
		return new CalloutException('HTTP Error: ' + responseCode + ' - ' + body);
	}
	/*********************************************************************************************************
	 * @name			CalloutException
	 * @author			JulianHurtado <k-julian.hurtado@kaseya.com>
	 * @created			26 / 09 / 2025
	 * @description		Exception class for the CalloutExceptionUtility class
	 **********************************************************************************************************/
	public class CalloutException extends Exception {
	}
}