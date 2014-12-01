<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_Record_Type</fullName>
        <description>Update Account Record Type on conversion</description>
        <field>RecordTypeId</field>
        <lookupValue>Merchant</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Update Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Account%3ESet Converted Account Record Type</fullName>
        <actions>
            <name>Update_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.ConvertedAccount__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>When Lead is converted, set stage of created Account to &apos;Merchant&apos;</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
