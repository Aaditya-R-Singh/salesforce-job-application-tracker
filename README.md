# Salesforce Job Application Tracker

A production-quality Salesforce application built with Apex to automate job application tracking.

## What It Does
- Auto-calculates Follow Up Date (Applied Date + 7 days) on every new application
- Auto-creates a Follow Up Task linked to each Job Application record
- Built with Handler Pattern — trigger logic separated from business logic
- 100% test pass rate with proper assertions

## Tech Stack
- Apex Triggers (before insert, after insert)
- Trigger Handler Pattern
- Test Classes with System.assertEquals assertions
- Salesforce CLI for deployment
- VS Code + Salesforce Extension Pack

## Project Structure
force-app/main/default/

├── triggers/

│   └── JobApplicationTrigger.trigger

├── classes/

│   ├── JobApplicationTriggerHandler.cls

│   └── JobApplicationTriggerHandlerTest.cls

└── objects/

└── Job_Application__c/

## Installation
```bash
git clone https://github.com/Aaditya-R-Singh/salesforce-job-application-tracker.git
cd salesforce-job-application-tracker
sf org login web --alias MyOrg
sf project deploy start --source-dir force-app/main/default/classes
sf project deploy start --source-dir force-app/main/default/triggers
```

## Test Results
TEST NAME                                          OUTCOME  RUNTIME

JobApplicationTriggerHandlerTest.testAfterInsert   Pass     596ms

JobApplicationTriggerHandlerTest.testBeforeInsert  Pass     129ms

Pass Rate: 100%

## Author
Aaditya Singh — Salesforce Developer