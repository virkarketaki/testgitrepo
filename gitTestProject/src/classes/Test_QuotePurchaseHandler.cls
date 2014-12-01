/* Test Class for QuotePurchaseHandler class
 * 
 * Revision History:
 *
 * Version       Date                 Author              Comments
 *  1.0        25/1/2012           Ketaki Virkar        Initial Draft
 *
 */

@isTest(SeeAllData=true)
public with sharing class Test_QuotePurchaseHandler 
{
	static testMethod void testQuotePurchaseHandler()
	{
		Test.startTest();
		
		TestData.Data();
		
		Quote_Purchase__c objQuotePurchase = new Quote_Purchase__c(Order__c=TestData.objPurchaseOrder.Id, Quote1__c = TestData.quoteList[0].Id,
															Product1__c = TestData.productList[0].Id, Quantity__c = 5, Discount__c = 10);
		Database.insert(objQuotePurchase);
		
		QuotePurchaseHandler objQuotePurchaseHandler = new QuotePurchaseHandler();
		
		objQuotePurchaseHandler.test(objQuotePurchase);
		
		System.assertEquals(objQuotePurchase.Total_Price__c ,TestData.objPurchaseOrder.Total_Bill__c);
		
		Test.stopTest();
	}
}