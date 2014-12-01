/* Trigger for Quote_Purchase__c object
 * 
 * Revision History:
 *
 * Version       Date                 Author              Comments
 *  1.0        22/1/2012           Ketaki Virkar        Initial Draft
 *
 */

trigger QuotePurchaseTrigger on Quote_Purchase__c (before insert, before update)
{
	Quote_Purchase__c quotePurchase = Trigger.new[0];
	
	QuotePurchaseHandler quotePurchaseHandler = new QuotePurchaseHandler();
	quotePurchaseHandler.test(quotePurchase);	
}