global with sharing class Schedule implements Schedulable
{
	public Date startDate1;
	
	global static Id cronId{get;set;}

global Schedule()
{
	system.debug('%%%%%%%%%cronid=>'+cronId);
}

	global void execute(SchedulableContext sc) 
    {
    	system.debug('--------------> SchedulableContext--:'+sc);
    	
 		system.debug('%%%%%%%%%cronId==>'+cronId);
    	SavePage objSavePage = new SavePage();
    	
    	startDate1 = SavePage.method1();
    	
    	system.debug('!!!!!!!!!!!!!!!!!!!!Start date: '+startDate1);
    	//system.debug('!!!!!!!!!!!!!!!!!!!!end date: '+objSavePage.endDate);
    	//system.debug('%%%%%%%%%%%cronid=>'+objSavePage.cronid);
    	//system.debug('%%%%%%%%%cronid=>'+cronId);
   	
        	database.executebatch(new Batch());
    }
}