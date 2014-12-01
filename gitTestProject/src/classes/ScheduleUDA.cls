public with sharing class ScheduleUDA {

	public String rule_name{get;set;}
	public String description {get;set;}
	public list<String> hours =new list<String>();
	
	list<String> months = new list<String>();
	list<String> dates = new list<String>();
	list<String> weekdays=new list<String>();
	list<String> minutes = new list<String>();
	list<String> ampms = new list<String>();
	public list<String> cron{get;set;}
	String temp;
	public boolean selected {get;set;}
	
	public ScheduleUDA(){
		temp='';
	}
	 public List<SelectOption> getday() {
        List<SelectOption> day = new List<SelectOption>();
        //month.add(new SelectOption('Month','Month',true));
       
        day.add(new SelectOption('mon','mon'));
        day.add(new SelectOption('tues','tues'));
        day.add(new SelectOption('Wed','Wed'));
        day.add(new SelectOption('Thrus','Thrus'));
        day.add(new SelectOption('Friday','Friday'));
        day.add(new SelectOption('Saturday','Saturday'));
        day.add(new SelectOption('Sun','Sun'));
       
        
        return day;
        }
    
    public List<SelectOption> gethour() {
        List<SelectOption> hour = new List<SelectOption>();
        //hour.add(new SelectOption('Hour','Hour',true));
        hour.add(new SelectOption('1','1'));
        hour.add(new SelectOption('2','2'));
        hour.add(new SelectOption('3','3'));
        hour.add(new SelectOption('4','4'));
        hour.add(new SelectOption('5','5'));
        hour.add(new SelectOption('6','6'));
        hour.add(new SelectOption('7','7'));
        hour.add(new SelectOption('8','8'));
        hour.add(new SelectOption('9','9'));
        hour.add(new SelectOption('10','10'));
        hour.add(new SelectOption('11','11'));
        hour.add(new SelectOption('12','12'));
        return hour;
    }
    
    public List<SelectOption> getmonth() {
        List<SelectOption> month = new List<SelectOption>();
        //month.add(new SelectOption('Month','Month',true));
        month.add(new SelectOption('*','SelectAll'));
        month.add(new SelectOption('Jan','Jan'));
        month.add(new SelectOption('Feb','Feb'));
        month.add(new SelectOption('Mar','Mar'));
        month.add(new SelectOption('Apr','Apr'));
        month.add(new SelectOption('May','May'));
        month.add(new SelectOption('Jun','Jun'));
        month.add(new SelectOption('Jul','Jul'));
        month.add(new SelectOption('Aug','Aug'));
        month.add(new SelectOption('Sep','Sep'));
        month.add(new SelectOption('Oct','Oct'));
        month.add(new SelectOption('Nov','Nov'));
        month.add(new SelectOption('Dec','Dec'));
        
        return month;
        }
        
        public List<SelectOption> getddate() {
        List<SelectOption> ddate = new List<SelectOption>();
        //ddate.add(new SelectOption('Date','Date',true));
        ddate.add(new SelectOption('*','SelectAll'));
        ddate.add(new SelectOption('1','1'));
        ddate.add(new SelectOption('2','2'));
        ddate.add(new SelectOption('3','3'));
        ddate.add(new SelectOption('4','4'));
        ddate.add(new SelectOption('5','5'));
        ddate.add(new SelectOption('6','6'));
        ddate.add(new SelectOption('7','7'));
        ddate.add(new SelectOption('8','8'));
        ddate.add(new SelectOption('9','9'));
        ddate.add(new SelectOption('10','10'));
        ddate.add(new SelectOption('11','11'));
        ddate.add(new SelectOption('12','12'));
        ddate.add(new SelectOption('13','13'));
        ddate.add(new SelectOption('14','14'));
        ddate.add(new SelectOption('15','15'));
        ddate.add(new SelectOption('16','16'));
        ddate.add(new SelectOption('17','17'));
        ddate.add(new SelectOption('18','18'));
        ddate.add(new SelectOption('19','19'));
        ddate.add(new SelectOption('20','20'));
        ddate.add(new SelectOption('21','21'));
        ddate.add(new SelectOption('22','22'));
        ddate.add(new SelectOption('23','23'));
        ddate.add(new SelectOption('24','24'));
        ddate.add(new SelectOption('25','25'));
        ddate.add(new SelectOption('26','26'));
        ddate.add(new SelectOption('27','27'));
        ddate.add(new SelectOption('28','28'));
        ddate.add(new SelectOption('29','29'));
        ddate.add(new SelectOption('30','30'));
        ddate.add(new SelectOption('31','31'));
        return ddate;
    }
    
    public List<SelectOption> getminute() {
        List<SelectOption> minute = new List<SelectOption>();
        //minute.add(new SelectOption('Minutes','Minutes',true));
        minute.add(new SelectOption('00','00'));
        minute.add(new SelectOption('05','05'));
        minute.add(new SelectOption('10','10'));
        minute.add(new SelectOption('15','15'));
        minute.add(new SelectOption('20','20'));
        minute.add(new SelectOption('25','25'));
        minute.add(new SelectOption('30','30'));
        minute.add(new SelectOption('35','35'));
        minute.add(new SelectOption('40','40'));
        minute.add(new SelectOption('45','45'));
        minute.add(new SelectOption('50','50'));
        minute.add(new SelectOption('55','55'));
        
        return minute;
    }
     public PageReference getSelected()
    {
    	
       
        return null;
    
    	
    }
    
    public List<SelectOption> getampm() {
        List<SelectOption> ampm = new List<SelectOption>();
        //ampm.add(new SelectOption('AM','AM/PM',true));
        ampm.add(new SelectOption('AM','AM'));
        ampm.add(new SelectOption('PM','PM'));
		return ampm;
    }
    
	public list<String> getweekdays() {
  	 	return weekdays;
 	}

 	public void setweekdays(list<String> weekdays) {
 	 	this.weekdays = weekdays;
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
 	
 	public list<String> getminutes() {
  	 	return minutes;
 	}

 	public void setminutes(list<String> minutes) {
 	 	this.minutes = minutes;
 	}
 	
 	public list<String> getampms() {
  	 	return ampms;
 	}

 	public void setampms(list<String> ampms) {
 	 	this.ampms = ampms;
 	}
 	
 	public void click(){
 		for(String min: minutes){
 			temp= temp + min +',';
 			}
 		temp = temp.subString(0, temp.length() - 1);
 		temp=temp+' ';
 		
 		for(String hr: hours){
 			temp= temp + hr +',';
 			}
 		temp = temp.subString(0, temp.length() - 1);
 		temp=temp+' ';
 		
 		for(String dt: dates){
 			temp= temp + dt +',';
 			}
 		temp = temp.subString(0, temp.length() - 1);
 		temp=temp+' ';
 		
 		for(String mth: months){
 			temp= temp + mth +',';
 			}
 		temp = temp.subString(0, temp.length() - 1);
 		temp=temp+' ';
 		
 		for(String wkd: weekdays){
 			temp= temp + wkd +',';
 			}
 		temp = temp.subString(0, temp.length() - 1);
 		//temp=temp+' ';
 		system.debug('final cron string>>>>>>>>>>'+temp);
 		
 		}//end click function
	}//end program