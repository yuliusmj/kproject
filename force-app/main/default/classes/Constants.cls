/**
 * @author Deloitte
 * @date 28-03-2025
 * @description Contains Constants used throughout the application
 * Modification Log:
 * Version  Date        Author    Modification
 * 1.0      28-03-2025  Deloitte  InitalVersion
 **/
public inherited sharing class Constants {
	//Oracle Response Processing Constants
	public static final String ORACLE_RESPONSE_SOURCE_TRANSACTION_ID = 'sourceTransactionID';
	public static final String ORACLE_RESPONSE_SOURCE_SYSTEM = 'sourceSystem';
	public static final String ORACLE_RESPONSE_TRANSACTION_TYPE = 'transactionType';
	public static final String ORACLE_RESPONSE_ORDER_NUMBER = 'orderNumber';
	public static final String ORACLE_RESPONSE_ORACLE_ORDER_ID = 'oracleOrderID';
	public static final String ORACLE_RESPONSE_ORDER_INTEGRATION_EVENT_ID = 'orderIntegrationEventId';
	public static final String ORACLE_RESPONSE_ORACLE_VALIDATION_STATUS = 'oracleValdiationStatus';
	public static final String ORACLE_RESPONSE_ORACLE_VALIDATION_MESSAGE = 'oracleValidationMessage';
	public static final String ORACLE_RESPONSE_LINE_TIEBACKS = 'lineTiebackIds';
	public static final String ORACLE_RESPONSE_SF_ORDER_LINE_NUMBER = 'salesforceOrderLineNumber';
	public static final String ORACLE_RESPONSE_RMA_ELIGIBLE = 'rmaEligible';
	public static final String ORACLE_RESPONSE_TRUE = 'true';
	public static final String ORACLE_RESPONSE_FALSE = 'false';
	public static final String ORACLE_RESPONSE_ORDER_LINES = 'oracleOrderLines';
	public static final String ORACLE_RESPONSE_ORDER_LINE_ID = 'oracleOrderLineID';
	public static final String ORACLE_RESPONSE_FULFILLMENT_LINE_ID = 'fulfillmentLineID';
	public static final String ORACLE_RESPONSE_SF_DEVICE_REC_ID = 'sfDeviceRecId';
	public static final String ORACLE_RESPONSE_MAC = 'mac';
	public static final String ORACLE_ORDER_LINE_ID_FIELD = 'oracleOrderLineID__c';
	public static final String FULFILLMENT_LINE_ID_FIELD = 'fulfillmentLineID__c';
	public static final String ORDER_ITEM_ORDER_LINE_FIELD = 'Order_Line__c';
	public static final String DEVICE_ORDER_PRODUCT_FIELD = 'Order_Product__c';
	public static final String ORACLE_PROCESSING_SUCCESS_STATUS = 'Success';
	public static final String ORACLE_PROCESSING_ERROR_STATUS = 'Error';
	public static final String ORACLE_RESPONSE_PROCESSING_CLASS = 'OracleOrderResponseProcessor';

	//Response Related Constants
	public static final String STATUS_PROCESSED = 'Processed';
	public static final String STATUS_BO_UPDATE_FAILED = 'BO update failed';
	public static final String ERROR_CATEGORY_SF_INTERNAL = 'Salesforce Internal Error';
	public static final String ERROR_CATEGORY_DATA = 'Data Error';
	public static final String ERROR_CATEGORY_SERVICE = 'Service Error';
	public static final String ERROR_CATEGORY_ROW_LOCK = 'ROW_LOCK';
	public static final String ERROR_CATEGORY_BAD_RESPONSE = 'Bad Response';

	//Integration Event Status Constants
	public static final String INTEGRATION_EVENT_STATUS_PAYLOAD_CREATED = 'Payload Created';
	public static final String INTEGRATION_EVENT_STATUS_PAYLOAD_CREATION_FAILED = 'Payload Creation Failed';
	public static final String INTEGRATION_EVENT_STATUS_EVENT_PUBLISHED = 'Event Published';
	public static final String INTEGRATION_EVENT_STATUS_EVENT_PUBLISHED_FAILED = 'Event Published Failed';
	public static final String INTEGRATION_EVENT_STATUS_EVENT_COMPLETED = 'Event Completed';
	public static final String INTEGRATION_EVENT_STATUS_BO_UPDATE_FAILURE = 'BO Updated Failure';

	public static final String INTEGRATION_EVENT_STATUS_BAD_RESPONSE = 'Bad Response';
	public static final String INTEGRATION_EVENT_STATUS_READY_TO_RESYNC = 'Ready to Resync';
	public static final String INTEGRATION_EVENT_UUID = 'EventUuid';
	public static final String INTEGRATION_EVENT_STATUS_PROCESSED = 'Processed';
	public static final String INTEGRATION_EVENT_STATUS_ERROR = 'Error';
	public static final String INTEGRATION_EVENT_STATUS_SUCCEEDED = 'Succeeded';
	public static final String BUSINESS_EVENT_ACCOUNT_ACTIVATION = 'Account Activation';
	public static final String BUSINESS_EVENT_ACCOUNT_UPDATE = 'Account Update';
	public static final String BUSINESS_EVENT_CONTACT_CREATE = 'Contact Create';
	public static final String BUSINESS_EVENT_CONTACT_UPDATE = 'Contact Update';
	public static final String BUSINESS_EVENT_ADDRESS_CREATE = 'Address Create';
	public static final String BUSINESS_EVENT_ADDRESS_UPDATE = 'Address Update';

	//Payload Related Constants
	public static final String OBJECT_PREFIX = 'Object';
	public static final String OBJECT_NUMBER_KEY = 'objectNumber';
	public static final String OBJECT_PAYLOAD_SUFFIX = '_Payload__c';
	public static final String PRIMARY_CONTACT_KEY = 'primaryContact';
	public static final String PRIMARY_SHIP_TO_ADDRESS_KEY = 'primaryShipToAddress';
	public static final String PRIMARY_BILL_TO_ADDRESS_KEY = 'primaryBillToAddress';
	public static final String PAYMENT_TERM_KEY = 'Payment_Term__c';
	public static final String PAYMENT_METHOD_KEY = 'Payment_Method__c';
	public static final String TRANSACTION_TYPE_KEY = 'transactionType';
	public static final String ID_KEY = 'Id';
	public static final String ACCOUNT_ID_KEY = 'AccountId';
	public static final String ACCOUNT_C_KEY = 'Account__c';
	public static final String ACCOUNT_R_KEY = 'Account__r';
	public static final String ACCOUNT_OBJECT = 'Account';
	public static final String CONTACT_OBJECT = 'Contact';
	public static final String CONTACT_TYPE = 'Contact';
	public static final String ADDRESS_TYPE = 'Address';
	public static final String ADDRESS_OBJECT = 'Address__c';
	public static final String ADDRESS_OBJECT_META_RECORD = 'Address_c';
	public static final String TYPE_KEY = 'Type';
	public static final String CUSTOMER_ACCOUNT_NUMBER_KEY = 'Customer_Account_Number__c';
	public static final String UNIVERSAL_ACCOUNT_NUMBER_KEY = 'UniversalAccountNumber';
	public static final String ACCOUNT_PARTY_ID = 'AccountPartyId';
	public static final String ACCOUNT_PARTY_NAME = 'AccountPartyName';
	public static final String ACCOUNT_PARTY_NUMBER = 'AccountPartyNumber';
	public static final String ACCOUNT_ORACLE_ID = 'Account.Oracle_Id__c';
	public static final String ACCOUNT_ADDRESS_PARTY_ID = 'Account__r.Party_Id__c';
	public static final String ACCOUNT_ADDRESS_PARTY_NAME = 'Account__r.Party_Name__c';
	public static final String ACCOUNT_ADDRESS_PARTY_NUMBER = 'Account__r.Party_Number__c';
	public static final String ACCOUNT_ADDRESS_ORACLE_ID = 'Account__r.Oracle_Id__c';
	public static final String WITH_SECURITY_ENFORCED = ' WITH SECURITY_ENFORCED';
	public static final String LIMIT_CLAUSE = ' LIMIT ';
	public static final String WHERE_CLAUSE = ' WHERE ';
	public static final String AND_OPERATOR = ' AND ';
	public static final String SELECT_CLAUSE = 'SELECT ';
	public static final String FROM_CLAUSE = ' FROM ';
	public static final String ORDER_BY = ' ORDER BY ';
	public static final String ORACLE_ID = 'Oracle_Id__c';
	//Out Of Office Related Constants
	//Integration Event related Constants
	public static final String INTEGRATION_EVENT_OBJECT_PRODUCT = 'Product2';
	public static final String INTEGRATION_EVENT_OBJECT_ACCOUNT = 'Account';
	public static final String INTEGRATION_EVENT_OBJECT_CONTACT = 'Contact';
	public static final String INTEGRATION_EVENT_OBJECT_ADDRESS = 'Address';
	public static final String INTEGRATION_EVENT_OBJECT_ADDRESS_C = 'Address_c';
	public static final String INTEGRATION_EVENT_OBJECT_ORDER = 'Order';
	public static final String INTEGRATION_EVENT_OBJECT_ORDERITEM = 'OrderItem';

	public static final String INTEGRATION_EVENT_CREATION_FAILED = 'Integration Event Creation Failed';
	public static final String INTEGRATION_EVENT_TYPE_CREATE = 'Create';
	public static final String INTEGRATION_EVENT_TYPE_UPDATE = 'Update';
	public static final String INTEGRATION_EVENT_STATUS_COMPLETED = 'Completed';
	public static final String INTEGRATION_EVENT_STATUS_FAILED = 'Failed';
	public static final String INTEGRATION_EVENT_STATUS_IE_CREATED = 'IE Created';
	public static final String INTEGRATION_EVENT_STATUS_DISCARDED = 'Discarded';
	public static final String INTEGRATION_EVENT_STATUS_NEW = 'New';
	public static final String INTEGRATION_EVENT_STATUS_SUCCESS = 'Success';
	public static final String INTEGRATION_EVENT_STATUS_READY_FOR_SYNC = 'Ready for Sync';
	public static final String INTEGRATION_EVENT_SUBSTATUS_EVENT_PUBLISHED = 'Event Published';
	public static final String INTEGRATION_EVENT_SUBSTATUS_EVENT_CONSUMED = 'Event Consumed';
	public static final String INTEGRATION_EVENT_SUBSTATUS_RESPONSE_TIMED_OUT = 'Response Timed Out';
	public static final String INTEGRATION_EVENT_ERROR_TYPE_SERVICE_ERROR = 'Service Error';
	public static final String INTEGRATION_EVENT_TRIGGER_HELPER = 'IntegrationEventTriggerHelper';
	public static final String IE_TRIGGER_HELPER_PUBLISH_METHOD = 'publishRecordSyncForIntegrationEvents';
	public static final String IE_TRIGGER_HELPER_PROCESSRECORD_METHOD = 'processIntegrationRecords';
	public static final String ORACLE_TARGET_SYSTEM = 'Oracle';
	public static final String ORACLE_RESPONSE_TRUE_VALUE = 'Oracle Response True Value';
	public static final String DEVICE_ORACLE_ORDER_LINE_ID_FIELD = 'Device Oracle Order Line ID';
	public static final String DEVICE_FULFILLMENT_LINE_ID_FIELD = 'Device Fulfillment Line ID';
	public static final String ORDER_ITEM_ORACLE_ORDER_LINE_ID_FIELD = 'Order Item Oracle Order Line ID';
	public static final String ORDER_ITEM_FULFILLMENT_LINE_ID_FIELD = 'Order Item Fulfillment Line ID';
	public static final String K1_TARGET_SYSTEM = 'KaseyaOne';
	public static final String INTEGRATION_EVENT_TARGET_SYSTEM_LIFEBOAT = 'LifeBoat';
	public static final String INTEGRATION_EVENT_TARGET_SYSTEM_SALESFORCE = 'Salesforce';
	public static final String INTEGRATION_EVENT_STATUS_QUEUED = 'Queued';
	public static final String INTEGRATION_EVENT_DIRECTION_OUTBOUND = 'Outbound';
	public static final String INTEGRATION_EVENT_DIRECTION_INBOUND = 'Inbound';
	public static final String INTEGRATION_EVENT_TYPE_PO_RECIEVED = 'PO Received';
	public static final String JSON_FILE_TYPE = 'JSON';
	public static final String PDF_FILE_TYPE = 'PDF';
	public static final String IE_CREATED = 'IE Created';
	public static final String VALIDATION_PENDING = 'Validation Pending';
	public static final String ERROR_HANDLER_RECORD_ID_FIELD = 'RecordId__c';
	public static final String INTEGRATION_NAME = 'NewOrderSync';

	public static final String INTEGRATION_EVENT_OBJECT_LEGALENTITY = 'LegalEntity';

	//Oracle Response Processing Constants
	public static final String BUSINESS_EVENT_DEVICE_FULFILLMENT = 'Device Fulfilment';
	public static final String FULFILLMENT_STATUS_AWAITING_SHIPPING = 'Awaiting Shipping';
	public static final String FULFILLMENT_STATUS_SHIPPED = 'Shipped';
	public static final String FULFILLMENT_STATUS_DELIVERED = 'Delivered';
	public static final String FULFILLMENT_STATUS_READY_FOR_SHIPMENT = 'Ready for Shipment';
	public static final String DEVICE_STATUS_SHIPPED = 'Shipped';
	public static final String DEVICE_STATUS_DELIVERED = 'Delivered';
	//Integration Field Set Names

	//Product Status
	public static final String EARLY_ADOPTION = 'Early Adoption';

	//Payload related Constants
	public static final String PAYLOAD_GENERATOR_INTEGRATION_EVENTS = 'integrationEvents';
	public static final String PAYLOAD_GENERATOR_HEADER = 'header';
	public static final String PAYLOAD_GENERATOR_GROUPID = 'GroupID__c';
	public static final String PAYLOAD_GENERATOR_EVENT_TYPE = 'EventType__c';
	public static final String PAYLOAD_GENERATOR_BUSINESS_IDENTIFIER = 'businessIdentifier';
	public static final String PAYLOAD_GENERATOR_ADDRESS_C = 'Address__c';
	public static final String PAYLOAD_GENERATOR_PRIMARY_CONTACT = 'Primary_Contact__c';
	public static final String PAYLOAD_GENERATOR_DATE_FORMAT = 'yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'';
	public static final String PAYLOAD_GENERATOR_PARENT_ID = 'ParentId';
	public static final String PAYLOAD_GENERATOR_RECORD_ID = 'RecordId__c';
	public static final String PAYLOAD_GENERATOR_RECORD_TYPE = 'RecordType';
	public static final String PAYLOAD_GENERATOR_PARENT = 'Parent';
	public static final String PAYLOAD_GENERATOR_CURRENCY_ISO_CODE = 'CurrencyIsoCode';
	public static final String PAYLOAD_GENERATOR_TYPE_KEY = 'Type';
	public static final String PAYLOAD_GENERATOR_ADDRESS_OBJECT_ADDRESSTYPE = 'Address_Type__c';
	public static final String PAYLOAD_GENERATOR_ADDRESS_TYPE_SHIP_TO = 'Ship-To';
	public static final String PAYLOAD_GENERATOR_ADDRESS_TYPE_BILL_TO = 'Bill-To';
	public static final String PAYLOAD_GENERATOR_SYSTEM_NAME_KEY = 'systemName';
	public static final String PAYLOAD_GENERATOR_SALESFORCE_VALUE = 'Salesforce';
	public static final String PAYLOAD_GENERATOR_TRANSACTION_ID_KEY = 'transactionId';
	public static final String PAYLOAD_GENERATOR_REQUEST_ID_KEY = 'requestId';
	public static final String PAYLOAD_GENERATOR_REQUEST_PRIORITY_KEY = 'requestPriority';
	public static final String PAYLOAD_GENERATOR_NORMAL_PRIORITY = 'Normal';
	public static final String PAYLOAD_KEY = 'payload';
	public static final String LINES_KEY = 'lines';
	public static final String ORDER_INTEGRATION_EVENT_ID_KEY = 'orderIntegrationEventId';
	public static final String ORDER_LINE_INTEGRATION_EVENT_ID_KEY = 'orderLineIntegrationEventId';
	public static final String PAYLOAD_GENERATOR_ACCOUNT_TYPE = 'Type';
	public static final String PAYLOAD_GENERATOR_ACCOUNT_SUBTYPE = 'Account_Subtype__c';

	//Business Event Constants for Payload Generator
	public static final String PAYLOAD_GENERATOR_BUSINESS_EVENT = 'BusinessEvent__c';

	//Order Constants
	public static final String ORDER_STATUS_NEW = 'New';
	public static final String ORDER_STATUS_IN_PROGRESS = 'In Progress';
	public static final String ORDER_STATUS_ON_HOLD = 'On Hold';
	public static final String ORDER_STATUS_COMPLETED = 'Activated';
	public static final String ORDER_TRIGGER_HELPER = 'OrderTriggerHelper';
	public static final String ORDER_TRIGGER_HELPER_CREATE_ACCOUNT_METHOD = 'createAccountRecordInIntegrationEvent';
	public static final String ORDER_ORACLE_ID = '123456';
	public static final String ORDER_ORACLE = 'ORACLE';
	public static final String ORDER_ORACLE_PAYLOAD_FILE_NAME = 'Order_Payload_';

	//Order Product Constants
	public static final String ORDER_PRODUCT_STATUS_AWAITING_FULFILLMENT = 'Awaiting Fulfillment/ Provisioning';
	//Order Constants
	public static final String ACCOUNT_TRIGGER_HELPER = 'AccountTriggerHelper';
	public static final String ACCOUNT_TRIGGER_HELPER_CREATE_IE_METHOD = 'createIntegrationEventsOnAccountUpdate';

	//Out Of Office Record Related Constants
	public static final string MESSAGE = 'Out Of Office Today';

	//ErrorLogService Related Constants
	public static final string ERROR_LOG_SERVICE_MESSAGE = 'Message: ';
	public static final string ERROR_LOG_SERVICE_FIELDS = '; Fields: ';
	public static final string ERROR_LOG_SERVICE_STATUS_CODE = '; Status Code: ';

	//User Record Related Constants
	public static final String EMAILENCODINGKEY = 'UTF-8';
	public static final String LOCALESIDKEY = 'en_US';
	public static final String LANGAUGELOCALEKEY = 'en_US';
	public static final String OUTOFOFFICEEMAIL = 'useroutofoffice@ooo.com';
	public static final String TIMEZONESIDKEY = 'America/Los_Angeles';
	public static final String STANDARD_USER = 'Standard User';
	public static final String ALIAS = 'AL';

	//Lead Record Related Constants
	public static final String LAST_NAME = 'lastName';
	public static final String LEAD_SUPER_FAMILY_IT_OPERATIONS = 'IT Operations';
	public static final String LEAD_SUPER_FAMILY_ENDPOINT = 'Endpoint';
	public static final String LEAD_SOURCE = 'Blog';
	public static final String LEAD_ORIGIN = 'Marketing';
	public static final String LEAD_COMPANY_I = 'test Company 1';
	public static final String LEAD_STATUS_MQL = 'Marketing Qualified Lead';
	public static final String LEAD_STATUS_MEL = 'Marketing Engaged Lead';

	//Status
	public static final String DRAFT = 'Draft';
	public static final String ACTIVE = 'Active';
	public static final String INACTIVE = 'Inactive';
	public static final String APPROVED = 'Approved';
	public static final String PROCESSING = 'Processing';
	public static final String QUEUED = 'Queued';

	//Order Product Status
	public static final String READY_FOR_PROVISIONING_FULFILLMENT = 'Ready for Provisioning/Fulfillment';
	public static final String ON_HOLD_STATUS = 'On Hold';

	//Case Status
	public static final String CASE_STATUS_NEW = 'New';

	//Product Family
	public static final String HARDWARE = 'Hardware';
	public static final String SOFTWARE = 'Software';
	public static final String PRODUCT_SAAS = 'SAAS';
	public static final String PRODUCT_LICENSE = 'License';

	//Picklist Values
	public static final String QUALIFICATION = 'QUALIFICATION';
	public static final String CASE_TYPE_MANUAL_PROVISIONING = 'Manual Provisioning';
	public static final String FULFILLMENT_TYPE_MANUAL = 'Manual';
	public static final String ONETIME = 'OneTime';
	public static final String PERCENTAGE = 'Percentage';

	//Class-Method Names
	public static final String ERRORTEST = 'ErrorLogServiceTest';
	public static final String GENERICMETHODEXCEPTION = 'TestGenericException';
	public static final String BATCH_EXECUTE = 'execute';
	public static final String PRICING_UPDATE_BATCH = 'PricingUpdateBatch';
	public static final String TRIGGER_PRICING_BATCH = 'triggerPricingBatch';
	public static final String FX_RATE_CONTROLLER = 'FxRateController';
	public static final String GET_PRICEBOOK_ENTRIES = 'getPricebookEntries';
	public static final String GET_ATTRIBUTE_BASED_ADJUSTMENTS = 'getAttributeBasedAdjustments';
	public static final String GET_ALL_EXCHANGE_RATES = 'getAllExchangeRates';

	//Test Class Data Values
	public static final String TESTNAME = 'Test Name';
	public static final String TESTEMAIL = 'TestData@setup.com';
	public static final String US = 'US';
	public static final String USDCODE = 'USD';
	public static final String CADCODE = 'CAD';
	public static final String DEFAULT_VALUE = 'Default';
	public static final String UNITEDSTATES = 'United States';
	public static final String AL = 'AL';
	public static final String ALABAMA = 'Alabama';
	public static final String BIRMINGHAM = 'Birmingham';
	public static final String BILLING_STREET = '123';
	public static final String ZIPCODE = '35005';
	public static final String HW_PRODUCT_NAME = 'HW Product';
	public static final String SW_PRODUCT_NAME = 'SW Product';
	public static final String HW_PRODUCT_CODE = 'HWPROD';
	public static final String SW_PRODUCT_CODE = 'SWPROD';
	public static final String ITG = 'ITG';
	public static final String OBJECT_QUOTE = 'Quote';
	public static final String STRING_ID = 'id';
	public static final String PHONE = '123123213';
	public static final String TEST = 'TEST';

	//CRON EXPRESSIONS
	public static final String PROCESS_ORDER_PRODUCT_BATCH_CRON = '0 0 9 ? * *';
	public static final String ASSET_STATUS_UPDATE_BATCH_CRON = '0 0 2 * * ?';
	public static final String SLA_72_HOURS_BATCH_CRON = '0 0 * * * ?';
	public static final String INTEGRATION_RETRY_BATCH_CRON = '0 0 * * * ?';

	//Strings for formatting
	public static final String SPACE_HYPHEN_FORMAT = ' - ';

	//Record Type Developer Names
	public static final String CASE_SALES_OPS_REC_TYPE = 'Sales_Ops';

	//Quote Approval Contoller constants
	public static final String RECORD_ID = 'recordId';
	public static final String SUBMITTER = 'submitter';
	public static final String SUBMISSION_COMMENTS = 'submissionComments';
	public static final String APPROVAL_PRE_CHECK = 'var_approvalPreCheck';
	public static final String NO_APPROVALS_TRIGGERED = 'varT_noApprovalsTriggered';
	public static final String VALIDATION_TRIGGERS = 'var_anyValidationTriggerOutput';
	public static final String VALIDATION_MESSAGE = 'var_ValidationMessageOutput';
	public static final String QUOTE_ID = 'quoteId';
	public static final String QUOTE_VALIDATION = 'var_QuoteValidation';
	public static final String QUOTE_APPROVAL_CONTROLLER = 'QuoteApprovalController';
	public static final String INVOKE_FLOW = 'invokeFlow';
	public static final String SUBMIT_QUOTE_FOR_APPROVAL = 'submitQuoteForApproval';

	//CLM MethodName and Status
	public static final String INAPPROVALPROCESS_METHODNAME = 'inApprovalProcess';
	public static final String REJECTED = 'Rejected';
	public static final String SENDFOREXTERNALREVIEW_METHODNAME = 'sendForExternalReview';
	public static final String EXTERNALREVIEWCOMPLETED_METHODNAME = 'externalReviewCompleted';
	public static final String SENDFORDEALDESKREVIEW_METHODNAME = 'sendForDealDeskReview';
	public static final String INDEALDESKREVIEW_METHODNAME = 'inDealDeskReview';
	public static final String SENDFORLEGALREVIEW_METHODNAME = 'sendForLegalReview';
	public static final String INLEGALREVIEW_METHODNAME = 'inLegalReview';
	public static final String INREQUESTERREVIEW_METHODNAME = 'inRequesterReview';
	public static final String CANCELCONTRACT_METHODNAME = 'canceledContract';
	public static final String READYFORSIGNATURE_METHODNAME = 'readyForSignature';
	public static final String MSAINREQUESTERREVIEW_METHODNAME = 'MSAInRequesterReview';
	public static final String BAAINREQUESTERREVIEW_METHODNAME = 'BAAInRequesterReview';
	public static final String MSAINLEGALREVIEW_METHODNAME = 'MSAInLegalReview';
	public static final String BAAINLEGALREVIEW_METHODNAME = 'BAAInLegalReview';

	public static final String DRAFT_STATUS = 'Draft';
	public static final String INAPPROVALPROCESS_STATUS = 'In Approval Process';
	public static final String NEGOTIATING_STATUS = 'Negotiating';
	public static final String SENDFORINTERNALREVIEW_STATUS = 'Send for Internal Review';
	public static final String SENDFORDEALDESKREVIEW_STATUS = 'Send for Deal Desk Review';
	public static final String INDEALDESKREVIEW_STATUS = 'In Deal Desk Review';
	public static final String SENDFORLEGALREVIEW_STATUS = 'Send for Legal Review';
	public static final String INLEGALREVIEW_STATUS = 'In Legal Review';
	public static final String INREQUESTERREVIEW_STATUS = 'In Requester Review';
	public static final String CANCELCONTRACT_STATUS = 'Canceled';
	public static final String READYFORSIGNATURE_STATUS = 'Ready for Signature';
	public static final String MSAINREQUESTERREVIEW_STATUS = 'MSA In Requester Review';
	public static final String BAAINREQUESTERREVIEW_STATUS = 'BAA In Requester Review';
	public static final String MSAINLEGALREVIEW_STATUS = 'MSA In Legal Review';
	public static final String BAAINLEGALREVIEW_STATUS = 'BAA In Legal Review';

	public static final String IS_SUCCESS = 'isSuccess';
	public static final String FINALSTATUSVALUE = 'finalStatusValue';
	public static final String ERROR = 'error';
	public static final String UNKNOWN_METHODNAME = 'Unknown methodName: ';
	public static final String REGULAR = 'Regular';
	public static final String CONTRACT_OBJECT_NAME = 'Contract';
	public static final String STANDARD = 'Standard';

	public static final String PHYSICAL_DEVICE = 'Physical Device';
	public static final String DEVICE_ACCESSORIES = 'Device Accessories';
	public static final String PRODUCT_ACTIVATION = 'Product Activation';
	public static final String UPDATE_PRODUCT = 'Update Product';

	public static final String NDA = 'NDA';
	public static final String MUTUAL = 'Mutual';

	public static final String CLM_SEND_FOR_LEGAL_APPROVAL = 'CLM_Send_for_Legal_Approval';

	//Account status
	public static final String LEGAL_HOLD = 'Legal Hold';
	public static final String CREDIT_TRADE_HOLD = 'Credit or Trade Hold';

	//Field API Names
	public static final String BILL_TO_ACCOUNT = 'Bill_To_Account__c';
	public static final String DEAL_DESK = 'DEAL_DESK';

	//Milestone Related Constants
	public static final String MT_FIRST_RESPONSE = 'First Response';
	public static final String MT_CASE_RESOLUTION = 'Case Resolution SLA';
	public static final String MT_FIRST_RESPONSE_TEST = 'First Response Test';
	public static final String MT_CASE_RESOLUTION_TEST = 'Case Resolution SLA Test';

	//Case Record Type Developer Names
	public static final String CASE_BILLING_OPS_DEV = 'Billing';
	public static final String CASE_REN_OPS_DEV = 'Renewal_Ops';
	public static final String CASE_BIS_OPS_DEV = 'Standard_Support_Request';
	public static final String CASE_SKU_DEV = 'SKU_Support_Request';

	//Object Api Names
	public static final String CASE_OBJ = 'Case';
	public static final String APIMETHOD = 'POST';
	public static final String HEADERKEY = 'Content-Type';
	public static final String HEADERVALUE = 'application/json';
	// Trial Extension
	public static final String TRIAL_EXTENSION = 'Trial Extension';
	public static final String TRIAL = 'Trial';
	public static final String AMENDMENT = 'Amendment';
	public static final String CANCELLATION = 'Cancellation';
	public static final String BUNDLE = 'Bundle';
	public static final String WARRANTY_REPLACEMENT = 'Warranty Replacement';

	//Approval Submission Status
	public static final String INPROGRESS = 'InProgress';

	//LTCI-4948
	public static final String REVENUE_EVENT_NAME = 'EventUploadService';
	public static final String REVENUE_ACTION = 'Release';
	public static final String REVENUE_DISTRIBUTION_METHOD_HARDWARE = 'Point In Time';
	public static final String PRIOR_PERIOD_REVENUE_METHOD = 'Catch-up in Current Period';
	public static final String USER_COMMENTS = 'perform revenue release';
	public static final String REVENUE_DISTRIBUTION_METHOD = 'Ratable';
	public static final String KEY_QUANTITY = 'quantity';
	public static final String KEY_PERCENTAGE = 'percentage';
	public static final String DEPLOYMENT_TYPE_ON_PREM = 'On Prem';
	public static final String HASH = '#';
	public static final String PCS_PRODUCT_CODE = 'PCSSKU_STANDALONE';
	public static final String PERCENTAGE_VALUE = '100';

	//Auto-Renewal Constants
	public static final String PATCH = 'PATCH';
	public static final String REFQUOTE = 'refQuote';
	public static final String RENEWALDATE_120 = '120';
	public static final String RENEWALDATE_2 = '2';
	public static final String RENEWAL = 'Renewal';
	public static final String BOOKED = 'Booked';
	public static final String AUTO_RENEWAL = 'Auto-Renewal';
	public static final String DIRECT_QUOTING = 'Direct Quoting';
	public static final String ASSET_RENEWAL_NOTIF_CRON = '0 0 0 1 * ?';
	public static final String RENEW = 'Renew';
	//LTCI-5180
	public static final String CANCEL_AND_REPLACE = 'Cancel and Replace';

	// LTCI-6533
	public static final String TRANSACTION_NEW = 'New';
	public static final String CROSS_SELL = 'Cross-Sell';

	//LTCI-3088
	public static final String ORACLESYNCSTATUS_READYFORRESYNC = 'Ready for Re-Sync';
	public static final String INTEGRATION_EVENT_OBJECT_INVOICE = 'Invoice';
	public static final String INTEGRATION_EVENT_OBJECT_CREDITMEMO = 'CreditMemo';
	public static final String INTEGRATION_EVENT_OBJECT_CREDITMEMOINVOICEAPPLICATION = 'CreditMemoInvApplication';
	public static final String ORACLE_SYNC_STATUS_IN_PROGRESS = 'In Progress';
	public static final String CREDITMEMO_SOURCEACTION_STANDALONE = 'Standalone';
	public static final String CREDITMEMO_SOURCEACTION_VOIDPOSTEDINVOICE = 'VoidPostedInvoice';
	public static final String CREDITMEMO_SOURCEACTION_INVOICE = 'Invoice';
	public static final String CREDITMEMO_SOURCEACTION_NEGATIVEINVOICELINECONVERSION = 'NegativeInvoiceLineConversion';
	public static final String PLATFORMEVENT_FIELD_HEADER = 'Header__c';
	public static final String PLATFORMEVENT_FIELD_GROUPID = 'GroupID__c';
	public static final String PLATFORMEVENT_FIELD_EVENTTYPE = 'EventType__c';
	public static final String PLATFORMEVENT_FIELD_RECORD_ID = 'RecordId__c';
	public static final String PLATFORMEVENT_FIELD_BUSINESS_EVENT = 'BusinessEvent__c';
	public static final String PLATFORMEVENT_FIELD_INTEGRATIONEVENTS = 'IntegrationEvents__c';
	public static final String INTEGRATION_EVENT_STATUS_IN_PROGRESS = 'In Progress';
	public static final String INVOICE_POSTED_STATUS = 'Posted';
	public static final String SEMI_COLON = ';';
	//LTCI-5696
	public static final String REASON_CROSS_SELL = 'Cross-Sell';
	public static final String REASON_TRANSFER = 'Transfer';
	public static final String REASON_REPLACE = 'Replace';
	public static final String REASON_CANCEL = 'Cancel';
	public static final String REASON_ADD_ON = 'Add-On';
	public static final String REASON_UPSELL = 'Upsell';
	public static final String REASON_DOWNSELL = 'Downsell';
	public static final String REASON_NEW = 'New';
	public static final String REASON_FLAT_RENEWAL = 'Flat Renewal';
	public static final String REASON_HARDWARE_UPGRADE = 'Hardware Upgrade';
	public static final String REASON_SOFTWARE_UPGRADE = 'Software Upgrade';
	public static final String REASON_FIELD_UPGRADE_CAPACITY = 'Field Upgrade (capacity)';
	public static final String REASON_RETENTION_UPGRADE = 'Retention Upgrade';
	public static final String REASON_WINBACK = 'Winback';
	public static final String REASON_REINSTATEMENT = 'Reinstatement';
	public static final String REASON_WINBACK_REINSTATEMENT = 'Winback/Reinstatement';
	public static final String TRANSACTION_TYPE_TRANSFERS = 'Transfers';
	public static final String TRANSACTION_TYPE_NEW_BUSINESS = 'New Business';
	public static final String TRANSACTION_TYPE_DEVICE_UPGRADE = 'Device Upgrade';
	public static final String TRANSACTION_TYPE_K365_UPGRADE = 'Kaseya 365 Upgrade';
	public static final Integer ZERO = 0;
	public static final Integer ONE = 1;
	public static final String ALL = 'All';

	//LTCI-292
	public static final String GR4VY_ERRORMESSAGE_REQUESTBODYEMPTY = 'Request body is empty.';
	public static final String GR4VY_SUCCESSMESSAGE_PAYMENTMETHODSTOREDSUCCESSFULLY = 'Payment method stored successfully.';
	public static final String GR4VY_ERRORMESSAGE_ERRORPROCESSINGREQUEST = 'Error processing request: ';
	public static final String GR4VY_ERRORMESSAGE_MISSINGREQUIREDPARAMS = 'Missing required parameters. customerId and tokenizedValue are required.';
	public static final String GR4VY_RESPONSEPATH_EXTERNALIDENTIFIER = 'target.buyer.external_identifier';
	public static final String GR4VY_RESPONSEPATH_PAYMENTMETHODID = 'target.payment_method.id';
	public static final String GR4VY_CARDPAYMETHOD_PROCESSINGMODE = 'External';
	public static final String GR4VY_CARDPAYMETHOD_STATUS = 'Active';
	public static final Integer GR4VY_RESTRESOURCE_STATUSCODE_400 = 400;
	public static final Integer GR4VY_RESTRESOURCE_STATUSCODE_500 = 500;
	public static final Integer GR4VY_RESTRESOURCE_STATUSCODE_200 = 200;
	public static final String GR4VY_RESPONSEPATH_PAYMENTMETHODBIN = 'target.payment_method.details.bin';
	public static final String GR4VY_RESPONSEPATH_PAYMENTMETHODSCHEME = 'target.payment_method.scheme';
	public static final String GR4VY_RESPONSEPATH_CARDLABEL = 'target.label';
	public static final String GR4VY_RESPONSEPATH_CARDEXPIRY = 'target.expiration_date';

	//LTCI-5673
	public static final String K365_PRODUCTCODE = 'S-K365-OPS';
	public static final String KASEYA_365_OPS = 'Kaseya365Ops';
	public static final String KASEYA_365_ENDPOINT = 'Kaseya365EndPoint';
	public static final String UPGRADE_ELIGIBLE_KASEYA_365_OPS = 'Kaseya 365 Ops';
	public static final String UPGRADE_ELIGIBLE_KASEYA_365_ENDPOINT = 'Kaseya 365 Endpoint';
	public static final String CALLOUT_PLACE_QUOTE_API = 'callout:PlaceQuoteAPI';
	public static final String K365_STOCK_KEEPING_UNIT_CODE = 'S-K365-OPS';
	public static final String K365_ENDPOINT_PRO_UNIT_CODE = 'S-K365-PRO';
	public static final String PERIOD_BOUNDARY_ANNIVERSARY = 'Anniversary';
	public static final String BILLING_FREQUENCY_MONTHLY = 'Monthly';
	public static final String HEADER_CONTENT = 'Content-Type';
	public static final String HEADER_JSON = 'application/json';
	public static final String GRAPH_ID = 'myGraphId';
	public static final String POST = 'POST';
	public static final String PLACE_QUOTE_METADATA_NAME = 'PlaceQuote';
	public static final String QUOTE_LINE_ITEM_OBJECT_TYPE = 'QuoteLineItem';
	public static final String SYSTEM_PRICING_PREF = 'System';
	public static final String UPDATE_QUOTE_GRAPH_ID = 'updateQuote';
	public static final String PRICING_PREF = 'pricingPref';
	public static final String GRAPH_ID_KEY = 'graphId';
	public static final String REF_QUOTE_LINE_ITEM_TO_CREATE = 'refQuoteLineItemToCreate';
	public static final String RECORDS_KEY = 'records';
	public static final String GRAPH_KEY = 'graph';
	public static final String REFERENCE_ID_KEY = 'referenceId';
	public static final String METHOD_KEY = 'method';
	public static final String RECORD_KEY = 'record';
	public static final String ATTRIBUTES_KEY = 'attributes';
	public static final String REF_QUOTE_ID = '@{refQuote.id}';
	public static final Decimal DEFAULT_QUANTITY = 1.0;
	public static final String LOAD_INSTANCE = 'callout:LoadInstanceAPI';
	public static final String CONTEXT_ID = 'contextId';
	public static final String addDefaultConfiguration = 'addDefaultConfiguration';
	public static final String executeConfigurationRules = 'executeConfigurationRules';
	public static final String executePricing = 'executePricing';
	public static final String qualifyAllProductsInTransaction = 'qualifyAllProductsInTransaction';
	public static final String validateAmendRenewCancel = 'validateAmendRenewCancel';
	public static final String validateProductCatalog = 'validateProductCatalog';
	public static final String accountId = 'accountId';
	public static final String configuratorOptions = 'configuratorOptions';
	public static final String qualificationContext = 'qualificationContext';
	public static final String transactionId = 'transactionId';
	public static final String SALES_TRANSACTION_ID = 'salesTransactionId';
	public static final String K365_ENDPOINT_EXP_UNIT_CODE = 'S-K365-EXP';
	public static final String UNIFIED_RMM = 'Unified RMM';
	public static final String RMM = 'RMM';
	public static final String VSA10 = 'VSA10';
	public static final String VSA9 = 'VSA9';
	public static final String UPGRADE_TYPE = 'upgradeType';
	public static final String PRODUCTSKU = 'productSKU';
	public static final String PRODUCT_NAME = 'productName';
	public static final String ROCKET_CYBER = 'ROCKET_CYBER';
	public static final String ROCKET_CYBER_OPSWAT = 'ROCKET_CYBER_OPSWAT';
	public static final String DATTO_RMM = 'DATTO_RMM';
	public static final String VSA_10 = 'VSA_10';
	public static final String VSA_9 = 'VSA_9';
	public static final String PLACE_SALES_TRANSACTION_METADATA_NAME = 'PlaceSalesTransaction';
	public static final String CATALOG_RATES_PREF = 'catalogRatesPref';
	public static final String CONFIGURATION_PREF = 'configurationPref';
	public static final String CONTEXT_DETAILS = 'contextDetails';
	public static final String CONFIGURATION_METHOD = 'configurationMethod';
	public static final String CONFIGURATION_OPTIONS = 'configurationOptions';
	public static final String REFQUOTELINE = 'refQuoteLine';
	public static final String PAYLOAD_HEADER = 'PayloadHeader';

	//Team Member Role Constants
	public static final String TEAM_ROLE_RENEWAL_SPECIALIST = 'Renewal Specialist';
	public static final String TEAM_ROLE_MANAGER_OF_RENEWALS = 'Manager of Renewals';
	public static final String TEAM_ROLE_SOLUTION_SPECIALIST = 'Solution Specialist';
	public static final String TEAM_ROLE_BCDR_CONCIERGE = 'BCDR Concierge';
	public static final String TEAM_ROLE_COLLECTION_SPECIALIST = 'Collections Specialist';
	public static final String ACCESS_LEVEL_EDIT = 'Edit';
	public static final String ACCESS_LEVEL_READ = 'Read';

	//Opportunity Stage Constants
	public static final String OPPORTUNITY_STAGE_CLOSED_LOST = 'Closed Lost';
	public static final String OPPORTUNITY_STAGE_CLOSED_WON = 'Closed Won';

	public static final String PRODUCT_GROUP_360_REVIEW = '360 Review';
	public static final String PRODUCT_GROUP_ENDPOINT = 'Endpoint';
	public static final String PRODUCT_GROUP_IT_OPERATIONS = 'IT Operations';
	public static final String TEST_ACCOUNT_NAME = 'TestingAccount';
	public static final String TEST_OPPORTUNITY_NAME = 'TestingOpportunity';
	public static final String TYPE_HEADER_PARAMETER = 'type';

	//Quote Line Item Field Constants
	//Invoice Related Constants
	public static final String EMPTY_JSON_BODY = '{}';
	public static final String VOID_API_BASE_URL = 'callout:CreditMemoCreation/invoicing/invoices/';
	public static final String VOID_API_END_URL = '/actions/void';
	public static final String INVOICE_INGEST_END_URL = 'collection/actions/ingest';
	public static final String INVOICE_ID = 'Invoice Id';
	public static final String INVOICE_ID_TEST = 'INV-12345';
	public static final String INV_FAIL = 'INV-FAIL';
	public static final String INV_VOIDED = 'Invoice voided';
	public static final String API_BASE_URL = 'callout:CreditMemoCreation/';
	public static final String API_STANDALONE_INVOICE = 'invoicing/invoices/collection/actions/ingest';
	public static final String API_STANDALONECM = 'invoicing/credit-memos/actions/generate';
	public static final STRING API_APPLYCMURL_START = 'callout:CreditMemoCreation/invoicing/credit-memos/';
	public static final STRING API_APPLYCMURL_END = '/actions/apply';
	public static final String ESTIMATED = 'Estimated';
	public static final String REFACCOUNT = 'refAccount';
	public static final String REFINVOICE = 'refInvoice';
	public static final String GET = 'GET';
	public static final String PREPAIDINVOICE = 'Pre-Payment Invoice';
	public static final String REFBILLADDRESS = 'refBillingAddress';
	public static final String INVOICEADDRESSGROUP_OBJECT = 'InvoiceAddressGroup';
	public static final String INVOICELINE_OBJECT = 'InvoiceLine';
	public static final String REFSHIPADDRESS = 'refShippingAddress';
	public static final String IGNORE = 'Ignore';

	//Quote Line Item Field Constants
	public static final String QUOTE_ID_FIELD = 'QuoteId';
	public static final String PRICEBOOK_ENTRY_ID_FIELD = 'PricebookEntryId';
	public static final String PRODUCT_2_ID_FIELD = 'Product2Id';
	public static final String QUANTITY_FIELD = 'Quantity';
	public static final String UNIT_PRICE_FIELD = 'UnitPrice';
	public static final String PERIOD_BOUNDARY_FIELD = 'PeriodBoundary';
	public static final String BILLING_FREQUENCY_FIELD = 'BillingFrequency';
	public static final String END_DATE_FIELD = 'EndDate';
	public static final String SUBSCRIPTION_TERM_FIELD = 'SubscriptionTerm';

	//Attribute Definition
	public static final String HARDWARE_INCLUDED = 'Hardware Included';
	public static final String LEASE = 'Lease';
	public static final String KASEYA_SHIPPING_TYPE = 'Kaseya Shipping Type';

	//LTCI-6282
	public static final String APPROVALS_NOT_TRIGGERED = 'var_approvalsNotTriggered';
	public static final String ASSET_LINKAGE = 'AssetLinkage';
	public static final String ASSET = 'Asset';
	public static final String DEVICE = 'Device';
	public static final String QUOTELINEITEM = 'QuoteLineItems';
	public static final String TRANSACTIONTYPE = 'TransactionType';
	public static final String QUOTETYPE = 'QuoteType';
	public static final String PURCHASED = 'Purchased';
	public static final String WINBACKREINSTATEMENT = 'WinBack/Reinstatement';
	//Custom Permission Labels
	public static final String RENEWAL_OPS_CP = 'Renewal_Ops_CP';
	public static final String SYSTEM_ADMIN_CP = 'System_Admin_CP';
	public static final String DEAL_DESK_CP = 'Deal_Desk_CP';
	public static final String ORDER_GOVERNANCE_CP = 'Order_Governance';

	//LTCI - 5696
	public static final String IN_CANCEL = '_IN_CANCEL';
	public static final String IN_AMENDMENT = '_IN_AMENDMENT';
	public static final String IN_RENEWAL = '_IN_RENEWAL';
	public static final String IN_CANCEL_REPLACE = '_IN_CANCEL_REPLACE';
	public static final String BLANK_ACTION_TYPE = 'BLANK_ACTION_TYPE';
	public static final String ZERO_END_QUANTITY = 'ZERO_END_QUANTITY';
	public static final String DOWNSELL_SCENARIO = 'DOWNSELL_SCENARIO';
	public static final String UPSELL_SCENARIO = 'UPSELL_SCENARIO';
	public static final String IN_DEVICE_UPGRADE = '_IN_DEVICE_UPGRADE';

	public static final String INTEGRATION_EVENT_GET_INVOICES = 'invoices';
	public static final String INTEGRATION_EVENT_GET_CREDITMEMOS = 'creditMemos';
	public static final String INTEGRATION_EVENT_GET_CREDITMEMOINVOICEAPPLICATION = 'creditMemoInvApplications';
	//Test Data Constants for Installment Creation Test
	public static final Decimal TEST_UNIT_PRICE_500 = 500;
	public static final Decimal TEST_UNIT_PRICE_750 = 750;
	public static final Decimal TEST_UNIT_PRICE_300 = 300;
	public static final Decimal TEST_UNIT_PRICE_1000 = 1000;
	public static final Integer TEST_QUANTITY_1 = 1;
	public static final Integer TEST_QUANTITY_2 = 2;
	public static final Integer TEST_INSTALLMENTS_3 = 3;
	public static final Integer TEST_INSTALLMENTS_1 = 1;
	public static final Integer TEST_INSTALLMENTS_6 = 6;
	public static final String STATUS_COMPLETED = 'Completed';
	public static final String STATUS_READY_FOR_INVOICING = 'Ready for Invoicing';

	//EDI Integration Constants
	public static final String EDI_REFERENCE_CODE_Q1 = 'Q1';
	public static final String EDI_PURPOSE_CODE_ACCEPT = 'AD';
	public static final String EDI_PURPOSE_CODE_REJECT = 'RE';
	public static final String EDI_REJECTION_REASON_PO_NOT_FOUND = 'PO Not Found';
	public static final String DATE_FORMAT_YYYY_MM_DD = 'yyyy-MM-dd';
	public static final String EDI_STATUS_CODE_R1 = 'R1';
	public static final String EDI_STATUS_CODE_R2 = 'R2';
	public static final String EDI_STATUS_CODE_R3 = 'R3';
	public static final String EDI_STATUS_CODE_IA = 'IA';
	public static final String EDI_UNIT_OF_MEASURE_EA = 'EA';
	public static final String EDI_ERROR_FAILED_TO_RETRIEVE_JSON = 'Failed to retrieve JSON content';

	// EDI JSON Keys
	public static final String EDI_KEY_PAYLOAD = 'payload';
	public static final String EDI_KEY_PO = 'PO';
	public static final String EDI_KEY_ITEMS = 'items';
	public static final String EDI_KEY_REFERENCES = 'references';
	public static final String EDI_KEY_CODE = 'code';
	public static final String EDI_KEY_VALUE = 'value';
	public static final String EDI_KEY_PO_NUMBER = 'poNumber';
	public static final String EDI_KEY_LINE_NUMBER = 'lineNumber';
	public static final String EDI_KEY_VENDOR_PART = 'vendorPart';
	public static final String EDI_KEY_UNIT_PRICE = 'unitPrice';
	public static final String EDI_KEY_QUANTITY = 'quantity';
	public static final String EDI_KEY_ACKNOWLEDGMENT_HEADER = 'acknowledgmentHeader';
	public static final String EDI_KEY_ACKNOWLEDGMENT_LN = 'acknowledgmentLn';
	public static final String EDI_KEY_PURPOSE_CODE = 'purposeCode';
	public static final String EDI_KEY_REJECTION_REASON = 'rejectionReason';
	public static final String EDI_KEY_TOTAL_LINE_ITEMS_ACKNOWLEDGED = 'totalLineItemsAcknowledged';
	public static final String EDI_KEY_ACKNOWLEDGMENT_DATE = 'acknowledgmentDate';
	public static final String EDI_KEY_STATUS = 'status';
	public static final String EDI_KEY_ACKNOWLEDGED_QUANTITY = 'acknowledgedQuantity';
	public static final String EDI_KEY_UNIT_OF_MEASURE = 'unitOfMeasure';
	public static final String EDI_KEY_CREATED_BY_ID = 'CreatedById';
	public static final String EDI_KEY_CREATED_DATE = 'CreatedDate';

	// LTCI-310
	public static final String RECORD_TYPE_FINAL = 'Final';
	public static final String RECORD_TYPE_TRANSACTIONAL = 'Transactional';

	public static final String EDIINVOICE_ATTRIBUTE_BODY = 'body';
	public static final String EDIINVOICE_ATTRIBUTE_BKTRANSACTIONREQUEST = 'bkTransactionRequest';
	public static final String EDIINVOICE_ATTRIBUTE_PURCHASEORDER = 'purchaseOrder';
	public static final String EDIINVOICE_ATTRIBUTE_RECEIVER = 'receiver';
	public static final String EDIINVOICE_ATTRIBUTE_INTERCHANGEINFO = 'interchangeInfo';
	public static final String EDIINVOICE_ATTRIBUTE_LINEITEMS = 'lineItems';
	public static final String EDIINVOICE_ATTRIBUTE_SUMMARY = 'summary';
	public static final String EDIINVOICE_ATTRIBUTE_SHIPMENT = 'shipment';
	public static final String EDIINVOICE_ATTRIBUTE_INVOICE = 'invoice';

	// LTCI-8135
	public static final String REASON_DOWNSELL_SAAS = 'Downsell SAAS';
	public static final String REASON_DOWNSELL_OTHER = 'Downsell Other';

	//LTCI-1486
	public static final String DO_NOT_SELL = 'Do Not Sell';
	//public static final String K365_ENDPOINT_EXP_UNIT_CODE = 'Do Not Sell';
	public static final String BUSINESS_EVENT_SHIPPED = 'Order Shipped';

	//Usage Staging Constants
	//Usage Staging Constants
	public static final String INSTANCE_LEVEL = 'Instance';
	public static final String ASSET_LEVEL = 'Asset';
	public static final String DEVICE_LEVEL = 'Device';
	public static final String USAGE_STAGING_STATUS_NEW = 'New';
	public static final String USAGE_STAGING_STATUS_READY_FOR_PROCESSING = 'Ready for Usage Processing';
	public static final String PENDING = 'Pending';

	public static final String INTEGRATION_EVENT_STATUS_API_CALL_SUCCEEDED = 'API Call Succeeded';
	public static final String INTEGRATION_EVENT_STATUS_API_CALL_FAILED = 'API Call Failed';

	public static final String ORDER_PAYLOAD_TRANS_KEY = 'transactionType';
	//Device Status Constants
	public static final String PENDING_RETURN_INVOICE_GENERATED = 'Pending Return - Invoice Generated';
	public static final String DEVICE_STATUS_PENDING_RETURN = 'Pending Return';

	//DocusignHTTPService Constants
	public static final String SUCCESS = 'Success';
	public static final String SENDENVELOPE = 'sendEnvelope';
	public static final String CONTENTVERSIONID = 'contentVersionId';
	public static final String SIGNER_NAME = 'signerName';
	public static final String SIGNER_EMAIL = 'signerEmail';
	public static final String DOCUMENTNAME = 'documentName';
	public static final String CONTENTVERSIONID_IS_REQUIRED_AND_WAS_NOT_PROVIDED = 'ContentVersionId is required and was not provided.';
	public static final String RECIPIENT_NAME_AND_EMAIL_ARE_REQUIRED = 'Recipient name and email are required.';
	public static final String NO_DOCUMENT_FOUND_FOR_THE_PROVIDED_CONTENTVERSIONID = 'No document found for the provided ContentVersionId: ';
	public static final String PLEASE_SIGN_THIS_DOCUMENT = 'Please sign this document';
	public static final String PDF = '.pdf';
	public static final String SENT = 'sent';
	public static final String SETENDPOINT =
		'callout:DocuSign/v2.1/accounts/' +
		System.Label.Docusign_Account_Id +
		'/envelopes';
	public static final String CONTENT_TYPE = 'Content-Type';
	public static final String APPLICATION_JSON = 'application/json';
	public static final String ENVELOPEID = 'envelopeId';
	public static final String DOCUMENTENVELOPEID = 'documentEnvelopeId';
	public static final String SIGNER = 'Signer';
	public static final String CARBONCOPY = 'Carbon Copy';
	public static final String DOCUSIGN_ERROR = 'DocuSign Error: ';
	public static final String UNEXPECTED_ERROR_IN_DOCUSIGNSERVICE = 'Unexpected error in DocuSignService: ';
	public static final String ONE_STRING = '1';
	public static final String cc_NAME = 'ccName';
	public static final String cc_EMAIL = 'ccEmail';
	public static final String NAME = 'name';
	public static final String EMAIL = 'email';

	//LTCI-8914
	public static final String K_SHIP = 'K-SHIP';
	public static final String PROFESSIONAL_SERVICES = 'Professional Services';

	//LTCI-484
	public static final String GR4VY_PAYMENTLINK_SUCCESS = 'Payment link generated successfully for Quote: ';
	public static final String GR4VY_PAYMENTLINK_ERROR = 'Failed to generate payment link. Please check quote details and try again.';
	public static final String GR4VY_PAYMENTLINK_UNEXPERROR = 'Unexpected error: ';
	public static final String INTEGRATION_SOURCE_GR4VY = 'Gr4vy';
	public static final String QUOTE_PAYMENTINFOSTATUS_PENDING = 'Pending';

	//OmnistudioInvoiceDataMapperFunctions
	public static final String SUFFIX = 'suffix';
	public static final String PREFIX = 'prefix';
	public static final String LE_PREFIX = 'Prefix';
	public static final String PLACEMENT = 'placement';
	public static final String SPACE = 'space';
	public static final String DECIMAL_VAR = 'decimal';
	public static final String SYMBOL = 'symbol';
	public static final String CURRENCYISOCODE = 'CurrencyIsoCode';
	public static final String NOK = 'NOK';
	public static final String DKK = 'DKK';
	public static final String SEK = 'SEK';
	public static final String USD = 'USD';
	public static final String EUR = 'EUR';
	public static final String KLIM = 'KLIM';
	public static final String SEK_KLIM = 'SEK_KLIM';
	public static final String CURRENCY_FORMAT = 'CurrencyFormat';
	public static final String INVOICE = 'Invoice';
	public static final String LEGALENTITY = 'LegalEntity';
	public static final String RESULT = 'result';
	public static final String THOUSAND = 'thousand';
	public static final String INPUT = 'input';
	public static final String OUTPUT = 'output';
	public static final String OPTIONS = 'options';
	public static final String ARGUMENTS = 'arguments';
	public static final List<String> SYMBOLS_TO_REMOVE = new List<String>{
		currencyIsoCode,
		symbol,
		'kr',
		'DKK',
		'NOK',
		'SEK',
		'CAD',
		'AUD',
		'NZD',
		'USD',
		'SGD',
		'ZAR',
		'EUR',
		'GBP',
		'INR',
		'$',
		'£',
		'€',
		'₹',
		'R'
	};
	public static final Set<String> CURRENCY_KEYS = new Set<String>{
		'ChargeAmount',
		'TaxAmount',
		'UnitPrice',
		'LineAmount',
		'ChargeAmountWithTax',
		'TotalChargeAmount',
		'TotalChargeAmountWithTax',
		'TotalAmount',
		'TotalTaxAmount',
		'VATAmount',
		'Shipping__c',
		'QSTAmount',
		'GSTAmount',
		'NonK365SecurityTotal',
		'NonK365BackupTotal',
		'K365QuarterlyBusinessReviewTotal',
		'NonK365OtherTotal',
		'K365ProfessionalServiceAutomationHDTotal',
		'K365Kaseya365EndpointTotal',
		'K365ProfessionalServiceAutomationCMTotal',
		'K365DarkWebMonitoringTotal',
		'NonK365AuditandComplianceTotal',
		'NonK365ServicesEducationandSupportTotal',
		'NonK365UnifiedRMMTotal',
		'K365AntiVirusTotal',
		'K365GovernanceRiskandComplianceTotal',
		'K365RansomwareDetectionTotal',
		'NonK365FinTechTotal',
		'K365ITCollaborationTotal',
		'K365ITDocumentationTotal',
		'K365AccountsReceivablesTotal',
		'K365ProfessionalServiceAutomationFLTotal',
		'K365ProfessionalServiceAutomationCONTTotal',
		'K365UnifiedRMMTotal',
		'K365AutomatedNetworkScanningandAssessmentsTotal',
		'K365ProfessionalServiceAutomationTFTotal',
		'K365Kaseya365ComplianceTotal',
		'NonK365UnifiedBackupTotal',
		'K365Kaseya365UserTotal',
		'K365ManagedDetectionandResponseTotal',
		'K365ProfessionalServiceAutomationTSTotal',
		'K365ProfessionalServicesTotal',
		'NonK365ITGlueTotal',
		'K365CloudDetectionandResponseTotal',
		'K365NetworkDocumentationTotal',
		'NonK365ITOperationsTotal',
		'NonK365MSPEnablementTotal',
		'NonK365DattoTotal',
		'K365QuotingSoftwareTotal',
		'K365AdvancedSoftwareManagementTotal',
		'K365ProfessionalServiceAutomationMCTotal',
		'K365ProfessionalServiceAutomationGRADTotal',
		'K365SecurityAwarenessTrainingTotal',
		'K365SaaSBackupTotal',
		'K365AntiPhishingSoftwareTotal',
		'K365EndpointBackupTotal',
		'NonK365Kaseya365Total',
		'K365Kaseya365OpsTotal',
		'NonK365AuditandAssessmentTotal',
		'K365EndpointDetectionandResponseTotal',
		'NonK365NetworkingTotal',
		'K365ProfessionalServicesAutomationTotal',
		'IsK365ListTotal',
		'IsNonK365ListTotal',
		'K365AccountsReceivablesTotalChargeAmount',
		'K365AccountsReceivablesTotalTaxAmount',
		'K365AccountsReceivablesTotalAmount',
		'K365AdvancedSoftwareManagementTotalChargeAmount',
		'K365AdvancedSoftwareManagementTotalTaxAmount',
		'K365AdvancedSoftwareManagementTotalAmount',
		'K365AntiPhishingSoftwareTotalChargeAmount',
		'K365AntiPhishingSoftwareTotalTaxAmount',
		'K365AntiPhishingSoftwareTotalAmount',
		'K365AntiVirusTotalChargeAmount',
		'K365AntiVirusTotalTaxAmount',
		'K365AntiVirusTotalAmount',
		'K365AutomatedNetworkScanningandAssessmentsTotalChargeAmount',
		'K365AutomatedNetworkScanningandAssessmentsTotalTaxAmount',
		'K365AutomatedNetworkScanningandAssessmentsTotalAmount',
		'K365CloudDetectionandResponseTotalChargeAmount',
		'K365CloudDetectionandResponseTotalTaxAmount',
		'K365CloudDetectionandResponseTotalAmount',
		'K365DarkWebMonitoringTotalChargeAmount',
		'K365DarkWebMonitoringTotalTaxAmount',
		'K365DarkWebMonitoringTotalAmount',
		'K365EndpointBackupTotalChargeAmount',
		'K365EndpointBackupTotalTaxAmount',
		'K365EndpointBackupTotalAmount',
		'K365EndpointDetectionandResponseTotalChargeAmount',
		'K365EndpointDetectionandResponseTotalTaxAmount',
		'K365EndpointDetectionandResponseTotalAmount',
		'K365GovernanceRiskandComplianceTotalChargeAmount',
		'K365GovernanceRiskandComplianceTotalTaxAmount',
		'K365GovernanceRiskandComplianceTotalAmount',
		'K365ITCollaborationTotalChargeAmount',
		'K365ITCollaborationTotalTaxAmount',
		'K365ITCollaborationTotalAmount',
		'K365ITDocumentationTotalChargeAmount',
		'K365ITDocumentationTotalTaxAmount',
		'K365ITDocumentationTotalAmount',
		'K365Kaseya365ComplianceTotalChargeAmount',
		'K365Kaseya365ComplianceTotalTaxAmount',
		'K365Kaseya365ComplianceTotalAmount',
		'K365Kaseya365EndpointTotalChargeAmount',
		'K365Kaseya365EndpointTotalTaxAmount',
		'K365Kaseya365EndpointTotalAmount',
		'K365Kaseya365OpsTotalChargeAmount',
		'K365Kaseya365OpsTotalTaxAmount',
		'K365Kaseya365OpsTotalAmount',
		'K365Kaseya365UserTotalChargeAmount',
		'K365Kaseya365UserTotalTaxAmount',
		'K365Kaseya365UserTotalAmount',
		'K365ManagedDetectionandResponseTotalChargeAmount',
		'K365ManagedDetectionandResponseTotalTaxAmount',
		'K365ManagedDetectionandResponseTotalAmount',
		'K365NetworkDocumentationTotalChargeAmount',
		'K365NetworkDocumentationTotalTaxAmount',
		'K365NetworkDocumentationTotalAmount',
		'K365ProfessionalServiceAutomationCMTotalChargeAmount',
		'K365ProfessionalServiceAutomationCMTotalTaxAmount',
		'K365ProfessionalServiceAutomationCMTotalAmount',
		'K365ProfessionalServiceAutomationCONTTotalChargeAmount',
		'K365ProfessionalServiceAutomationCONTTotalTaxAmount',
		'K365ProfessionalServiceAutomationCONTTotalAmount',
		'K365ProfessionalServiceAutomationFLTotalChargeAmount',
		'K365ProfessionalServiceAutomationFLTotalTaxAmount',
		'K365ProfessionalServiceAutomationFLTotalAmount',
		'K365ProfessionalServiceAutomationGRADTotalChargeAmount',
		'K365ProfessionalServiceAutomationGRADTotalTaxAmount',
		'K365ProfessionalServiceAutomationGRADTotalAmount',
		'K365ProfessionalServiceAutomationHDTotalChargeAmount',
		'K365ProfessionalServiceAutomationHDTotalTaxAmount',
		'K365ProfessionalServiceAutomationHDTotalAmount',
		'K365ProfessionalServiceAutomationMCTotalChargeAmount',
		'K365ProfessionalServiceAutomationMCTotalTaxAmount',
		'K365ProfessionalServiceAutomationMCTotalAmount',
		'K365ProfessionalServiceAutomationTFTotalChargeAmount',
		'K365ProfessionalServiceAutomationTFTotalTaxAmount',
		'K365ProfessionalServiceAutomationTFTotalAmount',
		'K365ProfessionalServiceAutomationTSTotalChargeAmount',
		'K365ProfessionalServiceAutomationTSTotalTaxAmount',
		'K365ProfessionalServiceAutomationTSTotalAmount',
		'K365ProfessionalServicesTotalChargeAmount',
		'K365ProfessionalServicesTotalTaxAmount',
		'K365ProfessionalServicesTotalAmount',
		'K365ProfessionalServicesAutomationTotalChargeAmount',
		'K365ProfessionalServicesAutomationTotalTaxAmount',
		'K365ProfessionalServicesAutomationTotalAmount',
		'K365QuarterlyBusinessReviewTotalChargeAmount',
		'K365QuarterlyBusinessReviewTotalTaxAmount',
		'K365QuarterlyBusinessReviewTotalAmount',
		'K365QuotingSoftwareTotalChargeAmount',
		'K365QuotingSoftwareTotalTaxAmount',
		'K365QuotingSoftwareTotalAmount',
		'K365RansomwareDetectionTotalChargeAmount',
		'K365RansomwareDetectionTotalTaxAmount',
		'K365RansomwareDetectionTotalAmount',
		'K365SaaSBackupTotalChargeAmount',
		'K365SaaSBackupTotalTaxAmount',
		'K365SaaSBackupTotalAmount',
		'K365SecurityAwarenessTrainingTotalChargeAmount',
		'K365SecurityAwarenessTrainingTotalTaxAmount',
		'K365SecurityAwarenessTrainingTotalAmount',
		'K365UnifiedRMMTotalChargeAmount',
		'K365UnifiedRMMTotalTaxAmount',
		'K365UnifiedRMMTotalAmount',
		'K365VulnerabilityManagementTotalChargeAmount',
		'K365VulnerabilityManagementTotalTaxAmount',
		'K365VulnerabilityManagementTotalAmount',
		'NonK365AuditandAssessmentTotalChargeAmount',
		'NonK365AuditandAssessmentTotalTaxAmount',
		'NonK365AuditandAssessmentTotalAmount',
		'NonK365AuditandComplianceTotalChargeAmount',
		'NonK365AuditandComplianceTotalTaxAmount',
		'NonK365AuditandComplianceTotalAmount',
		'NonK365BackupTotalChargeAmount',
		'NonK365BackupTotalTaxAmount',
		'NonK365BackupTotalAmount',
		'NonK365DattoTotalChargeAmount',
		'NonK365DattoTotalTaxAmount',
		'NonK365DattoTotalAmount',
		'NonK365FinTechTotalChargeAmount',
		'NonK365FinTechTotalTaxAmount',
		'NonK365FinTechTotalAmount',
		'NonK365ITGlueTotalChargeAmount',
		'NonK365ITGlueTotalTaxAmount',
		'NonK365ITGlueTotalAmount',
		'NonK365ITOperationsTotalChargeAmount',
		'NonK365ITOperationsTotalTaxAmount',
		'NonK365ITOperationsTotalAmount',
		'NonK365Kaseya365TotalChargeAmount',
		'NonK365Kaseya365TotalTaxAmount',
		'NonK365Kaseya365TotalAmount',
		'NonK365MSPEnablementTotalChargeAmount',
		'NonK365MSPEnablementTotalTaxAmount',
		'NonK365MSPEnablementTotalAmount',
		'NonK365NetworkingTotalChargeAmount',
		'NonK365NetworkingTotalTaxAmount',
		'NonK365NetworkingTotalAmount',
		'NonK365OtherTotalChargeAmount',
		'NonK365OtherTotalTaxAmount',
		'NonK365OtherTotalAmount',
		'NonK365SecurityTotalChargeAmount',
		'NonK365SecurityTotalTaxAmount',
		'NonK365SecurityTotalAmount',
		'NonK365ServicesEducationandSupportTotalChargeAmount',
		'NonK365ServicesEducationandSupportTotalTaxAmount',
		'NonK365ServicesEducationandSupportTotalAmount',
		'NonK365UnifiedBackupTotalChargeAmount',
		'NonK365UnifiedBackupTotalTaxAmount',
		'NonK365UnifiedBackupTotalAmount',
		'NonK365UnifiedRMMTotalChargeAmount',
		'NonK365UnifiedRMMTotalTaxAmount',
		'NonK365UnifiedRMMTotalAmount'
	};
}