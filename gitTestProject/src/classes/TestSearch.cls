@isTest
public with sharing class TestSearch 
{
    static testMethod void validateSearchController()
    {
        String name;
    	SearchController searchC = new SearchController();
    	name = searchC.getSearchName();
        searchC.setSearchName(name);
        
        searchC.searchRecords();
         
        
        
    }
}