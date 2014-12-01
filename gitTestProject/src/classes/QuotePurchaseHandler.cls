/* Handler for Quote Purchase Trigger
 * 
 * Revision History:
 *
 * Version       Date                 Author              Comments
 *  1.0        22/1/2012           Ketaki Virkar        Initial Draft
 *
 */

public with sharing class QuotePurchaseHandler
{
	public QuotePurchaseHandler()
	{
	}
	
	public void test(Quote_Purchase__c quotePurchase)
	{
		List<PriceBookEntry> priceBookEntry = [Select p.UnitPrice, p.Product2Id, p.Name, p.Id
											   From PricebookEntry p
											   where p.Product2Id =: quotePurchase.Product1__c
											  ];
		
		for(PriceBookEntry objPriceBookEntry : priceBookEntry)
		{
			quotePurchase.Sales_Price__c = objPriceBookEntry.UnitPrice;
		}
	}
}