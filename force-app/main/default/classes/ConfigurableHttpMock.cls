@IsTest
public class ConfigurableHttpMock implements HttpCalloutMock {
	private Integer statusCode;
	private String responseBody;

	public ConfigurableHttpMock(Integer code, String body) {
		this.statusCode = code;
		this.responseBody = body;
	}

	public HTTPResponse respond(HTTPRequest req) {
		HttpResponse res = new HttpResponse();
		res.setStatusCode(statusCode);
		if (responseBody != null) {
			res.setBody(responseBody);
		}
		return res;
	}
}