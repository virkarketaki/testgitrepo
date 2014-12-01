<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_Transaction_Status_to_Paid</fullName>
        <field>Status__c</field>
        <literalValue>Completed</literalValue>
        <name>Update Transaction Status to Paid</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Transaction_Status_to_Pending</fullName>
        <field>Status__c</field>
        <literalValue>Pending</literalValue>
        <name>Update Transaction Status to Pending</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Transaction Status to Paid</fullName>
        <actions>
            <name>Update_Transaction_Status_to_Paid</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR( Amount__c  =  Total_Transaction_Credits__c,Amount__c =  Total_Transaction_Debits__c )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Transaction Status to pending</fullName>
        <actions>
            <name>Update_Transaction_Status_to_Pending</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(AND(ISCHANGED( Amount__c ),Amount__c &gt; Total_Transaction_Credits__c), AND(ISCHANGED(Amount__c),Amount__c &gt; Total_Transaction_Debits__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
