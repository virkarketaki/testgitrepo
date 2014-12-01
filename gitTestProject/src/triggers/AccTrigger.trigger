trigger AccTrigger on Account (before update)
{
    Account objAccount = Trigger.new[0];
  
    AccountTriggerHandler objAccountTriggerHandler = new AccountTriggerHandler();
    objAccountTriggerHandler.fetchWeekNumber(objAccount);
}