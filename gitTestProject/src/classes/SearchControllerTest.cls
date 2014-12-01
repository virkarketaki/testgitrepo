@isTest
public with sharing class SearchControllerTest 
{
    public static testMethod void searchTest()
    {   
        
        Account account = new Account (Name = 'Ketaki Virkar',Last_Name__c= 'Virkar',First_Name__c='Ketaki',Email__c='ketaki@virkar.com');
        Database.insert(account);
        
        Contact contact = new Contact (LastName = 'Virkar',FirstName='Ketaki');
        Database.insert(contact);
        
        Opportunity opportunity = new Opportunity(Name ='Ketaki Virakr',CloseDate = system.today(),StageName = 'Pledge');
        insert opportunity;
        
        Lead lead = new Lead (FirstName = 'Ketaki',LastName = 'Virkar',Company = 'Eternus');
        insert lead;
        
        Test.startTest();
        
        SearchController scont = new SearchController();
        scont.setSearchName('ket');
        
        scont.getSearchName();   
                
        Id [] fixedSearchResults= new Id[4];
        fixedSearchResults[0] = account.Id;
        fixedSearchResults[1] = lead.Id;
        fixedSearchResults[2] = contact.Id;
        fixedSearchResults[3] = opportunity.Id;        
        
        Test.setFixedSearchResults(fixedSearchResults);
       
        scont.searchRecords();
        
        List<Account> acc = scont.getAccountList();
        System.assertEquals(fixedSearchResults[0],acc[0].ID); 
         
        List<Lead> lea = scont.getLeadList();
        System.assertEquals(fixedSearchResults[1],lea[0].Id);
        
        List<Contact> con = scont.getContactList();
        System.assertEquals(fixedSearchResults[2],con[0].Id); 
               
        List<Opportunity> opp = scont.getOpportunityList();
        System.assertEquals(fixedSearchResults[3],opp[0].Id); 
        
        
        scont.setSearchName('d');
        scont.searchRecords();
        
        System.assert(ApexPages.getMessages().get(0).getDetail()== 'Please Enter Valid Data');
        System.assert(ApexPages.getMessages().get(0).getSeverity()== ApexPages.Severity.ERROR);  
        
        
        scont.setSearchName('ket@');
        scont.searchRecords();
        
        System.assert(ApexPages.getMessages().get(0).getDetail()== 'Please Enter Valid Data');
        System.assert(ApexPages.getMessages().get(0).getSeverity()== ApexPages.Severity.ERROR); 
      
      
        scont.setSearchName('');
        scont.searchRecords();
        
        System.assert(ApexPages.getMessages().get(0).getDetail()== 'Please Enter Valid Data');
        System.assert(ApexPages.getMessages().get(0).getSeverity()== ApexPages.Severity.ERROR); 
      
        Test.stopTest();
    }
}