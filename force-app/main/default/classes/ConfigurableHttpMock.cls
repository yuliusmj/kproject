/*************************************************************************************************************
 * @name			ConfigurableHttpMock
 * @author			Julian Hurtado
 * @created			02 / 10 / 2025
 * @description		Configurable mock for HttpCalloutMock
 *
 * Changes (version)
 * -----------------------------------------------------------------------------------------------------------
 * 				No.		Date			Author					Description
 * 				----	------------	--------------------	----------------------------------------------
 * @version		1.0		2025-10-02		Julian Hurtado			Class created
 *
 **************************************************************************************************************/
@IsTest
public class ConfigurableHttpMock implements HttpCalloutMock {
	private Integer statusCode;
	private String responseBody;
	/*********************************************************************************************************
	 * @name			ConfigurableHttpMock
	 * @author			Julian Hurtado
	 * @created			02 / 10 / 2025
	 * @description		Sets the status code and response body
	 * @param			code Integer : The status code
	 * @param			body String : The response body
	 **********************************************************************************************************/
	public ConfigurableHttpMock(Integer code, String body) {
		this.statusCode = code;
		this.responseBody = body;
	}
	/*********************************************************************************************************
	 * @name			respond
	 * @author			Julian Hurtado
	 * @created			02 / 10 / 2025
	 * @description		Mocks the HttpCalloutMock interface
	 * @param			req HTTPRequest : The HTTP request
	 * @return			HTTPResponse : The HTTP response with the status code and response body to mock
	 **********************************************************************************************************/
	public HTTPResponse respond(HTTPRequest req) {
		HttpResponse res = new HttpResponse();
		res.setStatusCode(statusCode);
		if (responseBody != null) {
			res.setBody(responseBody);
		}
		return res;
	}
}