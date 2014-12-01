public with sharing class Upload_Controller {

public string nameFile{get;set;}
    public Blob contentFile{get;set;}
    String[] filelines = new String[]{};
    List<Opportunity> accstoupload;
	String ObjName='Opportunity';
	
	
		public List<FieldsMetadata> FieldsList{get;set;}  
		
		
		public Upload_Controller()
		{
			
		}
    
    public Pagereference ReadFile()
    {
    	FieldsList=new List<FieldsMetadata>();
        nameFile=contentFile.toString();
        filelines = nameFile.split('\n');
        accstoupload = new List<Opportunity>();
        List<String> supportedFields;
        list<String> inputfields1=filelines[0].split('\t');
		
			FieldsList = new UploadObject().getFields('Opportunity');
			 System.debug('FieldsList size===>'+FieldsList.size());
		
		for(FieldsMetadata objFields : FieldsList) {
				 System.debug('Field Label===>'+objFields.label);
				 System.debug('Field strAPIName===>'+objFields.strAPIName);
				 System.debug('Field strFieldType===>'+objFields.strFieldType);
				 
				 
			}
		
		
        for (Integer i=1;i<filelines.size();i++)
        {
        	 Opportunity op=new Opportunity();
                 	 
            //String[] inputvalues = new String[25];
            list<String> inputvalues=new list<string>();
            //system.debug('size is....'+ filelines[i].size());
            
            inputvalues = filelines[i].split('\t');
            
            Integer cnt=inputvalues.size();
           system.debug('inputvaluess....'+ inputvalues);

		   
	
               for(Integer j=0; j<cnt;j++)
                 {
                 	
                   for(FieldsMetadata objFields : FieldsList) {
                   {
                    system.debug('value of csv'+inputfields1[j]);
						system.debug('value of csv'+inputfields1[j]);
					
					
					
                  if ((inputfields1[j]).equalsIgnoreCase(objFields.strAPIName))
                   {
				   		Id objId=Null;
				   system.debug(objFields.strAPIName+'================'+inputfields1[j]);
				
				   
				   if((inputfields1[j]).equalsIgnoreCase( 'AccountId'))
				   {
				   	
				   	
				   	String s=inputfields1[j];
				   	 system.debug('=======********========='+s);
				   	   list<Account> Id = [select Name,Id from Account where Name =: inputfields1[j]];
				   system.debug('list<Account > Id  :'+Id);
				   		if(Id!=Null)
				   		{
				   			for(Account acc:Id)
				   			{
				   				 system.debug('Account exist..........');
				   		 		op.put(objFields.strAPIName,acc.Id);
				   			}
				   		}
				   		else
				   		{
				   			 system.debug('Account Not exist..........');
				   			objId=Accid(s);
				   	 		op.put(objFields.strAPIName,objId);
				   	
				   		}
				   }
				   
				    if(objFields.label=='PriceBookId')
				   {
				   	String s=inputfields1[j];
				   	objId=PBId(s);
				   	 op.put(objFields.strAPIName,objId);
				   	
				   }
				   
				   
                   	if(((objFields.strFieldType).equalsIgnoreCase('currency')) ||((objFields.strFieldType).equalsIgnoreCase('percent')) )
                   	{
                   	Decimal d = Decimal.valueOf(inputvalues[j]);
                   	 op.put(objFields.strAPIName,d);
                   	 break;
                   	}
                   	
                   	else
                   	{
                   		if(((objFields.strFieldType).equalsIgnoreCase('Date')))
                   		{
                   			
                   			 Date  tempDate;
			            String dt=inputvalues[6];
						String[] tempStr = dt.split('-');
						Integer y = Integer.valueOf(tempStr[0]);
						Integer m = Integer.valueOf(tempStr[1]);
						Integer d = Integer.valueOf(tempStr[2]);
						tempDate =  Date.newInstance(y,m,d);
						
                   			 op.put(objFields.strAPIName,tempDate);
                   		}
                   		else
                   			 op.put(objFields.strAPIName,inputvalues[j]);
                   	}
                   	
                   
                     
                   	}
                              
            
            }
            }
            
            accstoupload.add(op);
            system.debug('accstoupload.....'+accstoupload);
        }
        try{
        	//system.debug('accstoupload....'+accstoupload);
        insert accstoupload;
        }
        catch (Exception e)
        {
            ApexPages.Message errormsg = new ApexPages.Message(ApexPages.severity.ERROR,'An error has occured. Please check the template or try again later');
            ApexPages.addMessage(errormsg);
        }    
        }
        return null;
    }
    
    
    
    public Id Accid(String s)
    {
    	 System.debug('Inside Accid Method*******');
    	
    	Account a=new Account();
    	a.Name=s;
    	insert a;
    	System.debug('New Account Id*******'+a.Id);
    	return a.id;
    }
    
    
     public Id PBId(String s)
    {
    	 System.debug('Inside Accid Method*******');
    	
    	Pricebook2 p=new Pricebook2();
    	p.Name=s;
    	insert p;
    	System.debug('New Account Id*******'+p.Id);
    	return p.id;
    }
    
    
    
    
    
    
    public List<Opportunity> getuploadedAccounts()
    {
        if (accstoupload!= NULL)
            if (accstoupload.size() > 0)
                return accstoupload;
            else
                return null;                    
        else
            return null;
    }  


}