public with sharing class MultipleRowSelection
{
	public list<wrapperClass> listWrapperClass{get;set;}

	public MultipleRowSelection()
	{
		fetchWrapperList();
	}// End of MultipleRowSelection() constructor
	
	public void fetchWrapperList()
	{
		listWrapperClass = new list<wrapperClass>();
		
		for(Integer i = 1; i <= 10; i++)
		{
			wrapperClass objWrapperClass = new wrapperClass();
			objWrapperClass.str = 'Test' + i;
			//objWrapperClass.num = i;
			listWrapperClass.add(objWrapperClass);
		}
	}// End of fetchWrapperList() method
	
	public class wrapperClass
	{
		public Boolean isSelected{get;set;}
		public String str{get;set;}
		//public Integer num{get;set;}
		
		public wrapperClass()
		{
			isSelected = false;
			str = '';
			//num = 0;
		}// End of constructor method
	}// End of wrapperClass
	
}// End of MultipleRowSelection class