@IsTest
public class MockFactory {
	/*********************************************************************************************************
	 * @name			create
	 * @author			Julian Hurtado
	 * @created			02 / 10 / 2025
	 * @description		Factory method to create a mock
	 * @param			statusCode Integer : The status code of the mock
	 * @param			body String : The body of the mock
	 * @return			HttpCalloutMock : The mock
	 **********************************************************************************************************/
	public static HttpCalloutMock create(Integer statusCode, String body) {
		return new ConfigurableHttpMock(statusCode, body);
	}
}