public with sharing class DemoFieldExtractor
{
	public DemoFieldExtractor()
	{
		
	}
	
	public void testData(String pObjectName)
	{
		String strRelationshipName = '';
		Map<String, Schema.SObjectField> objectFieldsMap = new Map<String, Schema.SObjectField>();
		List<Schema.Sobjecttype> fieldAPIRelationList = new List<Schema.Sobjecttype>();
		
		objectFieldsMap = Schema.getGlobalDescribe().get('task').getDescribe().fields.getMap();
		system.debug('11111111111111: Contact fields map ===> '+objectFieldsMap);
		
		Schema.Describefieldresult sourceObjectFieldResult = objectFieldsMap.get(pObjectName).getDescribe();
		system.debug('22222222222222: metadata of AccountId field ===> '+sourceObjectFieldResult);
		
		fieldAPIRelationList = sourceObjectFieldResult.getReferenceTo();
		system.debug('3333333333333: References of Account ===> '+fieldAPIRelationList);
		
		if(!fieldAPIRelationList.isEmpty())
		{
			system.debug('444444444444444');
			strRelationshipName  = String.valueOf(fieldAPIRelationList[0]);
			system.debug('5555555555555: strRelationshipName ===> '+strRelationshipName);
		}
		
		system.debug('666666666666666666 ===> globalDescribe' +Schema.getGlobalDescribe());
		
		//if(Schema.getGlobalDescribe().containsKey(strRelationshipName))
		if(Schema.getGlobalDescribe().containsKey('Account'))
			system.debug('7777777777777777');
		else
			system.debug('888888888888888888');
			
	//	system.debug('999999999999999 ===> '+Schema.getGlobalDescribe().keySet());	
			
	/*	Map<string, string> colorCodes = new Map<String, String>();
		colorCodes.put('Red', 'FF0000');
		colorCodes.put('blue', '0000A0');

		Boolean contains = colorCodes.containsKey('Blue');
		
		system.debug('99999999999999' + contains);*/
	}
}