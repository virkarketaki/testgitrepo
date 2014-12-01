public with sharing class UploadObject {

private final String SPLIT_CHAR = ',';
	private final String APPEND_CHAR = ': ';
	private final String ID = ' ID';
	
	public list<FieldsMetadata> FieldsList;
	//private map<String,String> compatibleTargetFieldTypesMap;
	
	//default constructor
	/*public UploadObject(){
		compatibleTargetFieldTypesMap = new map<String,String>();
		compatibleTargetFieldTypesMap = ENV.compatibleTargetFieldTypes();	
		system.debug('_____________'+compatibleTargetFieldTypesMap);
		} */
	
	/* mehtod accepting the parameters as Object API and Object Field API Name to get the
	  related list of fields. */  
	public list<FieldsMetadata> getFields(String pObjectAPI){
		FieldsList = new list<FieldsMetadata>();
		getSourceObjectFields(pObjectAPI);
			
		
		system.debug('FieldsList size===>'+FieldsList.size());
		
		for(FieldsMetadata objFields : FieldsList) {
				 System.debug('in side FieldsExtractorOne Field Label===>'+objFields.label);
				 System.debug('in side FieldsExtractorOne Field Label===>'+objFields.strAPIName);
				 System.debug('in side FieldsExtractorOne Field Label===>'+objFields.strFieldType);
			}
			 
		
		
		return FieldsList;
	} //end of method(getFields())

    public list<FieldsMetadata> getSourceObjectFields(String pObjectAPI){
    	FieldsMetadata objFields;
    	List<FieldsMetadata> sourceObjectFieldsList = new List<FieldsMetadata>();
    	//set<String> InValidDataTypesForSourceSet = ENV.getInValidFieldsForSourceObject();
    	  System.debug('in side source Field Label===>'+pObjectAPI);
    	Map<String, Schema.SObjectField> objectFieldsMap = 
			                                       new Map<String, Schema.SObjectField>();
		objectFieldsMap = Schema.getGlobalDescribe().get(pObjectAPI).
															getDescribe().fields.getMap();
	    Schema.SobjectType sourceObjSFDCObject = getObjectToken(pObjectAPI);
        Schema.DescribeSobjectResult sourceObjectResult = sourceObjSFDCObject.getDescribe();													
		if(objectFieldsMap != null){
			objFields = new FieldsMetadata();
	        objFields.label =  sourceObjectResult.getLabel();
	       
	        //FieldsList.add(objFields);
	        list<String> sourceFieldsList = new list<String>();
	        sourceFieldsList =  getSortedFields(objectFieldsMap);
			for(String strFieldAPI : sourceFieldsList){
        		Schema.Describefieldresult fieldResult = objectFieldsMap.get(strFieldAPI).getDescribe();
        		String StrFieldDataType = fieldResult.getType().name().toLowerCase();
        	 
        	    	//if(!(InValidDataTypesForSourceSet.contains(StrFieldDataType))) {
	        	    	objFields = new FieldsMetadata();
	        	    	objFields.label =  fieldResult.getLabel();
	        	    	objFields.strAPIName =  strFieldAPI;
	        	    	objFields.strFieldType = fieldResult.getType().name().toLowerCase().capitalize();	        	    	
	        	    	//objFields.strPickListValues = PicklistHelper.getFieldPicklistValues(fieldResult);//Picklist
	        	    	//System.debug('=========>Picklist values are  :'+objFields.strPickListValues);
	        	     
	        	    	//objFields.strOperators = OperatorHelper.getAvailableOperators(fieldResult);//Operator
	        	    		//System.debug('/////////Operator list values are  :'+objFields.strOperators);
	        	    	FieldsList.add(objFields);
        	    	//} //end if
        	} //end for
		}//end if
													
		return null;
    } //end of method(getSourceObjectFields())
    
    
     
    
    
    
    //getting the fields related to the parent object to which ObjectFieldAPI is referenced.
   
	
	//Method which returns object token of an object
    private static Schema.Sobjecttype getObjectToken(String pOjbectName){
        Map<String, Schema.Sobjecttype> globalDescribeMap = Schema.getGlobalDescribe(); 
        if(globalDescribeMap.size() > 0 && globalDescribeMap.containsKey(pOjbectName))
            return globalDescribeMap.get(pOjbectName);                        
        return null;
    }
    
    /* method which checks for whether Lookup filter is valid or not depends upon the 
       parameters provided ObjectAPI and ObjectFieldAPI */
   

    //sorted list of api names of fields based upon the sorting order of the field labels
    public static list<String> getSortedFields(Map<String, Schema.SObjectField> pObjectFieldsMap) {
    	list<String> sortedFieldsList = new list<String>();
    	list<String> temp = new list<String>();
    	list<String> fieldsLableList = new list<String>();
    	Map<String, Schema.SObjectField> objectFieldsMap = 
			                                       new Map<String, Schema.SObjectField>();	
        objectFieldsMap = pObjectFieldsMap;  
	    for(String strFieldAPI : objectFieldsMap.keySet()){
	    	Schema.Describefieldresult fieldResult = objectFieldsMap.get(strFieldAPI).getDescribe();
	    	String strLabel = fieldResult.getLabel();
	    	Boolean isFound = false;
	    	for(Integer i = 0; i < temp.size(); ++i) {
            	String str = temp.get(i);
            	if(strLabel.compareTo(str) <= 0) {
            		sortedFieldsList.add(i, strFieldAPI);
            		temp.add(i,strLabel);
            		isFound = true;
            		break;
            	}
      		}
	    // not found a greater one in the arrayList
	    if(!isFound){
	    	sortedFieldsList.add(strFieldAPI);  // so append to the end
	        temp.add(strLabel);
	    }
	    //system.debug('_________________________'+strLabel+': '+sortedFieldsList);
     }
     system.debug('_________________________'+temp);
     system.debug('_________________________'+sortedFieldsList.size());
     return sortedFieldsList;
    }

}