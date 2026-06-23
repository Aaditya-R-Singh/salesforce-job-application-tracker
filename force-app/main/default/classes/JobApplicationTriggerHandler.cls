public with sharing class JobApplicationTriggerHandler {
    public static void handleBeforeInsert(List<Job_Application__c> newJobs) {

        for(Job_Application__c job : newJobs){
        if(job.Follow_Up__c == null) {
            job.Follow_Up__c = job.Applied_Date__c + 7;
        }
    }

    }

    public static void handleAfterInsert(List<Job_Application__c> newJobs) {

            List<Task> TaskList = new List<Task>();
            for(Job_Application__c job : newJobs){
            Task t = new Task();
            t.Subject = 'Follow Up with HR';
            t.WhatId = job.Id;
            TaskList.add(t);
        }

        insert TaskList;

    }
}