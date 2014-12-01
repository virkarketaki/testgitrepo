public with sharing class CustomContactPageController
{
	public Contact objContact{get;set;}
	public Boolean isNew{get;set;}
	public String recordTypeName{get;set;}
	public Boolean isConsumer{get;set;}
	public Boolean isPortal{get;set;}
	
	public CustomContactPageController(ApexPages.StandardController Controller)
	{
		objContact = (Contact) controller.getRecord();
		if(objContact.Id != null)
		{
			objContact = [Select c.Title, c.OwnerId, c.RecordTypeId, c.AccountId, c.ReportsToId, c.Phone, c.OtherStreet, c.OtherState, c.OtherPostalCode, c.OtherPhone, c.OtherCountry, c.OtherCity, c.Name, c.MobilePhone, c.MasterRecordId, c.MailingStreet, c.MailingState, c.MailingPostalCode, c.MailingCountry, c.MailingCity, c.LeadSource, c.LastName, c.Id, c.HomePhone, c.FirstName, c.Fax, c.Email, c.Description, c.Department, c.Birthdate, c.AssistantPhone, c.AssistantName From Contact c where c.Id =: objContact.Id limit 1];
			isNew = false;
		}
		else
		{
			objContact = new Contact();
			objContact.OwnerId = UserInfo.getUserId();
			isNew = true;
		
			objContact.RecordTypeId = ApexPages.currentPage().getParameters().get('RecordType');
		}
		
		Map<String, Schema.RecordTypeInfo> recordTypeInfoContact = Schema.SObjectType.Contact.getRecordTypeInfosByName();
		for(String recType : recordTypeInfoContact.keySet())
        {
        	if(recordTypeInfoContact.get(recType).getRecordTypeId() == objContact.RecordTypeId)
        		recordTypeName = recordTypeInfoContact.get(recType).getName();
        }
        
        if(recordTypeName.equals('Consumer'))
        {
        	isConsumer = true;
        	isPortal = false;
        }
        else if(recordTypeName.equals('Portal'))
        {
        	isConsumer = false;
        	isPortal = true;
        } 
	}
	
    public List<Schema.FieldSetMember> getContactInfoFields1()
    {
        return SObjectType.Contact.FieldSets.ContactInfoFieldSet1.getFields();
    }
    
    public List<Schema.FieldSetMember> getContactInfoFields2()
    {
        return SObjectType.Contact.FieldSets.ContactInfoFieldSet2.getFields();
    }
    
    public List<Schema.FieldSetMember> getAddrInfoFields()
    {
        return SObjectType.Contact.FieldSets.AddrInfoFieldSet.getFields();
    }
    
    private Contact getContact()
    {
        String query = 'SELECT ';
        for(Schema.FieldSetMember objFieldSetMember : this.getContactInfoFields1())
        {
            query += objFieldSetMember.getFieldPath() + ', ';
        }
        
        for(Schema.FieldSetMember objFieldSetMember : this.getContactInfoFields2())
        {
            query += objFieldSetMember.getFieldPath() + ', ';
        }
        
        for(Schema.FieldSetMember objFieldSetMember : this.getAddrInfoFields())
        {
            query += objFieldSetMember.getFieldPath() + ', ';
        }
        
        query += 'Id, OwnerId, Phone, Fax, Description FROM Contact where Id =: attendanceId';
        return Database.query(query);
    }
    
    public Pagereference saveRecord()
    {
    	try
    	{
    		upsert objContact;
    	}
    	catch(DmlException ex)
    	{
    		return null;
    	}
    	return new PageReference('/'+objContact.Id);
    }
    
    public Pagereference cancelRecord()
    {
    	if(isNew)
    	{
    		Schema.DescribeSObjectResult dsr = Contact.SObjectType.getDescribe();
    		return new PageReference('/' + dsr.getKeyPrefix() + '/o');
    	}
    	return new PageReference('/'+objContact.Id);
    }
}