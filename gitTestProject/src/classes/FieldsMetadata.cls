public with sharing class FieldsMetadata {
	
	public string strAPIName{get;set;}          // API name of the field
	public string label{get;set;}               // label of the field
	public string strFieldType{get;set;}        // Data type of the field
	// category of the field(e.g. Current Record, Current Lookup or Current User)
	public string category{get;set;}            
	public string strPickListValues{get;set;}  // Picklist values of the field
	public string strOperators{get;set;}       // Compatible operators for the field
	// Compatible target field data types for the field
	public string strCompatibleTargetFieldTypes{get;set;}
	public string strSoapType{get;set;}
	public string strObject1{get;set;}
	public string strObject2{get;set;}
	public string strField1{get;set;}
	public string strField2{get;set;}
	public string strRelationalRefObject1{get;set;}
	public string strRelationalRefObject2{get;set;}
}