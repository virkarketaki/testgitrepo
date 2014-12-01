public with sharing class ContactFlowController
{
	public list<Contact> listContact{get;set;}
	public Flow.Interview.TestContactFlow contactFlow {get; set;}
	public Integer counter{get;set;}
	public String contName;
	public Boolean flag{get;set;}
	public ContactFlowController(ApexPages.StandardController Controller) 
    {
    	flag=true;
    	counter = 0;
    	listContact = new list<Contact>();
    	allContact();
    }
    
    public void allContact()
    {
    	listContact = [Select c.Phone, c.Name, c.LastName, c.Id, c.FirstName, c.AccountId From Contact c];
    }
    
    public void setContName(String str)
    {
    	if(counter < listContact.size())
    	{
    		contName = listContact[counter].Name;
    	}
    }
    public string getContName()
    {
    	if(counter < listContact.size())
    	{
    		contName = listContact[counter].Name;
    		return contName;
    	}
    	return '';
    }
    
    public PageReference  getFinishLocation()
    {
    	if(counter < listContact.size())
    	{
    		flag=true;
    		counter++;
    	}
    	else
    		flag=false;
    	return null;
    }
}