public with sharing class CreateNewCaseController
{   
    public CreateNewCaseController(ApexPages.StandardController controller)
    {
      
    }
    
    public Flow.Interview.Create_Case caseFlow {get; set;}
    
    public String getCaseId() 
    {
        if (caseFlow==null) 
            return '';
        else 
            return caseFlow.caseId;
    }

    public PageReference getFinishPage()
    {
        PageReference p = new PageReference('/' + getCaseId());
        p.setRedirect(true);
        return p;
    }   
}