@isTest
public with sharing class CampaignControllerTest 
{
    public static testMethod void searchTest()
    {
    	List<Campaign> camp;
    	List<Campaign> camp1;
    	
    	String name;
    	Boolean active;
    	String campType;
    	String status;
    	Date startDate;
    	Date endDate;
    	Integer pgNumber;
    	
   /* 	for(Integer i = 0; i <= 25; i++)
    	{
    		camp1[i] = new Campaign(Name='Webinar Campaign');
    	}
    	
    	Test.startTest();
        
        ApexPages.Standardcontroller controller;
        CampaignMngtController campController = new CampaignMngtController(controller);
        
        campController.setOption('Recently Modified');
        campController.ViewListSelected();
    
        camp = campController.getSearchList();
        
        System.Assert()
        
        Test.stopTest();
        
        */
    	
    	
        Campaign campaign1 = new Campaign(Name='Webinar Campaign', IsActive=true, Type='Webinar', Status='Planned', EndDate=Date.parse('2/16/2013'), StartDate=Date.parse('2/12/2013'));
        Database.insert(campaign1);
        
        Campaign campaign2 = new Campaign(Name='Training Campaign', IsActive=false, Type='Other', Status='In Progress', EndDate=Date.parse('2/12/2013'), StartDate=Date.parse('2/8/2013'));
        Database.insert(campaign2);
        
        campaign2.Status='Aborted';
        Database.update(campaign2);
        
        Campaign campaign3 = new Campaign(Name='Seminar Campaign', IsActive=false, Type='Other', Status='Planned', EndDate=Date.parse('3/6/2013'), StartDate=Date.parse('2/25/2013'));
        Database.insert(campaign3);
        
        Campaign campaign4 = new Campaign(Name='Partnership Campaign', IsActive=true, Type='Partner', Status='Completed', EndDate=Date.parse('1/16/2013'), StartDate=Date.parse('1/10/2013'));
        Database.insert(campaign4);
        
        Test.startTest();
        
        ApexPages.Standardcontroller controller;
        CampaignMngtController campController = new CampaignMngtController(controller);
        
        // For option 'Recently Modified'
        campController.setOption('Recently Modified');
        campController.ViewListSelected();
    
        camp = campController.getSearchList();
        
        System.assertEquals(camp[0].ID,campaign1.ID);
        System.assertEquals(camp[1].ID,campaign2.ID);
        System.assertEquals(camp[2].ID,campaign3.ID);
        System.assertEquals(camp[3].ID,campaign4.ID);
        
        // For option 'All Campaigns'
        campController.setOption('All Campaigns');
        campController.ViewListSelected();
    
        camp = campController.getSearchList();
        
        System.assertEquals(camp[0].ID,campaign3.ID);
        System.assertEquals(camp[1].ID,campaign1.ID);
        System.assertEquals(camp[2].ID,campaign2.ID);
        System.assertEquals(camp[3].ID,campaign4.ID);
        
        // For option 'All Active Campaigns'
        campController.setOption('All Active Campaigns');
        campController.ViewListSelected();
    
        camp = campController.getSearchList();
        
        System.assertEquals(camp[0].ID,campaign1.ID);
        System.assertEquals(camp[1].ID,campaign4.ID);
        
         // For option 'My Active Campaigns'
        campController.setOption('My Active Campaigns');
        campController.ViewListSelected();
    
        camp = campController.getSearchList();
        
        System.assertEquals(camp[0].ID,campaign1.ID);
        System.assertEquals(camp[1].ID,campaign4.ID);
       
        // For option 'Inactive Campaigns'
        campController.setOption('Inactive Campaigns');
        campController.ViewListSelected();
    
        camp = campController.getSearchList();
        
        System.assertEquals(camp[0].ID,campaign3.ID);
        System.assertEquals(camp[1].ID,campaign2.ID);
        
        
        campController.getOption();
        pgNumber = campController.getPageNumber();
        System.assertEquals(0, pgNumber);
        
        campController.next();
        pgNumber = campController.getPageNumber();
        System.assertEquals(0, pgNumber);
        
        System.assertEquals(0, campController.getPageNumber());
        
        campController.setOption('Recently Modified');
        campController.lastPage();
        System.assertEquals(0, campController.getPageNumber());
        
        campController.setOption('All Campaigns');
        campController.previous();
        System.assertEquals(0, campController.getPageNumber());
        
        campController.setOption('All Active Campaigns');
        campController.firstPage();
        System.assertEquals(0, campController.getPageNumber());
        
        campController.setOption('My Active Campaigns');
        campController.next();
        System.assertEquals(0, campController.getPageNumber());
        
        campController.setPageNumber(1);
        campController.previous();
        
        Test.stopTest();
    }
}