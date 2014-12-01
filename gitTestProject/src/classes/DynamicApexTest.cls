@isTest
public with sharing class DynamicApexTest 
{
     static testMethod void  testDynamicApex()
     {
         DynamicApex da=new DynamicApex();
         da.setObjName('Account');
         da.Query(da.getObjName());
         System.assertEquals(Account.sObjectType,da.getTargetType());
         
         da.setObjName('abc');
         da.Query(da.getObjName());
         System.assertEquals(null,da.getTargetType());
     }
}