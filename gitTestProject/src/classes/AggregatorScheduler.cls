global with sharing class AggregatorScheduler implements Schedulable
{
    global void execute(SchedulableContext sc) 
    {
        database.executebatch(new OpportunityAggregator());
    }
}