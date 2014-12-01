/* Test class for OrderHandler
 * 
 * Revision History:
 *
 * Version       Date                 Author              Comments
 *  1.0        25/1/2012           Ketaki Virkar       Initial Draft
 *
 */

@isTest(SeeAllData=true)
public with sharing class Test_OrderHandler
{
	static testMethod void test()
	{
		Test.startTest();
		
		TestData.Data();
		
		OrderHandler objOrderHandler = new OrderHandler();
		objOrderHandler.Test(TestData.objPurchaseOrder);

		QuoteLineItem objQuoteLineItem=new QuoteLineItem(PricebookEntryId = TestData.pricebookEntryList[0].Id, Quantity=2,
															UnitPrice=5500, Discount=10, QuoteId=TestData.quoteList[0].Id);
		
		Database.insert(objQuoteLineItem);
			
		System.assertEquals(TestData.objPurchaseOrder.Total_Bill__c ,TestData.quoteList[0].TotalPrice);
		
		Test.stopTest();
	}
}