public with sharing class RestApiCallout implements IApiCallout {
	private API_Resource_Endpoint__mdt cfg;
	private Integer timeout;
	public RestApiCallout(API_Resource_Endpoint__mdt config) {
		this.cfg = config;
	}

	public HttpResponse performCallout(String requestBody) {
		Http http = new Http();
		HttpRequest req = new HttpRequest();
		timeout = cfg.Timeout__c == null ? 5000 : Integer.valueOf(cfg.Timeout__c);
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
			} catch (Exception e) {
				// log invalid header JSON
				System.debug(LoggingLevel.ERROR, 'Invalid Headers JSON: ' + e.getMessage());
			}
		}

		if (req.getMethod() == 'POST' || req.getMethod() == 'PUT' || req.getMethod() == 'PATCH') {
			req.setHeader('Content-Type', 'application/json');
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
				throw createHttpException(res);
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

	private Boolean shouldRetry(HttpResponse res) {
		Integer s = res.getStatusCode();
		// retry on 429 (rate limit) and 5xx server errors
		return (s == 429) || (s >= 500 && s < 600);
	}

	private void exponentialBackoffSleep(Long base, Integer attempt) {
		// Apex doesn't allow Thread.sleep; use a simple pause via Limits or just increase timeout between attempts
		timeout = Integer.valueOf(base * Math.pow(2, attempt));
	}

	private Exception createHttpException(HttpResponse res) {
		Integer s = res.getStatusCode();
		String body = res.getBody();
		if (s == 400) {
			return new CalloutException('Bad Request: ' + body);
		}
		if (s == 401 || s == 403) {
			return new CalloutException('Authentication/Authorization Error: ' + body);
		}
		if (s == 404) {
			return new CalloutException('Not Found: ' + body);
		}
		if (s >= 500) {
			return new CalloutException('Server Error: ' + s + ' - ' + body);
		}
		return new CalloutException('HTTP Error: ' + s + ' - ' + body);
	}
	public class CalloutException extends Exception {
	}
}