/*************************************************************************************************************
 * @name			UtilityHelper
 * @author			JulianHurtado <k-julian.hurtado@kaseya.com>
 * @created			19 / 09 / 2025
 * @description		Utility class
 * @testClass		UtilityHelperTests
 *
 * Changes (version)
 * -----------------------------------------------------------------------------------------------------------
 * 				No.		Date			Author					Description
 * 				----	------------	--------------------	----------------------------------------------
 * @version		1.0		2025-09-19		JulianHurtado			Class created
 *
 **************************************************************************************************************/
public with sharing class UtilityHelper {
	/*********************************************************************************************************
	 * @name			buildListMap
	 * @author			JulianHurtado <k-julian.hurtado@kaseya.com>
	 * @created			19 / 09 / 2025
	 * @description		Generates a map of lists of objects based on a field value of the objects in the list
	 * @param			thisField Schema.SObjectField : Field to be used as key
	 * @param			objectList List<SObject> : List of objects to be used as values
	 * @return			Map<String, List<SObject>> : Map of lists of objects
	 **********************************************************************************************************/
	public static Map<String, List<SObject>> buildListMap(Schema.SObjectField thisField, List<SObject> objectList) {
		Map<String, List<SObject>> constructedMap = new Map<String, List<SObject>>();
		if (objectList == null) {
			return constructedMap;
		}
		for (SObject thisObject : objectList) {
			if (constructedMap.get((String) thisObject.get(thisField)) != null) {
				constructedMap.get((String) thisObject.get(thisField)).add(thisObject);
			} else {
				constructedMap.put((String) thisObject.get(thisField), new List<SObject>{ thisObject });
			}
		}
		return constructedMap;
	}
	/*********************************************************************************************************
	 * @name			buildMap
	 * @author			JulianHurtado <k-julian.hurtado@kaseya.com>
	 * @created			19 / 09 / 2025
	 * @description		Generates a map of objects based on a field value of the objects in the list
	 * @param			thisField Schema.SObjectField : Field to be used as key
	 * @param			objectList List<SObject> : List of objects to be used as values
	 * @return			Map<String, SObject> : Map of objects
	 **********************************************************************************************************/
	public static Map<String, SObject> buildMap(Schema.SObjectField thisField, List<SObject> objectList) {
		Map<String, SObject> constructedMap = new Map<String, SObject>();
		for (SObject thisObject : objectList) {
			constructedMap.put((String) thisObject.get(thisField), thisObject);
		}
		return constructedMap;
	}
	/*********************************************************************************************************
	 * @name			formatPhone
	 * @author			JulianHurtado <k-julian.hurtado@kaseya.com>
	 * @created			21 / 09 / 2025
	 * @description		Structures a phone number
	 * @param			phone String : Phone number to be structured
	 * @param			clean Boolean : Cleans the phone number
	 * @return			A phone number with the format of '+11234567890' or '1234567890'
	 **********************************************************************************************************/
	public static String formatPhone(String phone, Boolean clean) {
		if (String.isEmpty(phone)) {
			return phone;
		}
		phone = phone.replaceAll('[^0-9]', '');
		if (clean) {
			phone = '1' + phone.right(10);
		} else {
			phone = '+1' + phone.right(10);
		}
		return phone;
	}
	/*********************************************************************************************************
	 * @name			generateRandomString
	 * @author			JulianHurtado <k-julian.hurtado@kaseya.com>
	 * @created			21 / 09 / 2025
	 * @description		generate a random string
	 * @param			numCharacters Integer : Number of characters to generate
	 * @return			A random string
	 **********************************************************************************************************/
	public static String generateRandomString(Integer numCharacters) {
		final Integer length = Math.round(Math.random() * numCharacters + 5);
		final String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz';
		String randStr = '';
		while (randStr.length() < length) {
			Integer idx = Math.mod(Math.abs(Crypto.getRandomInteger()), chars.length());
			randStr += chars.substring(idx, idx + 1);
		}
		return randStr;
	}
	/*********************************************************************************************************
	 * @name			generateRandomEmail
	 * @author			JulianHurtado <k-julian.hurtado@kaseya.com>
	 * @created			21 / 09 / 2025
	 * @description		Generates a random email
	 * @return			A random email with the format of 'randomstring@randomstring.com'
	 **********************************************************************************************************/
	public static String generateRandomEmail() {
		return generateRandomString(5) + '@' + generateRandomString(5) + '.com';
	}
	/*********************************************************************************************************
	 * @name			isValidEmail
	 * @author			JulianHurtado <k-julian.hurtado@kaseya.com>
	 * @created			21 / 09 / 2025
	 * @description		Validates an email to see if it is valid based on the regex
	 * @param			email String : Email to be validated
	 * @return			A boolean value of true if the email is valid
	 **********************************************************************************************************/
	public static Boolean isValidEmail(String email) {
		String emailRegex = '^[a-zA-Z0-9._|\\\\%#~`=?&/$^*!}{+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}$'; // source: <a href="http://www.regular-expressions.info/email.html" target="_blank" rel="nofollow">http://www.regular-expressions.info/email.html</a>
		Pattern pattern = Pattern.compile(emailRegex);
		Matcher matcher = pattern.matcher(email);
		return matcher.matches();
	}
}