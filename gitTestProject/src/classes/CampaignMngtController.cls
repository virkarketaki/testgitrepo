public with sharing class CampaignMngtController 
{
    String[] viewList; 
    List<Campaign> searchList;
    String option;
        
    Integer pageSize{get;set;}
    Integer pageNumber;
    Integer totalPages;
    Integer totalRecords{get;set;}
    Integer offset;
    
    public CampaignMngtController(ApexPages.StandardController Controller) 
    {
    	pageSize=10;
    	pageNumber=0;
    	totalRecords =[Select COUNT() From Campaign];
            totalPages = totalRecords/pageSize;
            if (Math.mod(totalRecords, pageSize) > 0)
                totalPages++;
    	
    	searchList = [SELECT Id,Name,StartDate,Status,Type FROM Campaign ORDER BY LastActivityDate DESC NULLS FIRST LIMIT :pageSize];
    	
    	this.option = 'Recently Modified';
    	
        viewList = new String[] {'Recently Modified', 'All Campaigns', 'All Active Campaigns', 'My Active Campaigns','Inactive Campaigns'};
        
        this.viewOptions = new SelectOption[]{};
        
        for(String v : viewList )
        {
            this.viewOptions.add(new Selectoption(v,v));
        }
    }
    
    public SelectOption[] viewOptions
    { 
		public get;
		private set;
	}
	
	public String getOption()
	{
	    return this.option;
	}
	
	public void setOption(String opt)
	{
	    this.option = opt;
	}
	
	public List<Campaign> getSearchList()
    {
        return this.searchList;
    }
    
    public void setSearchList(List<Campaign> searchLst)
    {
        this.searchList = searchLst;
    }
    
   
    
    public Integer getPageNumber()
	{
	    return this.pageNumber;
	}
	
	public void setPageNumber(Integer pgNumber)
	{
	    this.pageNumber = pgNumber;
	}
    public Integer getTotalPages()
	{
	    return this.totalPages;
	}
	
	public void setTotalPages(Integer totalPg)
	{
	    this.totalPages = totalPg;
	}
  
    private void searchRecords()
    {
        Integer offset = pageNumber * pageSize;
        if(option == 'Recently Modified')
        {
        	searchList = Database.query('SELECT Id,Name,StartDate,Status,Type FROM Campaign ORDER BY LastActivityDate DESC NULLS FIRST limit '+pageSize+' offset '+offset);
        }
        if(option == 'All Campaigns'){
        	searchList = Database.query('SELECT Id,Name,StartDate,Status,Type FROM Campaign ORDER BY StartDate Desc limit '+pageSize+' offset '+offset);
        }
        if(option == 'All Active Campaigns'){
        	searchList = Database.query('SELECT Id,Name,StartDate,Status,Type FROM Campaign WHERE IsActive=TRUE ORDER BY StartDate Desc limit '+pageSize+' offset '+offset);
        }
        if(option == 'My Active Campaigns'){
        	Id temp=UserInfo.getUserId();
        	searchList = [SELECT Id,Name,StartDate,Status,Type FROM Campaign WHERE OwnerId =:temp AND IsActive=TRUE ORDER BY StartDate Desc Limit :pageSize offset :offset];
        }
        if(option == 'Inactive Campaigns'){
        	searchList = Database.query('SELECT Id,Name,StartDate,Status,Type FROM Campaign WHERE IsActive = FALSE ORDER BY StartDate Desc Limit '+pageSize+' offset '+offset);
        }
      
    }
    
    public PageReference next(){
    	if (pageNumber == totalPages-1)
            return null;
        pageNumber++;
        
        searchRecords();
        return null;
    }

    public PageReference previous(){
        
        if (pageNumber == 0)
            return null;
        pageNumber--;
        searchRecords();
        return null;
    }
    
     public PageReference firstPage()
     {        
        if (pageNumber == 0)
            return null;
            
        pageNumber = 0;            
        searchRecords();
        return null;
    }
    
    public PageReference lastPage()
    {       
        if (pageNumber == totalPages-1)
            return null;
        
        pageNumber = totalPages-1;
        searchRecords();
        return null;
    }
    
    public PageReference ViewListSelected() {
	 	 pageSize = 10;
         if(option == 'Recently Modified'){
         	pageNumber = 0;
         	totalRecords =[Select COUNT() From Campaign];
            totalPages = totalRecords/pageSize;
            if (Math.mod(totalRecords, pageSize) > 0)
                totalPages++;
            searchList = Database.query('SELECT Id,Name,StartDate,Status,Type FROM Campaign ORDER BY LastActivityDate DESC NULLS FIRST limit '+pageSize);
     }
         else if(option == 'All Campaigns'){
         	pageNumber = 0;
         	totalRecords =[Select COUNT() From Campaign];
            totalPages = totalRecords/pageSize;
            if (Math.mod(totalRecords, pageSize) > 0)
                totalPages++;
            searchList = Database.query('SELECT Id,Name,StartDate,Status,Type FROM Campaign ORDER BY StartDate DESC limit '+pageSize);
     }
     
          else if(option == 'All Active Campaigns'){
          	pageNumber = 0;
         	totalRecords =[Select COUNT() From Campaign WHERE IsActive=TRUE];
            totalPages = totalRecords/pageSize;
            if (Math.mod(totalRecords, pageSize) > 0)
                totalPages++;
            searchList = Database.query('SELECT Id,Name,StartDate,Status,Type FROM Campaign WHERE IsActive=TRUE ORDER BY StartDate Desc limit '+pageSize);
             
     }
     
          else if(option == 'My Active Campaigns'){
          	pageNumber = 0;
         	totalRecords =[Select COUNT() From Campaign WHERE IsActive=TRUE];
            totalPages = totalRecords/pageSize;
            if (Math.mod(totalRecords, pageSize) > 0)
                totalPages++;
                String temp=UserInfo.getUserId();
            searchList = [SELECT Id,Name,StartDate,Status,Type FROM Campaign WHERE OwnerId =:temp AND IsActive=TRUE ORDER BY StartDate Desc Limit : pageSize];      
     }
     
          else if(option == 'Inactive Campaigns'){
          	pageNumber = 0;
         	totalRecords =[Select COUNT() From Campaign WHERE IsActive = FALSE];
            totalPages = totalRecords/pageSize;
            if (Math.mod(totalRecords, pageSize) > 0)
                totalPages++;
            searchList = Database.query('SELECT Id,Name,StartDate,Status,Type FROM Campaign WHERE IsActive = FALSE ORDER BY StartDate Desc Limit '+pageSize);
     }
     return null;
     
    }
}