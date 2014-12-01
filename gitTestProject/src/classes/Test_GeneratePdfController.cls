/* Test Class for GeneratePdfController
 * 
 * Revision History:
 *
 * Version       Date                 Author              Comments
 *  1.0         25/1/2012          Ketaki Virkar        Initial Draft
 *
 */

@isTest(SeeAllData=true)
public with sharing class Test_GeneratePdfController
{
	static List<Quote_Purchase__c> objQuotePurchase;

	public static testMethod void testPdfController()
	{
    	Test.startTest();
		
		TestData.Data();
		
		PageReference pageReference = Page.GeneratePdf;
		pageReference.getParameters().put('id',TestData.objPurchaseOrder.id);
    	Test.setCurrentPage(pageReference);
    	
    	ApexPages.StandardController Controller;
    	GeneratePdfController objPdfController = new GeneratePdfController(Controller);
    	
    	System.assertEquals(TestData.quoteList[0].Id, objPdfController.getQuote().Id);
    	System.assertEquals('Ketaki', objPdfController.getName());
    	System.assertEquals('Ketaki Quote', objPdfController.getQuote().Name);
    	System.assertEquals(Date.today(),objPdfController.getCurrentDate());
    	System.assertEquals(2950, objPdfController.getPurchaseOrder().Total_Bill__c);
    	
    	objQuotePurchase = objPdfController.getQuotePurchaseList();
    	System.assertEquals(TestData.quoteList[0].Id, objQuotePurchase[0].Quote1__c);
    	System.assertEquals(TestData.objPurchaseOrder.Id, objQuotePurchase[0].Order__c);
    	System.assertEquals(TestData.productList[0].Id, objQuotePurchase[0].Product1__c);
    	System.assertNotEquals(TestData.productList[1].Id, objQuotePurchase[0].Product1__c);
    	
    	objPdfController.setQuote(TestData.quoteList[1]);
    	System.assertEquals(TestData.quoteList[1].Id, objPdfController.getQuote().Id);
    	System.assertEquals('Ketaki', objPdfController.getName());
    	System.assertEquals('Pallavi Quote', objPdfController.getQuote().Name);
    	
    	Test.stopTest();
	}
}