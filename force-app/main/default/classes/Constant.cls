/**
* @Class        : Constants
* @Author       : Deloitte Consulting 
* @description  : Used to Store Constants. Created as Part of ZEN-48.  
Modification Logs :
--------------------------------------------------------------------------------------------------------------------------------
Developer               DateDescription
--------------------------------------------------------------------------------------------------------------------------------

**/
public class Constant {
	/*Apexclass name and method name
public static final string class_name='MilestoneTimeCalculator';
public static final string MilestoneTimeCalculator='MilestoneTimeCalculator';
public static final string getCriteriaField='getCriteriaField';
public static final string determineSlaTime='determineSlaTime';*/
	//Milestone Related Constants
	public static final String MT_FIRST_RESPONSE = 'First Response';
	public static final String MT_CASE_RESOLUTION = 'Case Resolution SLA';
	public static final String MT_FIRST_RESPONSE_TEST = 'First Response Test';
	public static final String MT_CASE_RESOLUTION_TEST = 'Case Resolution SLA Test';

	//Case Record Type Developer Names
	public static final String CASE_REN_OPS_DEV = 'Renewal_Ops';
	public static final String CASE_BIS_OPS_DEV = 'Standard_Support_Request';
	public static final String CASE_BILLING_OPS_DEV = 'Billing';
	public static final String CASE_SKU_DEV = 'SKU_Support_Request';
	public static final String CASE_SALES_OPS_DEV = 'Sales_Ops';
	public static final String CASE_COLLECTION_DEV = 'Collection';
	public static final String CASE_BOT_DEV = 'BOT_Program';

	//Object Api Names
	public static final String CASE_OBJ = 'Case';
	public static final String FEED_ITEM_OBJ = 'FeedItem';
	public static final String FEED_COMMENT_OBJ = 'FeedComment';
	public static final String EMAIL_MESSAGE_OBJ = 'EmailMessage';

	public static final String STR_UPDATE = 'UPDATE';
	public static final String STR_CREATE = 'CREATE';
	public static final String STR_CASE_FIELDS = 'Case_Fields';

	//Email Message Status
	public static final String STATUS_DRAFT_5 = '5';
	public static final String STATUS_READ_1 = '1';

	//Custom Permissions
	public static final String SVC_BYPASS_SVC_PUBLISH_EVENTS = 'SVC_Bypass_SVC_Publish_Events';

	//Custom Settings
	public static final String ALLOWED_RECORDTYPES = 'SVC_RT_for_PE_Publication';

	//Custom Messages
	public static final String MSG_FILE_ATTACHED = 'File is attached';
}