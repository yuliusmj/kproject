@IsTest
public class MockFactory {
	public static HttpCalloutMock create(Integer statusCode, String body) {
		return new ConfigurableHttpMock(statusCode, body);
	}
}