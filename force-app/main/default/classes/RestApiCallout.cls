/*************************************************************************************************************
 * @name			RestApiCallout
 * @author			Renato Vera <k-renato.vera@kaseya.com>
 * @created			26 / 09 / 2025
 * @description		Description of your code
 *
 * Changes (version)
 * -----------------------------------------------------------------------------------------------------------
 * 				No.		Date			Author					Description
 * 				----	------------	--------------------	----------------------------------------------
 * @version		1.0		2025-09-26		Renato Vera			Changes desription
 *
 **************************************************************************************************************/
@SuppressWarnings('PMD.CyclomaticComplexity,PMD.StdCyclomaticComplexity')
public with sharing class RestApiCallout implements IApiCallout {
	private API_Resource_Endpoint__mdt cfg;
	private Integer timeout = 5000;
	public Map<String, String> extraHeaders;
	private Map<String, String> mapEndpointParamsValues;
	private static final String GET_HTTP = Integrations_Constants.HTTP_METHOD.GET;

	/*********************************************************************************************************
	 * @name			RestApiCallout
	 * @author			Renato Vera <k-renato.vera@kaseya.com>
	 * @created			26 / 09 / 2025
	 * @description		Constructor
	 * @param			config API_Resource_Endpoint__mdt : Custom Metadata type
	 **********************************************************************************************************/
	public RestApiCallout(API_Resource_Endpoint__mdt config) {
		this.cfg = config;
		this.mapEndpointParamsValues = new Map<String, String>();
	}

	/*********************************************************************************************************
	 * @name			RestApiCallout
	 * @author			Renato Vera <k-renato.vera@kaseya.com>
	 * @created			26 / 09 / 2025
	 * @description		Constructor
	 * @param			config API_Resource_Endpoint__mdt : Custom Metadata type
	 * @param			mapEndpointParamsValues Map<String,String> : params to replace in the endpoint
	 **********************************************************************************************************/
	public RestApiCallout(API_Resource_Endpoint__mdt config, Map<String, String> mapEndpointParamsValues) {
		this.cfg = config;
		this.mapEndpointParamsValues = mapEndpointParamsValues;
	}

	/*********************************************************************************************************
	 * @name			performCallout
	 * @author			RenatoVera <k-renato.vera@kaseya.com>
	 * @created			26 / 09 / 2025
	 * @description		makes the callout based on the configuration
	 * @param			requestBody String : The request body
	 * @return			HttpResponse response of the callout
	 **********************************************************************************************************/
	public HttpResponse performCallout(String requestBody) {
		Http http = new Http();
		HttpRequest req = new HttpRequest();
		timeout = cfg.Timeout__c != null ? Integer.valueOf(cfg.Timeout__c) : timeout;
		String fetchEndpoint = fetchParams(cfg.Endpoint__c);
		String endpoint = (cfg.NamedCredential__c != null)
			? 'callout:' + cfg.NamedCredential__c + fetchEndpoint
			: fetchEndpoint;

		req.setEndpoint(endpoint);
		req.setMethod(cfg.Method__c == null ? GET_HTTP : cfg.Method__c);
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

		//Headers from extraHeaders
		if (extraHeaders != null) {
			for (String k : extraHeaders.keySet()) {
				req.setHeader(k, String.valueOf(extraHeaders.get(k)));
			}
		}

		if (Integrations_Constants.APPLICATION_JSON_METHODS.contains(req.getMethod())) {
			req.setHeader(
				'Content-Type',
				(cfg.ContentType__c == null) ? Integrations_Constants.DEFAULT_CONTENT_TYPE : cfg.ContentType__c
			);
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
	 * @return   HttpResponse        The response from the HTTP callout. (HttpResponse)
	 */
	@TestVisible
	private String fetchParams(String grossParams) {
		for (String key : this.mapEndpointParamsValues.keySet()) {
			grossParams = grossParams.replace(
				Integrations_Constants.ENDPOINT_VAR_BEGIN_DELIM + key + Integrations_Constants.ENDPOINT_VAR_END_DELIM,
				mapEndpointParamsValues.get(key)
			);
		}
		return grossParams;
	}

	/*********************************************************************************************************
	 * @name			shouldRetry
	 * @author			Renato Vera <k-renato.vera@kaseya.com>
	 * @created			26 / 09 / 2025
	 * @description		decide if the request should be retried
	 * @param			res HttpResponse : The response from the callout
	 * @return			Boolean : True if the request should be retried
	 **********************************************************************************************************/
	private Boolean shouldRetry(HttpResponse res) {
		Integer s = res.getStatusCode();
		// retry on 429 (rate limit) and 5xx server errors
		return (s == 429) || (s >= 500 && s < 600);
	}

	/*********************************************************************************************************
	 * @name			exponentialBackoffSleep
	 * @author			Renato Vera <k-renato.vera@kaseya.com>
	 * @created			26 / 09 / 2025
	 * @description		Sleeps for a time based on the exponential backoff algorithm
	 * @param			base Long : long value
	 * @param			attempt Integer : number of attempts
	 **********************************************************************************************************/
	private void exponentialBackoffSleep(Long base, Integer attempt) {
		// Apex doesn't allow Thread.sleep; use a simple pause via Limits or just increase timeout between attempts
		timeout = Integer.valueOf(base * Math.pow(2, attempt));
	}
}