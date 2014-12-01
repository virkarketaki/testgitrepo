@isTest
public with sharing class OpportunityAggregatorTest 
{
    public static testMethod void batchTest()
    {
        Opportunity opp1 = new Opportunity(Name = 'Demo1', Amount = 500, CloseDate = Date.Parse('2/12/2013'), StageName = 'Closed Won');
        Database.insert(opp1);
        
        Opportunity opp2 = new Opportunity(Name = 'Demo2', Amount = 600, CloseDate = Date.Parse('2/11/2013'), StageName = 'Closed Won');
        Database.insert(opp2);
        
        Opportunity opp3 = new Opportunity(Name = 'Demo3', Amount = 400, CloseDate = Date.Parse('2/13/2013'), StageName = 'Closed Won');
        insert opp3;
      
        List<sObject> o = new List<sObject>();
        o.add(opp1);
        o.add(opp2);
        o.add(opp3);
        
        Test.startTest();
        
        OpportunityAggregator sch = new OpportunityAggregator();
        ID batchprocessid = Database.executeBatch(sch);
        Database.Batchablecontext bRef;
        sch.start(bRef);
        sch.execute(bRef, o);
      
        Test.stopTest();
       
        System.assertEquals(1500,sch.totalAmount);
        System.assertEquals(3,sch.totalRecords);
        System.assert(true,opp1.IsAggregated__c);
        System.assert(true,opp2.IsAggregated__c);
        System.assert(true,opp3.IsAggregated__c);
    }
}