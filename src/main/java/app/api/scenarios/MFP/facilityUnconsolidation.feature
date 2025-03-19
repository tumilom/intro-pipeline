@facilityUnconsolidation
Feature: Setup facilites for party merge
    Background: unmerge facilites
        * def JavaApp = Java.type('app.App');
		* def dateNow = JavaApp.daysFromNow('0') 
    Scenario Outline: Update <facilityId> info
     
	 
       * def response = call read('classpath:app/api/reload/services-cc/posts/UpdateOrCreateFacility.feature'){facilityId:'#(facilityId)',facilityName:'#(facilityName)', extStatus:'#(extStatus)',extStatusReason:'#(extStatusReason)'}				
     
	 Examples:
        | facilityId     |facilityName			|extStatus	|extStatusReason |		
		| ODIV35		 |Jessica Long	ODIV35	|Inactive	|Confirm Facility Details|
		

