global class OpportunityAggregator implements Database.Batchable<sObject>, Database.Stateful
{	
	global Integer totalRecords{get;set;}
	global Decimal totalAmount;
		
	global String query;	
		
	global OpportunityAggregator()
	{
		query = 'Select o.StageName, o.Id, o.CreatedDate, o.Amount From Opportunity o where o.StageName = \'Closed Won\' AND o.CreatedDate =TODAY';
		
	    this.totalRecords = 0;
	    this.totalAmount = 0.0;
	}
		
    global Database.QueryLocator start(Database.BatchableContext BC)
    {    
    	
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext BC, List<sObject> scope)
    {
        for(sObject s : scope)
        {
            Opportunity opportunity = (Opportunity)s;
            this.totalRecords++;
            totalAmount += opportunity.Amount;
            opportunity.IsAggregated__c = true;
            update opportunity;
        } 
    }

    global void finish(Database.BatchableContext BC)
    {
    	Messaging.Singleemailmessage email = new Messaging.Singleemailmessage();
     
        AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed,CompletedDate,CreatedDate,
      TotalJobItems, CreatedBy.Email
      FROM AsyncApexJob WHERE Id =
      :BC.getJobId()];
        
        email.setToAddresses(new String[] {'ketaki.virkar@eternussolutions.com'});
        email.setReplyTo('ketaki.virkar@eternussolutions.com');
        email.setSenderDisplayName('Ketaki Batch');
        email.setSubject('Daily Opportunity Amount Aggregator Job Complete');
        email.setPlainTextBody('Hello');
        email.setHtmlBody('<b>Start DateTime: </b>'
                          + a.CreatedDate
                          + '<br/><b>End DateTime:</b>'
                          + a.CompletedDate
                          + '<br/><b>Total Duration(in Hours):<b/>'
                          +'<br/><b>Number of Opportunities Closed Won Today<b/> = '
                          + totalRecords
                          + '<br/><b>Total Opportunity Amount for today<b/> = '
                          + totalAmount);
                     
       Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email }); 
    }
}