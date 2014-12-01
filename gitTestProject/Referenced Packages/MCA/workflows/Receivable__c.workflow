<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_Date_Paid</fullName>
        <field>Date_Paid__c</field>
        <formula>TODAY()</formula>
        <name>Update Date Paid</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Receivable_Date_Paid</fullName>
        <field>Date_Paid__c</field>
        <formula>TODAY()</formula>
        <name>Update Receivable Date Paid</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Receivable Update Date Paid</fullName>
        <actions>
            <name>Update_Receivable_Date_Paid</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Receivable__c.Status__c</field>
            <operation>equals</operation>
            <value>Paid</value>
        </criteriaItems>
        <description>Update the Date Paid field of Receivable when Receivable Status = Paid</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Receivable Update Date Paid when Status is Paid</fullName>
        <actions>
            <name>Update_Date_Paid</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Receivable__c.Status__c</field>
            <operation>equals</operation>
            <value>Paid</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
