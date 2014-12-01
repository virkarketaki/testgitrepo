public with sharing class GridDemoController
{
	public GridDemoController(ApexPages.StandardController Controller) 
	{
		
	}
	
	public list<String> getNumbers()
	{
		return new list<String>{'1','2','3','4','5','6','7','8','9'};
	}
}