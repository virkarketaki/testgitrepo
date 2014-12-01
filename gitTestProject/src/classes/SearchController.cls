public with sharing class SearchController 
{
    private String searchName;
    
    List<Lead> leadList;
    List<Account> accountList;
    List<Contact> contactList;
    List<Opportunity> opportunityList;
    
    public String getSearchName()
    {
        return searchName;
    }
    
    public void setSearchName(String name)
    {
        searchName = name;
    }
    
    public List<Lead> getLeadList()
    {
        return leadList;
    }
    
    public List<Account> getAccountList()
    {
        return accountList;
    }
    
    public List<Contact> getContactList()
    {
        return contactList;
    }
    
    public List<Opportunity> getOpportunityList()
    {
        return opportunityList;
    }
    
    public pageReference searchRecords()
    {
    	
    	
    	if(searchName.length() > 1 && searchName.isAlphanumeric())
    	{
            List<List<sObject>> searchList = [
                                             FIND :searchName + '*' 
                                             IN NAME FIELDS 
                                             RETURNING 
                                             ACCOUNT(Id, First_Name__c, Last_Name__c, Name), 
                                             LEAD(Id, FirstName, LastName, Name), 
                                             CONTACT(Id, FirstName, LastName, Name), 
                                             OPPORTUNITY(Id,Name)
                                             ];
        
            leadList = (List<Lead>)searchList[1];
            accountList = (List<Account>)searchList[0];
            contactList = (List<Contact>)searchList[2];
            opportunityList = (List<Opportunity>)searchList[3];
    	}
    	else
    	{
            ApexPages.Message errorMsg = new ApexPages.Message(ApexPages.severity.ERROR, 'Please Enter Valid Data');
            ApexPages.addMessage(errorMsg);
    	}
    	return null;
    }
}