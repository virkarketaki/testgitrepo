public with sharing class AccountTriggerHandler
{
    public AccountTriggerHandler()
    {
    	//account trigger
    }
    
    public void fetchWeekNumber(Account acc)
    {
        Boolean flag = false;
        Date dt;
        	
        Date SlaDt = acc.CreatedDate.date();
        
        if((SlaDt.month() > 6) || (SlaDt.month() == 6 && SlaDt.day() >= 25))
        {
        	dt = skyWeekNumber(Date.newInstance(SlaDt.year(), 7, 1));
        	        
            if(SlaDt >= dt)
           		flag = true;
       	}
        
       	if(!flag)
       		dt = skyWeekNumber(Date.newInstance(SlaDt.addYears(-1).year(), 7, 1));
        
       	system.debug('###############'+dt);
        Integer weekNo = ((dt.daysBetween(SlaDt))/7)+1;
   	    system.debug('*************'+weekNo);
    }
    
    public Date skyWeekNumber(Date startDate)
    {
    	Date dt = startDate.toStartofWeek();
        
        if(dt.daysBetween(startDate) >= 5)
        	dt = startDate.addDays(5-dt.daysBetween(startDate));
        else
        	dt = dt.addDays(-2);
    	return dt;
    }
}