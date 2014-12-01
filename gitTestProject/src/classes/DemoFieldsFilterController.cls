public with sharing class DemoFieldsFilterController
{
	public DemoFieldsFilterController()
	{
		DemoFieldExtractor objDemoExtractor = new DemoFieldExtractor();
	//	objDemoExtractor.testData('AccountId');
	//objDemoExtractor.testData('WhoId');
	objDemoExtractor.testData('Description');
	}
}