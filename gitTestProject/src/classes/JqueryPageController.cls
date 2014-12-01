public with sharing class JqueryPageController
{
    public Account objAccount;
    public List<Account> listAccount{get;set;}
    
    public Id selectedAccountId{get;set;}
    
    
    public string strdate{get;set;}
    
    public JqueryPageController(ApexPages.StandardController controller)
    {
        objAccount = (Account)controller.getRecord();
        
        listAccount = [Select c.Name, c.Id From Account c];
    }
    
    public void setObjAccount(Account objectAccount)
    {
        this.objAccount = objectAccount;
    }
    
    public Account getObjAccount()
    {
      /*  if(!(listAccount.isEmpty()))
            return listAccount[0];
        return null;*/
        
        return objAccount;
        
    }
    
    
    public List<SelectOption> getItems()
    {
        List<SelectOption> options = new List<SelectOption>();
        for(Account objAcc : listAccount)
        {
            options.add(new SelectOption(objAcc.Id, objAcc.Name));
        }
        return options;
    }
    
    
    
    public void saveInterviewDate()
    {
        /*String selDate = Apexpages.currentPage().getParameters().get('interviewDate');  
        system.debug('***************'+selDate);*/
        
        selectedAccountId = (Apexpages.currentPage().getParameters().get('interviewDate'));
        system.debug('***************'+selectedAccountId );
        if(selectedAccountId != null)
        {
        List<Account> accList = [Select c.Name, c.Id From Account c where c.Id =: selectedAccountId];
        system.debug(accList[0]);
        if(!accList.isEmpty())
        {
            setObjAccount(accList[0]);
        }
        }
    }
}