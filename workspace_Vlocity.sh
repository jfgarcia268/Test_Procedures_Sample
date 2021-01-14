#!/usr/bin/env bash
/////////////////////////////////////////////////// Setup - Apex Code ////////////////////////////////////////////////////////////////////////////


List<String> trackingServices = new List<String>{ 
	'Track.IntProc'
};

for (String service : trackingServices){
	vlocity_cmt__TriggerSetup__c cs = new vlocity_cmt__TriggerSetup__c (Name = service,vlocity_cmt__IsTriggerOn__c=true);
	upsert cs Name;
}

// OmniAnalytics

List<String> loggingServices = new List<String>{ 
	'OmniAnalyticsTrackingDebug'
};

for (String service : loggingServices){
    vlocity_cmt__GeneralSettings__c cs = new vlocity_cmt__GeneralSettings__c (Name = service,vlocity_cmt__Value__c='true');
	upsert cs Name;
}

/////////////////////////////////////////////////// GET ALL TESTS ////////////////////////////////////////////////////////////////////////////////

vlocity getTestProcedures --nojob -sfdx.username CMT_Test_109_dev1 

vlocity getTestProcedures --nojob -sfdx.username CMT_Test_109_dev1 --json

/////////////////////////////////////////////////// RUN ALL TESTS ///////////////////////////////////////////////////////////////////////////////


vlocity runAllTestProcedures --nojob -sfdx.username CMT_Test_109_dev1 

vlocity runAllTestProcedures --nojob -sfdx.username CMT_Test_109_dev1 --json

/////////////////////////////////////////////////// RUN  TESTS //////////////////////////////////////////////////////////////////////////////////


vlocity runTestProcedure -job Test_Suite1.yaml -sfdx.username CMT_Test_109_dev1
vlocity runTestProcedure -job Test_Suite2.yaml -sfdx.username CMT_Test_109_dev1 


vlocity runTestProcedure -job Test_Suite1.yaml -sfdx.username CMT_Test_109_dev1 --json 
vlocity runTestProcedure -job Test_Suite2.yaml -sfdx.username CMT_Test_109_dev1 --json 


vlocity runTestProcedure --nojob -sfdx.username CMT_Test_109_dev1 -testKeys Test_team_saveContactDetails
vlocity runTestProcedure --nojob -sfdx.username CMT_Test_109_dev1 -testKeys Test_team_saveContactDetails -testKeys Test_team_saveAccountDetails -testKeys Test_team_fail_saveAccountDetails


vlocity runTestProcedure --nojob -sfdx.username CMT_Test_109_dev1 -testKeys Test_team_saveContactDetails --json
vlocity runTestProcedure --nojob -sfdx.username CMT_Test_109_dev1 -testKeys Test_team_saveContactDetails -testKeys Test_team_saveAccountDetails -testKeys Test_team_fail_saveAccountDetails --json