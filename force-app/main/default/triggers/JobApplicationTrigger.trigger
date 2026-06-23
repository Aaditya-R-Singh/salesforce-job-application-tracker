trigger JobApplicationTrigger on Job_Application__c (before insert, after insert) {
    if(Trigger.isBefore) {
        if(Trigger.isInsert) {
            JobApplicationTriggerHandler.handleBeforeInsert(Trigger.new);
        }
    }

    if(Trigger.isAfter) {
        if(Trigger.isInsert) {
            JobApplicationTriggerHandler.handleAfterInsert(Trigger.new);
        }
    }
}