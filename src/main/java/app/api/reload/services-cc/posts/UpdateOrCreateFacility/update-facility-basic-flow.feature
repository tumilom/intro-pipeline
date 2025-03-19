@ignore
@updateFacility-basic-flow
Feature:
     Background: 
        * def JavaApp = Java.type('app.App');
		* def dateNow = JavaApp.daysFromNow('0') 
    Scenario Outline: Update <facilityId> info
        
		* def response = call read('classpath:app/api/reload/services-cc/posts/UpdateOrCreateFacility/UpdateOrCreateFacility-basic-flow.feature'){facilityId:'#(facilityId)',facilityName:'#(facilityName)', extStatus:'#(extStatus)',extStatusReason:'#(extStatusReason)'}				
        Examples:
        | facilityId     |facilityName					|extStatus	|extStatusReason |
        | TRFA11		 |Tim Fac Test Svn Mock Search11|Confirmed	|Out of Business |
