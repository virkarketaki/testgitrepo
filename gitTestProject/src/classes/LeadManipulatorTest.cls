@isTest
public with sharing class LeadManipulatorTest 
{
	static RestRequest request = new Restrequest();
	static RestResponse response = new RestResponse();
	
	static testMethod void PostTest()
	{
		Map<String,String> leadMap = new Map<String,String>();
		
	    request.requestURI = 'services/apexrest/showLeads/';
	    request.httpMethod = 'Post';
	    
	    RestContext.request = request;
	    RestContext.response = response;
	    
	    leadMap = LeadManipulator.doPost('test1','test1','test1@test.com','123456');
	    System.assertEquals('Success',leadMap.get('Status'));
	    System.assertEquals('true',leadMap.get('isSuccess'));
	    
	    leadMap = LeadManipulator.doPost('test1','test1','test1.com','123456');
	    System.assertEquals('Cannot insert Record. Please Enter Valid Data',leadMap.get('Error Message'));
	    System.assertEquals('Fail',leadMap.get('Status'));
	}
	
	
	static testMethod void PatchTest()
	{
		List<Map<String,String>> leadList = new List<Map<String,String>>();
	    
	    Lead lead = new Lead();
	    lead.FirstName = 'Test';
	    lead.LastName = 'Test1';
	    lead.Company = 'XYZ';
	    lead.Email = 'test@test.com';
	    lead.Phone = '123456789';
	    
	    insert lead;
	    
	    request.requestURI = 'services/apexrest/showLeads/';
	    request.httpMethod = 'Patch';
	    
	    RestContext.request = request;
	    RestContext.response = response;
	    
	    leadList = LeadManipulator.doPatch('Test','Test1','test1@test1.com','1234');
	    
	    for(Map<String,String> leadMap : leadList)
	    {
	        System.assertEquals('Success',leadMap.get('Status'));
	        System.assertEquals('true',leadMap.get('isSuccess'));
	    }
	    
	    leadList = LeadManipulator.doPatch('Test','Test2','test1@test1.com','1234');
	    for(Map<String,String> leadMap : leadList)
	    {
	        System.assertEquals('',leadMap.get('No data is found for updataion'));
	    }
	    
	    leadList = LeadManipulator.doPatch('Test','Test1','test1.com','1234');
	    for(Map<String,String> leadMap : leadList)
	    {
	    	System.assertEquals('Fail',leadMap.get('Status'));
	        System.assertEquals('Cannot insert Record. Please Enter Valid Data',leadMap.get('Error Message'));
	    }
	}
	
	static testMethod void DeleteTest()
	{
		Map<string,string> leadMAp = new Map<string,string>();
		
	    Lead lead = new Lead();
	    lead.FirstName = 'Test';
	    lead.LastName = 'Test1';
	    lead.Company = 'XYZ';
	    lead.Email = 'test@test.com';
	    lead.Phone = '123456789';
	    
	    insert lead;
	    
	    request.requestURI = 'services/apexrest/showLeads/Test,Test1,123456789,test@test.com';
	    request.httpMethod = 'Delete';
	    
	    RestContext.request = request;
	    RestContext.response = response;
	    
	    leadMAp = LeadManipulator.doDelete();
	    System.assertEquals('Success',leadMap.get('Status'));
	    System.assertEquals('true',leadMap.get('isSuccess'));
	    
/*	    request.requestURI = 'services/apexrest/showLeads/Test,Test1,123456,test.com';
	    request.httpMethod = 'Delete';
	    
	    RestContext.request = request;
	    RestContext.response = response;
	    
	    leadMAp = LeadManipulator.doDelete();
	    System.assertEquals('Fail',leadMap.get('Status'));
	    System.assertEquals('false',leadMap.get('isSuccess'));*/
	}
}