public class customSettingDemo
{
    public customSettingDemo()
    {
        list<Contact> con = [select Name from Contact limit 5];
        system.debug('+++++++++++++++++++'+con);
        Map<String, ketaki__list__c> countries = ketaki__list__c.getAll();
        system.debug('**********************'+countries);
        Contact c = con[Integer.valueof(countries.get('one').ketaki__srfdg__c)];
        system.debug('>>>>>>>>>>>>>>>>>>>>'+c);
    }
}