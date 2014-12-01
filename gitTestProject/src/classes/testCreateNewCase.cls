@isTest
private class testCreateNewCase { 
 
static testMethod void myUnitTest()
 {
 
 Case objCase = new Case();
 
     test.startTest();
     
     ApexPages.standardController controller = new ApexPages.standardController(new Case());
     CreateNewCaseController objCreateCase = new CreateNewCaseController(controller);
     
     objCreateCase.getCaseId();
     objCreateCase.getFinishPage();
     
     test.stopTest();
 }
 }