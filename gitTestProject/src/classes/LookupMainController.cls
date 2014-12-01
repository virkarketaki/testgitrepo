public with sharing class LookupMainController
{
	public String accountName;
	public Id accountId {get; set;}
	public List<Contact> contacts {get;set;}
	
	
	
	public LookupMainController()
	{
		
		accountName = '';
	}
	
	public void setAccountName(String str)
	{
		accountName = str;
		
		system.debug('*************'+accountName);
	}
	
	public String getAccountName()
	{
		system.debug('############'+accountName);
		return accountName;
	}
	
	public PageReference findContacts()
	{
		if (null!=accountId)
		{
		   contacts=[select id,FirstName, LastName from Contact where AccountId=:accountId];
		}
		
		return null;
	}
}