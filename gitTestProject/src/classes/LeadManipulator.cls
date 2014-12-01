@RestResource(urlMapping='/showLeads/*')
global with sharing class LeadManipulator 
{	
	
	@HttpPost
	global static Map<string,string> doPost(String firstName, String lastName, String email, String phone)
	{
		Map<string,string> leadMap = new Map<string,string>();
	    Lead lead = new Lead();
	    lead.FirstName = firstName;
	    lead.LastName = lastName;
	    lead.Email = email;
	    lead.Phone = phone;
	    lead.Company = 'eternus';
	    try
	    {
	        insert lead;
	        if(lead.Id != NULL)
	        {
	            leadMap.put('isSuccess','true');
	            leadMap.put('Id',lead.id);
	            leadMap.put('Status','Success');
	        }
	    }
	    catch(DmlException e)
	    {
	        leadMap.put('Error Message','Cannot insert Record. Please Enter Valid Data');
	        leadMap.put('Id',' ');
	        leadMap.put('Status','Fail');
	    }
	    return leadMap;
	}
	
	
	@HttpPatch
	global static List<Map<string,string>> doPatch(String firstName, String lastName, String newEmail, String newPhone)
	{
		
		List<Lead> leadList = new List<Lead>();
		
		Integer flag = 0;
		
		leadList = [Select l.Phone, l.LastName, l.Id, l.FirstName, l.Email, l.Company From Lead l where l.FirstName =: firstName AND l.LastName =: lastName];
		
		
		List<Map<string,string>> lMap = new List<Map<string,string>>(); 
		
		try
	    {
		/*   
		    if(leadList == NULL)
	        {
	    	    leadMap.put('No data is found for updataion','');
	            lMap.add(leadMap);
	        }
		*/   
		    for(Lead lead : leadList)
		    {
		    	Map<string,string> leadMap = new Map<string,string>();
	            lead.Email = newEmail;
	            lead.Phone = newPhone;
	            update lead;
		
	            flag = 1;
	                leadMap.put('isSuccess','true');
	                leadMap.put('Id',lead.id);
	                leadMap.put('Status','Success');
	      
	            lMap.add(leadMap);
	        }
	        
	        if(flag==0)
	        {
	        	Map<string,string> leadMap = new Map<string,string>();
	            leadMap.put('No data is found for updataion','');
	            lMap.add(leadMap);
	        }
	    }
	    catch(DmlException e)
	    {
	    	Map<string,string> leadMap = new Map<string,string>();
	        leadMap.put('Error Message','Cannot insert Record. Please Enter Valid Data');
	        leadMap.put('Id',' ');
	        leadMap.put('Status','Fail');
	        lMap.add(leadMap);
	    }
	    
	    return lMap;
	}
	
	
	@HttpDelete
	global static Map<string,string> doDelete()
	{
		Map<string,string> leadMap = new Map<string,string>();
		
		RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String str = req.requestURI.substring(req.requestURI.lastIndexOf('/') + 1);
        System.Debug(str);
        String fname = str.substringBefore(',');
        
        String str1 = str.substringAfter(',');
        System.Debug(str1);
        String lname = str1.substringBefore(',');
        
        String str2 = str1.substringAfter(',');
        System.Debug(str2);
        String phone = str2.substringBefore(',');
        
        String email = str2.substringAfter(',');
     
        List<Lead> leadList = [SELECT ID from Lead where FirstName =: fname AND LastName =: lname AND Phone =: phone AND Email =: email];
        
       try
        { 
      /*  	if(leadList == null)
        	{
        	    leadMap.put('No data is found for deletion','');
	            leadMap.put('Id','');
	            leadMap.put('Status','Fail');
        	}*/
        	for(Lead lead : leadList)
        	{
        	    if(lead.Id != NULL)
	            {
	                leadMap.put('isSuccess','true');
	                leadMap.put('Id',lead.id);
	                leadMap.put('Status','Success');
	            }
            delete lead;
        	}
        }        
        catch(DmlException e)
        {
             leadMap.put('isSuccess','false');
	         leadMap.put('Id',' ');
	         leadMap.put('Status','Fail');
        }
        return leadMAp;
	}
}