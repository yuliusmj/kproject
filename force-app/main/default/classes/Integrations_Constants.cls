/*************************************************************************************************************
 * @name			Integrations_Constants
 * @author			JulianHurtado <k-julian.hurtado@kaseya.com>
 * @created			19 / 09 / 2025
 * @description		Constant values for Integrations
 *
 * Changes (version)
 * -----------------------------------------------------------------------------------------------------------
 * 				No.		Date			Author					Description
 * 				----	------------	--------------------	----------------------------------------------
 * @version		1.0		2025-09-19		JulianHurtado			Class created
 *
 **************************************************************************************************************/
@isTest
@SuppressWarnings('PMD.ApexDoc,PMD.PropertyNamingConventions,PMD.FieldNamingConventions')
public without sharing class Integrations_Constants {
	//******************************************************************************************************
	// Groups
	//******************************************************************************************************
	public static final HtppMethods HTTP_METHOD {
		get {
			if (HTTP_METHOD == null) {
				HTTP_METHOD = new HtppMethods();
			}
			return HTTP_METHOD;
		}
		set;
	}
	public class HtppMethods {
		public final String POST = 'POST';
		public final String GET = 'GET';
		public final String PUT = 'PUT';
		public final String PATCH = 'PATCH';
		public final String M_DELETE = 'DELETE';
	}
	public static final Endpoints ENDPOINTS {
		get {
			if (ENDPOINTS == null) {
				ENDPOINTS = new Endpoints();
			}
			return ENDPOINTS;
		}
		set;
	}
	public class Endpoints {
		public final String ONESOURCE_ADDRESS_VALIDATION = 'OneSource_AddressValidation';
	}
	public static final ResponseCodeErrorMessageList RESPONSE_CODE_ERROR_MESSAGE_LIST {
		get {
			if (RESPONSE_CODE_ERROR_MESSAGE_LIST == null) {
				RESPONSE_CODE_ERROR_MESSAGE_LIST = new ResponseCodeErrorMessageList();
			}
			return RESPONSE_CODE_ERROR_MESSAGE_LIST;
		}
		set;
	}
	public class ResponseCodeErrorMessageList {
		public final String CODE_400 = 'Bad Request';
		public final String CODE_403 = 'Authentication/Authorization Error';
		public final String CODE_404 = 'Not Found';
		public final String CODE_500 = 'Server Error';
	}

	//******************************************************************************************************
	// End of groups
	//******************************************************************************************************
	//******************************************************************************************************
	// Logical section
	//******************************************************************************************************
	public static final String ENDPOINT_VAR_BEGIN_DELIM = '{';
	public static final String ENDPOINT_VAR_END_DELIM = '}';
	public static final String DEFAULT_CONTENT_TYPE = 'application/json';
	public static final Set<String> APPLICATION_JSON_METHODS = new Set<String>{
		HTTP_METHOD.PUT,
		HTTP_METHOD.POST,
		HTTP_METHOD.PATCH
	};
	//******************************************************************************************************
	// End of Logical section
	//******************************************************************************************************

	//******************************************************************************************************
	// OneSource Integration constants
	//******************************************************************************************************

	public static final OneSource_ResultSuccessStatus OS_RESULT_SUCCESS_STATUS {
		get {
			if (OS_RESULT_SUCCESS_STATUS == null) {
				OS_RESULT_SUCCESS_STATUS = new OneSource_ResultSuccessStatus();
			}
			return OS_RESULT_SUCCESS_STATUS;
		}
		set;
	}

	public class OneSource_ResultSuccessStatus {
		public final String CONFIRMED = 'CONFIRMED';
		public final String ERROR = 'ERROR';
		public final String CORRECTED = 'CORRECTED';
	}

	//******************************************************************************************************
	// End of OneSource Integration constants
	//******************************************************************************************************
}