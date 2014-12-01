/* Trigger for inserting record in Purchase_Order__c object
 * 
 * Revision History:
 *
 * Version       Date                 Author              Comments
 *  1.0        22/1/2012           Ketaki Virkar        Initial Draft
 *
 */

trigger Order on Purchase_Order__c (after insert) 
{
	if(Trigger.isInsert)
	{
		Integer flag=1;
		Purchase_Order__c purchaseOrder = Trigger.new[0];
	
		OrderHandler orderHandler = new OrderHandler();
	
		orderHandler.Test(purchaseOrder);	
	}
}