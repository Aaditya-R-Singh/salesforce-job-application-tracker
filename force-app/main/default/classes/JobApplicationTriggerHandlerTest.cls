@isTest
public class JobApplicationTriggerHandlerTest {

    @isTest
    static void testBeforeInsert() {
        //ARRANGE
        Job_Application__c job = new Job_Application__c();
        job.Name = 'Test Application';
        job.Company_Name__c = 'Google';
        job.Role__c = 'Salesforce Developer';
        job.Status__c = 'Applied';
        job.Applied_Date__c = Date.today();

        //ACT
        Test.startTest();
        insert job;
        Test.stopTest();

        //ASSERT
        Job_Application__c result = [
            SELECT Applied_Date__c, Follow_Up__c
            FROM Job_Application__c
            WHERE Id = :job.Id
        ]; 

        System.assertEquals(
            Date.today() + 7,
            result.Follow_Up__c,
            'Follow Up should be Applied Date plus 7 days'
        );
    }

    @isTest
    static void testAfterInsert() {
        //ARRANGE
        Job_Application__c job = new Job_Application__c();
        job.Name = 'Test Application 2';
        job.Company_Name__c = 'Microsoft';
        job.Role__c = 'Developer';
        job.Status__c = 'Applied';
        job.Applied_Date__c = Date.today();
        //ACT
        Test.startTest();
        insert job;
        Test.stopTest();
        //ASSERT
        List<Task> tasks = [
            SELECT Subject, WhatId
            FROM Task
            WHERE WhatId = :job.Id
        ];
        System.assertEquals(1, tasks.size(), 'One task should be created');
        System.assertEquals('Follow Up with HR', tasks[0].Subject, 'Subject should match');
    }

}