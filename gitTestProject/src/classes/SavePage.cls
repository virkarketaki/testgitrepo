public with sharing class SavePage
{
	public String rule_name{get;set;}
	public String description {get;set;}
	public list<String> hours ;
	public String weekdays;
	public String weeknumbers;
	public list<String> months ;
	public list<String> dates ;
	public String minutes ;
	public list<String> ampms;
	public list<String> years;
	public list<String> cron{get;set;}
	public String temp{get;set;}
	public boolean selected {get;set;}
	
	public static Date startDate;
	public Date endDate;

	
public Id cronid;	
	
	public SavePage()
	{
		hours = new list<String>();
		weekdays = '';
		weeknumbers = '';
		months = new list<String>();
		dates = new list<String>();
		minutes = '';
		ampms = new list<String>();
		years = new list<String>();
		temp='0 ';
		selected = true;
	}
	public List<SelectOption> getweekday() {
        List<SelectOption> weekday = new List<SelectOption>();
        weekday.add(new SelectOption('2','MON'));
        weekday.add(new SelectOption('3','TUE'));
        weekday.add(new SelectOption('4','WED'));
        weekday.add(new SelectOption('5','THU'));
        weekday.add(new SelectOption('6','FRI'));
        weekday.add(new SelectOption('7','SAT'));
        weekday.add(new SelectOption('1','SUN'));
        
        return weekday;
    }
    
     public List<SelectOption> getweeknumber() {
        List<SelectOption> weeknumber = new List<SelectOption>();
        weeknumber.add(new SelectOption('#1','First'));
        weeknumber.add(new SelectOption('#2','Second'));
        weeknumber.add(new SelectOption('#3','Third'));
        weeknumber.add(new SelectOption('#4','Fourth'));
        weeknumber.add(new SelectOption('L','Last'));
                        
        return weeknumber;
    }    
    
    public List<SelectOption> gethour() {
        List<SelectOption> hour = new List<SelectOption>();
        for(Integer i = 1; i < 24; i++)
        {
        	hour.add(new SelectOption(''+i,''+i));
        }
        hour.add(new SelectOption('0','24'));
        
        return hour;
    }
    
    public List<SelectOption> getmonth() {
        List<SelectOption> month = new List<SelectOption>();
        //month.add(new SelectOption('Month','Month',true));
        //month.add(new SelectOption('*','Select All'));
        month.add(new SelectOption('JAN','JAN'));
        month.add(new SelectOption('FEB','FEB'));
        month.add(new SelectOption('MAR','MAR'));
        month.add(new SelectOption('APR','APR'));
        month.add(new SelectOption('MAY','MAY'));
        month.add(new SelectOption('JUN','JUN'));
        month.add(new SelectOption('JUL','JUL'));
        month.add(new SelectOption('AUG','AUG'));
        month.add(new SelectOption('SEP','SEP'));
        month.add(new SelectOption('OCT','OCT'));
        month.add(new SelectOption('NOV','NOV'));
        month.add(new SelectOption('DEC','DEC'));
        
        return month;
        }
        
        public List<SelectOption> getddate() {
        List<SelectOption> ddate = new List<SelectOption>();
        for(Integer i = 1; i <= 31; i++)
        {
        	ddate.add(new SelectOption(''+i,''+i));
        }
        
        return ddate;
    }
    
    public List<SelectOption> getminute() {
        List<SelectOption> minute = new List<SelectOption>();
        for(Integer i = 00; i < 60; i = i + 5)
        {
        	minute.add(new SelectOption(''+i,''+i));
        }
        
        return minute;
    }
    
    public List<SelectOption> getampm() {
        List<SelectOption> ampm = new List<SelectOption>();
        //ampm.add(new SelectOption('AM','AM/PM',true));
        ampm.add(new SelectOption('AM','AM'));
        ampm.add(new SelectOption('PM','PM'));
		return ampm;
    }
    
    public List<SelectOption> getYear() {
        List<SelectOption> year = new List<SelectOption>();
        
        for(Integer i = 2012; i <= 2080; i++)
        {
        	year.add(new SelectOption(''+i,''+i));
        }
        
        return year;
    }

	public String getweekdays() {
  	 	return weekdays;
 	}

 	public void setweekdays(String weekdays) {
 	 	this.weekdays = weekdays;
 	}


 	public String getweeknumbers() {
  	 	return weeknumbers;
 	}

 	public void setweeknumbers(String weeknumbers) {
 	 	this.weeknumbers = weeknumbers;
 	}
 	
 	public list<String> gethours() {
  	 	return hours;
 	}

 	public void sethours(list<String> hours) {
 	 	this.hours = hours;
 	}
	
	public list<String> getmonths() {
  	 	return months;
 	}

 	public void setmonths(list<String> months) {
 	 	this.months = months;
 	}
 	
 	public list<String> getdates() {
  	 	return dates;
 	}

 	public void setdates(list<String> dates) {
 	 	this.dates = dates;
 	}
 	
 	public String getminutes() {
  	 	return minutes;
 	}

 	public void setminutes(String minutes) {
 	 	this.minutes = minutes;
 	}
 	
 	public list<String> getampms() {
  	 	return ampms;
 	}

 	public void setampms(list<String> ampms) {
 	 	this.ampms = ampms;
 	}
 	
 	public list<String> getyears() {
  	 	return years;
 	}

 	public void setyears(list<String> years) {
 	 	this.years = years;
 	}
 	
 	public Date getStartDate()
 	{
 		return startDate;
 	}
 	
 	public void setStartDate(Date startDate1)
 	{
 		startDate = startDate1; 
 	}
 	
 	public Date getEndDate()
 	{
 		return endDate;
 	}
 	
 	public void setEndDate(Date endDate)
 	{
 		this.endDate = endDate; 
 	}
 	 	
 	public void click()
 	{ 		
 		temp= '0 ';
 		// adding minutes
 		if( minutes != null){
 		//for(String min: minutes){
 		//	temp = temp + min +',';
 		temp = temp + minutes;
 			//}
 		//temp = temp.subString(0, temp.length() - 1);
 		temp = temp + ' ';
 		}
 		else
 		temp = temp + '0 ';
 		
 		// adding hours
 		if( hours.size() != 0){
 		for(String hr: hours){
 			temp = temp + hr +',';
 			}
 		temp = temp.subString(0, temp.length() - 1);
 		temp = temp + ' ';
 		}
 		else
 		temp = temp + '0 ';
	
 		// adding dates
 		if( dates.size() != 0 ){
 		for(String dt: dates){
 			temp = temp + dt +',';
 			}
 		temp = temp.subString(0, temp.length() - 1);
 		temp = temp + ' ';
 		}
 		else
 	//	if( (dates.size() == 0) && (weekdays.size() !=0)){
 		if( (dates.size() == 0) && (weekdays != '')){
 			temp = temp + '? ';
 		}
 		else
 		temp = temp + '* ';
		
 		// adding months
 		if( months.size() != 0){
 		for(String mth: months){
 			temp = temp + mth +',';
 			}
 		temp = temp.subString(0, temp.length() - 1);
 		temp = temp + ' ';
 		}
 		else
 		temp = temp + '* ';

		// adding weekdays
 		if(weekdays != null)
 		{
 			if(weeknumbers == null)
 				temp = temp + weekdays;
 			else
 				temp = temp + weekdays + weeknumbers;
 			temp = temp + ' ';
 		}
 		else if( (weekdays == null) && (dates.size() !=0))
 		{
 			temp = temp + '? ';
 		}
 		else
 			temp = temp + '* ';
		
		
		// Adding Years
		if(years.size() != 0)
		{
			for(String yr: years)
			{
 				temp = temp + yr +',';
 			}
 			temp = temp.subString(0, temp.length() - 1);
		}
		else
 			temp = temp + '* ';


system.debug('*******start Date : '+getStartDate());
system.debug('*******end Date : '+endDate);

system.debug('^^^^^^^^date time : '+system.now());

if(temp != '0 0 0 ? * * *' || temp != '0 0 0 * * ? *')
{
	system.debug('##########');
	//cronid = system.schedule('schedule batch', temp, new Schedule());
	
	
	Schedule.cronId = System.schedule('schedule batch', temp, new Schedule());
	
	//system.debug('#########'+Schedule.cronId);
/*	
if(Date.today() < startDate || Date.today() > endDate)
{
	system.debug('%%%%%%%%%%inside if - abortJob');
	System.abortJob(cronid);
}*/

/*
CronTrigger objCronTrigger = [Select c.State, c.StartTime, c.NextFireTime, c.Id, c.EndTime, c.CronExpression From CronTrigger c where c.Id =: cronid];
system.debug('@@@@@@@@@@@@'+objCronTrigger);
system.debug('&&&&&&&&&&NextFireTime'+objCronTrigger.NextFireTime.date());
if(objCronTrigger.NextFireTime.date() < startDate || objCronTrigger.NextFireTime.date() > endDate)
{
	system.debug('%%%%%%%%%%inside if - abortJob');
	System.abortJob(cronid);
}
*/

/*	
	List<CronTrigger> listCronTrigger = [Select c.State, c.StartTime, c.NextFireTime, c.Id, c.EndTime, c.CronExpression From CronTrigger c where c.Id =: cronid limit 1];
	system.debug('@@@@@@@@@@@@'+listCronTrigger);
*/	

}
		
 		}//end click function
 		
 		
 		public static Date method1()
 		{
 			return startDate ;
 		}
 		public void sel()
 		{
 			selected = false;
 		}
	}//end program