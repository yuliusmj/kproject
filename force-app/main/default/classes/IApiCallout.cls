/*************************************************************************************************************
 * @name			IApiCallout
 * @author			Kaseya Platform team
 * @created			25 / 09 / 2025
 * @description		Interface for the ApiCallout class
 *
 * Changes (version)
 * -----------------------------------------------------------------------------------------------------------
 * 				No.		Date			Author					Description
 * 				----	------------	--------------------	----------------------------------------------
 * @version		1.0		2025-09-25		Kaseya Platform Team	Class created
 *
 **************************************************************************************************************/
public interface IApiCallout {
	/*********************************************************************************************************
	 * @name			performCallout
	 * @author			Kaseya Platform Team
	 * @created			25 / 09 / 2025
	 * @description		Sets the request body and performs the callout
	 * @param			requestBody String : The request body
	 * @return			HttpResponse : The response from the callout
	 **********************************************************************************************************/
	HttpResponse performCallout(String requestBody);
}