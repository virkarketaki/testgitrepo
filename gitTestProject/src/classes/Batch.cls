global with sharing class Batch implements Database.Batchable<sObject>, Database.Stateful
{
	global SavePage objSavePage;
	
	global Batch()
	{
		objSavePage = new SavePage();
	}
	
	global Database.QueryLocator start(Database.BatchableContext BC)
    {
    	return Database.getQueryLocator([Select c.State, c.StartTime, c.NextFireTime, c.Id, c.EndTime, c.CronExpression From CronTrigger c limit 1]);
    }
   
    global void execute(Database.BatchableContext BC, List<sObject> scope)
    {
    	system.debug('%%%%%%%%%%%%Inside execute method');
    }

    global void finish(Database.BatchableContext BC)
    {
    	system.debug('%%%%%%%%%%%%Inside finish method');
    	Messaging.Singleemailmessage email = new Messaging.Singleemailmessage();
     
        AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed,CompletedDate,CreatedDate,TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id =: BC.getJobId()];
        
        email.setToAddresses(new String[] {'ketaki.virkar@eternussolutions.com'});
        email.setReplyTo('ketaki.virkar@eternussolutions.com');
        email.setSenderDisplayName('Ketaki schedule');
        email.setSubject('cron string');
        email.setPlainTextBody('Hello');
        email.setHtmlBody('<b>Start DateTime: </b>'
                          + SavePage.startDate + 'created : ' + a.CreatedDate
                          + '<br/><b>End DateTime:</b>'
                          + objSavePage.endDate
                         );
                     
       Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });
       
       system.debug('%%%%%%%%%%%%After mail send'); 
       
       
       
       
       CronTrigger objCronTrigger = [Select c.State, 
       								        c.StartTime, 
       								        c.NextFireTime, 
       								        c.Id, 
       								        c.EndTime, 
       								        c.CronExpression 
       								 From CronTrigger c 
       								 where c.CronExpression = '0 10 15,16,17 25 JUL ? 2013'];
system.debug('@@@@@@@@@@@@'+objCronTrigger);

Datetime myDate1 = datetime.valueOf('2013-07-25 14:10:00');
Datetime myDate2 = datetime.valueOf('2013-07-25 16:30:00');

system.debug('???????????????'+objCronTrigger.NextFireTime.time());

 if(objCronTrigger.NextFireTime.time() >= myDate1.time() && objCronTrigger.NextFireTime.time() <= myDate2.time())
    	{
    		system.debug('%%%%%%%%%inside if');        	
    	}
        else
        {
        	system.debug('%%%%%%%%%inside else');    
        	System.abortJob(objCronTrigger.Id);
        }
       
       
    }
}