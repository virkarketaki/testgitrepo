public with sharing class AngularJsController
{
	public list<Account> lstAccount{get;set;}
	public list<Selectoption> listSelectAcc{get;set;}
	public String selectedAccount{get;set;}
	public list<String> listStr{get;set;}
	public map<Id,Account> mapAccName{get;set;}
	
	public Integer firstNo{get;set;}
	public Integer secondNo{get;set;}
	
	public String JsonLstAcc{get;set;}
	
	public AngularJsController()
	{
		lstAccount = new list<Account>();
		lstAccount = [Select a.Type, a.SystemModstamp, a.Phone, a.Name, a.Id, a.CreatedDate From Account a limit 2];
		listStr = new list<String>();
		listSelectAcc = new list<Selectoption>();
		mapAccName = new map<Id, Account>();
		for(Account objAccount : lstAccount)
		{
			listSelectAcc.add(new Selectoption(objAccount.Id, objAccount.Name));
			listStr.add(objAccount.Name);
			mapAccName.put(objAccount.Id, objAccount);
		}
		
		firstNo = 5;
		secondNo = 10;
		
		JsonLstAcc = JSON.serialize(lstAccount);
	}
	
	public void testMethod1()
	{
		system.debug('*********'+firstNo+'++++++++++'+secondNo);
	}
	
	/*@RemoteAction  
    public static List<Account> getData(){  
    	return lstAccount;  
   	}  */
}