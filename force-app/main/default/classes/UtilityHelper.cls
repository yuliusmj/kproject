public with sharing class UtilityHelper {
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
	public static Map<String, SObject> buildMap(Schema.SObjectField thisField, List<SObject> objectList) {
		Map<String, SObject> constructedMap = new Map<String, SObject>();
		for (SObject thisObject : objectList) {
			constructedMap.put((String) thisObject.get(thisField), thisObject);
		}
		return constructedMap;
	}
	public static Map<String, String> fetchPicklistOptions(String typeName, String picklistDevName) {
		List<Schema.PicklistEntry> pickListEntries = new List<Schema.PicklistEntry>();
		Type sObjectType = Type.forName('Schema', typeName);
		if (sObjectType != null) {
			SObject sObj = (SObject) sObjectType.newInstance();
			Map<String, Schema.SObjectField> fieldMap = sObj.getSObjectType().getDescribe().fields.getMap();
			Schema.SObjectField picklistField = fieldMap.get(picklistDevName);

			if (picklistField != null) {
				Schema.DescribeFieldResult fieldDescribe = picklistField.getDescribe();
				pickListEntries = fieldDescribe.getPicklistValues();
			}
		}
		Map<String, String> options = new Map<String, String>();
		for (Schema.PicklistEntry spe : PickListEntries) {
			options.put(spe.getValue().toLowerCase(), spe.getValue());
		}

		return options;
	}
	public static OrgWideEmailAddress getOrgWideAddressByEmail(String thisEmail) {
		return (OrgWideEmailAddress) orgWideAddresses.get(thisEmail);
	}
}