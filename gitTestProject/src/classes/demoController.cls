public with sharing class demoController
{
	public Id campaignId{get;set;}
	public CampaignMember campaignMember;	
	public List<Campaign> listCampaign{get;set;}
	public Campaign campaign;

	public demoController(ApexPages.StandardController controller)
    {
    	campaignId = ApexPages.currentPage().getParameters().get('cid');
    	campaignMember = (CampaignMember) controller.getRecord();
    	listCampaign = [Select c.Name, c.Id From Campaign c where c.Id =: campaignId];
    }   

	public void setCampaign(Campaign campaign)
	{
		this.campaign = campaign;
	}

	public Campaign getCampaign()
	{
		if(listCampaign != null)
			return listCampaign[0];
		else
			return null;
	}

    public PageReference save()
    {
    	try
    	{
    		campaignMember.CampaignId = campaignId;
    		insert campaignMember;
    	}

    	catch(DmlException ex)
    	{
        	ApexPages.addMessages(ex);
        	return null;
       	}
     	return new Pagereference('/'+campaignId);
    }

    public PageReference cancel()
    {       
     	return new Pagereference('/'+campaignId);
    }       
}