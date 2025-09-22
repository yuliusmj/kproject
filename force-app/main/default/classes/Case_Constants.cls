/*************************************************************************************************************
 * @name			Case_Constants
 * @author			JulianHurtado <k-julian.hurtado@kaseya.com>
 * @created			19 / 09 / 2025
 * @description		Constant values for Case
 *
 * Changes (version)
 * -----------------------------------------------------------------------------------------------------------
 * 				No.		Date			Author					Description
 * 				----	------------	--------------------	----------------------------------------------
 * @version		1.0		2025-09-19		JulianHurtado			Class created
 *
 **************************************************************************************************************/
@IsTest
@SuppressWarnings('PMD.ApexDoc,PMD.PropertyNamingConventions,PMD.FieldNamingConventions')
public with sharing class Case_Constants {
	//******************************************************************************************************
	// Groups
	//******************************************************************************************************
	public static final CaseOrigins CASE_ORIGIN {
		get {
			if (CASE_ORIGIN == null) {
				CASE_ORIGIN = new CaseOrigins();
			}
			return CASE_ORIGIN;
		}
		set;
	}
	public class CaseOrigins {
		public final String PHONE = 'Phone';
		public final String EMAIL = 'Email';
		public final String WEB = 'Web';
		public final String SALESFORCE = 'Salesforce';
		public final String BILLING = 'Billing';
		public final String NEMO = 'NEMO';
	}
	public static final RecordTypeDevNames RECORD_TYPE_DEVNAME {
		get {
			if (RECORD_TYPE_DEVNAME == null) {
				RECORD_TYPE_DEVNAME = new RecordTypeDevNames();
			}
			return RECORD_TYPE_DEVNAME;
		}
		set;
	}
	public class RecordTypeDevNames {
		public final String RENEWAL_OPS_DEV = 'Renewal_Ops';
		public final String STANDARD_SUPPORT_DEV = 'Standard_Support_Request';
		public final String BILLING_DEV = 'Billing';
		public final String SKU_SUPPORT_DEV = 'SKU_Support_Request';
		public final String SALES_OPS_DEV = 'Sales_Ops';
		public final String COLLECTION_DEV = 'Collection';
		public final String BOT_PROGRAM_DEV = 'BOT_Program';
	}
	//******************************************************************************************************
	// End of groups
	//******************************************************************************************************
}