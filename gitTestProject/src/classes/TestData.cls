/* Data for Test classes
 * 
 * Revision History:
 *
 * Version       Date                 Author              Comments
 *  1.0        25/1/2012           Ketaki Virkar        Initial Draft
 *
 */

@isTest(SeeAllData=true)
public with sharing class TestData 
{
	public static Purchase_Order__c objPurchaseOrder;
	public static List<Quote> quoteList;
	public static List<Product2> productList;
	public static List<PricebookEntry> pricebookEntryList;
	
	public static testMethod void Data()
	{
		Opportunity objOpportunity = new Opportunity(Name='Ketaki', CloseDate=Date.parse('2/26/2013'), StageName='Closed Won');
		Database.insert(objOpportunity);

		productList = new List<Product2>{new Product2(Name = 'Monitor', ProductCode = 'CM-001'),
										 new Product2(Name = 'CPU', ProductCode = 'CC-002'),
										 new Product2(Name = 'Mouse', ProductCode = 'CM-003'),
										 new Product2(Name = 'Keyboard', ProductCode = 'CK-004')
										};
		Database.insert(productList);
		
		Pricebook2 pricebook = [select id from Pricebook2 where isStandard=TRUE];

		pricebookEntryList = new List<PricebookEntry>{
							new PricebookEntry(Pricebook2Id = pricebook.Id, Product2Id = productList[0].Id,
												UnitPrice = 500, IsActive = true),
							new PricebookEntry(Pricebook2Id = pricebook.Id, Product2Id = productList[1].Id, 
												UnitPrice = 800, IsActive = true),
							new PricebookEntry(Pricebook2Id = pricebook.Id, Product2Id = productList[2].Id,
												UnitPrice = 300, IsActive = true),
							new PricebookEntry(Pricebook2Id = pricebook.Id, Product2Id = productList[3].Id,
												UnitPrice = 400, IsActive = true)
				   			};
		Database.insert(pricebookEntryList);
		
		quoteList = new List<Quote>{
							new Quote(Name = 'Ketaki Quote', Pricebook2Id = pricebook.Id, OpportunityId = objOpportunity.Id),
							new Quote(Name = 'Pallavi Quote', Pricebook2Id = pricebook.Id, OpportunityId = objOpportunity.Id)
								};
		Database.insert(quoteList);
		
		List<QuoteLineItem> quoteLineItemList = new List<QuoteLineItem>{
							new QuoteLineItem(QuoteId = quoteList[0].Id, PricebookEntryId = pricebookEntryList[0].Id,
											Quantity = 2, Discount = 5, UnitPrice = 500),
							new QuoteLineItem(QuoteId = quoteList[1].Id, PricebookEntryId = pricebookEntryList[2].Id,
											Quantity = 3, Discount = 10, UnitPrice = 300),
							new QuoteLineItem(QuoteId = quoteList[1].Id, PricebookEntryId = pricebookEntryList[1].Id,
											Quantity = 2, UnitPrice = 800),
							new QuoteLineItem(QuoteId = quoteList[0].Id, PricebookEntryId = pricebookEntryList[3].Id,
											Quantity = 5, UnitPrice = 400)
							};
		Database.insert(quoteLineItemList);

		objPurchaseOrder = new Purchase_Order__c(Name = 'Ketaki', Opportunity__c = objOpportunity.Id,
												Quote__c = quoteList[0].Id);

		Database.Insert(objPurchaseOrder);
	}
}