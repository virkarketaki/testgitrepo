public with sharing class HelpTextController
{
	public ketaki__Address__c objAddress{get;set;}
	public HelpTextController(ApexPages.standardController controller)
	{
		objAddress = (ketaki__Address__c)controller.getRecord();
	}
}