/* Controller of GeneratePdf page to generate bill in PDF format
 * 
 * Revision History:
 *
 * Version       Date                 Author              Comments
 *  1.0        22/2/2013           Ketaki Virkar        Initial Draft
 *
 */

public with sharing class GeneratePdfController 
{	
	Quote quote = new Quote();
	Purchase_Order__c purchaseOrder;
	List<Quote_Purchase__c> quotePurchaseList = new List<Quote_Purchase__c>();
		
	public GeneratePdfController(ApexPages.StandardController Controller)
	{
		purchaseOrder = [select id, Quote__c, Total_Bill__c, Grand_Total__c
		                 from Purchase_Order__c
		                 where id =: ApexPages.currentPage().getParameters().get('id')
		                ];
		
		quote = [Select q.TotalPrice, q.Tax, q.Subtotal, q.Status, q.ShippingStreet, q.ShippingState,
						q.ShippingPostalCode, q.ShippingName, q.ShippingCountry, q.ShippingCity, q.QuoteToState,
						q.QuoteToPostalCode, q.QuoteToName, q.QuoteToCity, q.QuoteNumber, q.QuoteToStreet,
						q.Pricebook2Id, q.Phone, q.OpportunityId, q.Name, q.Id, q.GrandTotal, q.Fax, q.LineItemCount,
						q.ExpirationDate, q.Email, q.Discount, q.ContactId, q.BillingState, q.BillingPostalCode,
						q.BillingName, q.BillingCountry, q.BillingCity, q.BillingStreet, q.AdditionalState,
						q.AdditionalPostalCode, q.AdditionalName, q.AdditionalStreet, q.AdditionalCity
				 From Quote q
				 where q.Id=: purchaseOrder.Quote__c
				];
				
		quotePurchaseList = [Select q.Total_Price__c, q.Sales_Price__c, q.Quote1__c, q.Quantity__c, q.Product1__c,
		                            q.Order__c , q.Name, q.Id, q.Discount__c
		                     From Quote_Purchase__c q
		                     where q.Order__c =: purchaseOrder.Id AND q.Quote1__c =: quote.Id
		                    ];			    
		
	}
	
	public Purchase_Order__c getPurchaseOrder()
	{
		return purchaseOrder;
	}
	
	public void setQuote(Quote q)
	{
		quote = q;
	}
	
	public Quote getQuote()
	{
		return quote;
	}
/*	
	public void setQuotePurchaseList(List<Quote_Purchase__c> qp)
	{
		quotePurchaseList = qp;
	}
*/	
	public List<Quote_Purchase__c> getQuotePurchaseList()
	{
		return quotePurchaseList;
	}

	public Date getCurrentDate()
	{
		return Date.today();
	}
	
	public String getName()
	{
		Opportunity[] opportunity = [Select o.Name, o.Id
		  							 From Opportunity o
		  							 where o.Id =: quote.OpportunityId
		  							];
		return opportunity[0].Name;
	}

}