/**
 * Class responsible for managing Callouts. This class contains methods for generating the REST request.
 *
 * @author Renato Vera
 * @version 2.0
 * @since 2025-09-30
 **/
public with sharing class CalloutManager {
	public static final String BEGIN_DELIMITATOR = '}';
	public static final String END_DELIMITATOR = '}';
	/**
	 * Performs an HTTP callout using the specified integration configuration and body.
	 * @param    integrationConfig   The integration configuration metadata. (API_Resource_Endpoint__mdt)
	 * @param    body                The body of the request. (String)
	 * @return   HttpResponse        The response from the HTTP callout. (HttpResponse)
	 */
	public static HttpResponse doCallout(
		API_Resource_Endpoint__mdt integrationConfig,
		String body,
		Map<String, String> mapEndpointParamsValues,
		Map<String, String> extraHeaders
	) {
		// Calculate the endpoint using the config metadata
		if (integrationConfig == null)
			throw new CalloutManagerException('No integration config found');
		String endpoint = integrationConfig.Endpoint__c;
		if (integrationConfig.NamedCredential__c != null && integrationConfig.NamedCredential__c != '') {
			String fetchedParams = (mapEndpointParamsValues != null)
				? fetchParams(integrationConfig.Endpoint__c, mapEndpointParamsValues)
				: integrationConfig.Endpoint__c;
			endpoint = 'callout:' + integrationConfig.NamedCredential__c + fetchedParams;
		}
		system.debug('ENDPOINT' + endpoint);
		return doCallout(integrationConfig.Method__c, endpoint, integrationConfig.ContentType__c, body, extraHeaders);
	}

	/**
	 * Replace the params given by the custom metadata with values provided in the method
	 * @param    grossParams   complete Endpoint with params to replace.
	 * @param    mapEndpointParamsValues   Map<String,String> Map of key->values to replace in the endpoint.
	 * @return   HttpResponse        The response from the HTTP callout. (HttpResponse)
	 */
	@TestVisible
	private static String fetchParams(String grossParams, Map<String, String> mapEndpointParamsValues) {
		for (String key : mapEndpointParamsValues.keySet()) {
			grossParams = grossParams.replace(
				BEGIN_DELIMITATOR + key + END_DELIMITATOR,
				mapEndpointParamsValues.get(key)
			);
		}
		return grossParams;
	}
	/**
	 * Performs an HTTP callout with detailed parameters including method, endpoint, body, parameters, and headers.
	 * @param    method              The HTTP method to use for the callout. (String)
	 * @param    endpoint            The endpoint URL for the callout. (String)
	 * @param    bodyBlob            The body of the request as a Blob. (Blob)
	 * @param    bodyString          The body of the request as a String. (String)
	 * @param    parameters          A map of query parameters to include in the request. (Map<String, String>)
	 * @param    headers             A map of headers to include in the request. (Map<String, String>)
	 * @return   HttpResponse        The response from the HTTP callout. (HttpResponse)
	 */
	public static HttpResponse doCallout(
		String method,
		String endpoint,
		String contentType,
		String bodyString,
		Map<String, String> headers
	) {
		Http callout = new Http();
		HttpRequest request = new HttpRequest();
		request.setMethod(method);
		request.setHeader('content-type', contentType);
		if (String.isNotBlank(bodyString)) {
			request.setBody(bodyString);
		}
		// Set Headers if any
		/*if (headers != null) {
            for (String key : headers.keySet()) {
                request.setHeader(key, headers.get(key));
            }
        }*/
		for (String header : headers.keySet()) {
			request.setHeader(header, headers.get(header));
		}

		request.setEndpoint(endpoint);
		return callout.send(request);
	}

	private class CalloutManagerException extends Exception {
	}
}