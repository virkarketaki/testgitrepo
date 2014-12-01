@RestResource(urlMapping='/AccountInfo/*')
global with sharing class webserviceForAccount
{
	@HttpGet
	global static String fetchAccounts()
	{
		list<Account> listAcccount = new list<Account>();
		listAcccount = [Select a.Rating,
							   a.Phone,
							   a.Name,
							   a.Industry,
							   a.AccountNumber
						From Account a];
	
		if(!listAcccount.isEmpty())
			return System.Json.serialize(listAcccount);
		return null;
	}// End of fetchAccounts() method
}// End of webserviceForAccount class