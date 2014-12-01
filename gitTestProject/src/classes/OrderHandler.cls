/* Handler for Order Trigger
 * 
 * Revision History:
 *
 * Version       Date                 Author              Comments
 *  1.0        22/2/2013           Ketaki Virkar        Initial Draft
 *
 */

public with sharing class OrderHandler
{
	public OrderHandler()
	{
	}

	public String name(Id pricebookEntryId)
	{
		PricebookEntry pricebookEntry = [Select p.ProductCode, p.Id
										 From PricebookEntry p
										 where p.Id =: pricebookEntryId
										];
		Product2 p = [Select p.ProductCode, p.Name, p.Id
					  From Product2 p
					  where p.ProductCode =: pricebookEntry.ProductCode
					 ];
		return p.Id;
	}
	
	public void Test(Purchase_Order__c purchaseOrder)
	{
		Quote quote = [Select q.Id From Quote q where q.Id =: purchaseOrder.Quote__c];
		
		QuoteLineItem[] qliList = [Select qi.QuoteId, qi.PricebookEntryId, qi.UnitPrice, qi.Quantity, qi.Discount
								   From QuoteLineItem qi
								   where qi.QuoteId =: quote.Id
								  ];
				
		for(QuoteLineItem qli : qliList)
		{
			Quote_Purchase__c objQuotePurchase = new Quote_Purchase__c();
			String productName = name(qli.PricebookEntryId);
			
			objQuotePurchase.Product1__c = productName;
			objQuotePurchase.Sales_Price__c = qli.UnitPrice;
			objQuotePurchase.Quantity__c = qli.Quantity;
			objQuotePurchase.Discount__c = qli.Discount;
			objQuotePurchase.Order__c = purchaseOrder.Id;
			objQuotePurchase.Quote1__c = quote.ID;
			
			insert objQuotePurchase;
		}
	}
}