public with sharing class DynamicApex 
{
    String objName;
    Schema.SObjectType targetType;
    
    public DynamicApex()
    {
        objName = '';
    }
    
    public void setObjName(String name)
    {
        objName = name;
    }
    
    public String getObjName()
    {
        return objName;
    }
    
    public Schema.SObjectType getTargetType()
    {
        return targetType;
    }
    
    public void Query(String name)
    {
        setObjName(name);
        targetType = Schema.getGlobalDescribe().get(getObjName());
    
        if (targetType == null) 
        {
            system.debug(objName + 'object not found: ');
        }
  
        else
        {
            Schema.DescribeSObjectResult typedescription = targetType.getDescribe();
            Map<String, schema.Sobjectfield> resultMap = typedescription.Fields.getMap();
            String query = 'SELECT ' + string.join(new List<string>(typedescription.Fields.getMap().keySet()), ',') + ' FROM '+ objName;
            System.Debug(query);
        }
    }
}