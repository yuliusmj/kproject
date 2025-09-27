public with sharing class RestApiCallout implements IApiCallout {
	private API_Resource_Endpoint__mdt cfg;
	private Integer timeout = 5000;
	private final String BEGIN_DELIMITATOR = '}';
	private final String END_DELIMITATOR = '}';
	private final String DEFAULT_CONTENT_TYPE = 'application/json';
	private final Set<String> APPLICATION_JSON_METHODS = new Set<String>{ 'POST', 'PUT', 'PATCH' };

	public RestApiCallout(API_Resource_Endpoint__mdt config) {
		this.cfg = config;
	}

	public HttpResponse performCallout(String requestBody) {
		Http http = new Http();
		HttpRequest req = new HttpRequest();
		timeout = cfg.Timeout__c != null ? Integer.valueOf(cfg.Timeout__c) : timeout;
		String endpoint = (cfg.NamedCredential__c != null)
			? 'callout:' + cfg.NamedCredential__c + cfg.Endpoint__c
			: cfg.Endpoint__c;

		req.setEndpoint(endpoint);
		req.setMethod(cfg.Method__c == null ? 'GET' : cfg.Method__c);
		req.setTimeout(timeout);

		// Headers from CMDT (JSON expected)
		if (String.isNotBlank(cfg.Headers__c)) {
			try {
				Map<String, Object> headers = (Map<String, Object>) JSON.deserializeUntyped(cfg.Headers__c);
				for (String k : headers.keySet()) {
					req.setHeader(k, String.valueOf(headers.get(k)));
				}
			} catch (JSONException e) {
				// log invalid header JSON
				System.debug(LoggingLevel.ERROR, 'Invalid Headers JSON: ' + e.getMessage());
			} catch (Exception e) {
				System.debug(LoggingLevel.ERROR, 'An error has occurred while setting headers: ' + e.getMessage());
			}
		}

		if (APPLICATION_JSON_METHODS.contains(req.getMethod())) {
			req.setHeader('Content-Type', (cfg.ContentType__c == null) ? DEFAULT_CONTENT_TYPE : cfg.ContentType__c);
			req.setBody(requestBody);
		}

		Integer maxRetries = cfg.RetryLimit__c == null ? 0 : Integer.valueOf(cfg.RetryLimit__c);
		Integer attempt = 0;
		HttpResponse res;
		Long backoffMillis = 500; // base backoff

		while (true) {
			try {
				res = http.send(req);
				if (res.getStatusCode() >= 200 && res.getStatusCode() < 300) {
					return res;
				}
				// status-based decision
				if (shouldRetry(res) && attempt < maxRetries) {
					attempt++;
					exponentialBackoffSleep(backoffMillis, attempt);
					continue;
				}
				// no retry: throw a typed exception
				throw CalloutExceptionUtility.createHttpException(res);
			} catch (System.CalloutException ce) {
				if (attempt < maxRetries) {
					attempt++;
					exponentialBackoffSleep(backoffMillis, attempt);
					continue;
				}
				throw ce;
			}
		}
		return res;
	}

	/**
	 * @description Replace the params given by the custom metadata with values provided in the method
	 * @param    grossParams   complete Endpoint with params to replace.
	 * @param    mapEndpointParamsValues   Map<String,String> Map of key->values to replace in the endpoint.
	 * @return   HttpResponse        The response from the HTTP callout. (HttpResponse)
	 */
	@TestVisible
	private String fetchParams(String grossParams, Map<String, String> mapEndpointParamsValues) {
		for (String key : mapEndpointParamsValues.keySet()) {
			grossParams = grossParams.replace(
				BEGIN_DELIMITATOR + key + END_DELIMITATOR,
				mapEndpointParamsValues.get(key)
			);
		}
		return grossParams;
	}

	private Boolean shouldRetry(HttpResponse res) {
		Integer s = res.getStatusCode();
		// retry on 429 (rate limit) and 5xx server errors
		return (s == 429) || (s >= 500 && s < 600);
	}

	private void exponentialBackoffSleep(Long base, Integer attempt) {
		// Apex doesn't allow Thread.sleep; use a simple pause via Limits or just increase timeout between attempts
		timeout = Integer.valueOf(base * Math.pow(2, attempt));
	}
}