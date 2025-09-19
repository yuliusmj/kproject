/*************************************************************************************************************
 * @name			Constants_Case
 * @author			Julian Hurtado <email@email.com>
 * @created			18 / 09 / 2025
 * @description		Constant values for Case
 *
 * Changes (version)
 * -----------------------------------------------------------------------------------------------------------
 * 				No.		Date			Author					Description
 * 				----	------------	--------------------	----------------------------------------------
 * @version		1.0		2025-09-18		Julian Hurtado			Created
 *
 **************************************************************************************************************/
public with sharing class Constants_Case {
	//******************************************************************************************************
	// Picklist values
	//******************************************************************************************************
	public static final CaseOrigins CASE_ORIGINS {
		get {
			if (CASE_ORIGINS == null)
				CASE_ORIGINS = new CaseOrigins();
			return CASE_ORIGINS;
		}
		set;
	}
	public class CaseOrigins {
		public final String O_PHONE = 'Phone';
		public final String O_EMAIL = 'Email';
		public final String O_WEB = 'Web';
	}
	//******************************************************************************************************
	// End of picklist values
	//******************************************************************************************************
}