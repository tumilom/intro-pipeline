@providerUnconsolidation
Feature: Setup party Unmerge
    Background: to be run after @providerUnconsolidation
        * def JavaApp = Java.type('app.App');
		* def dateNow = JavaApp.daysFromNow('0') 
    Scenario Outline: Update <providerId> info
        
		* def response = call read('classpath:app/api/reload/services-cc/posts/UpdateOrCreateProviderv1.feature'){providerId:'#(providerId)',extLocationInstanceName:'#(extLocationInstanceName)',extClassDesc:'#(extClassDesc)',extRegisteredForServices:'#(extRegisteredForServices)',extStatus:'#(extStatus)',extStatusReason:'#(extStatusReason)'}				

        Examples:
        | providerId | extLocationInstanceName | extClassDesc 			| extClassCode | extRegisteredForServices 	|extStatus	|extStatusReason |
		| A10116 	| Auckland City 			| General Practitioner | 14 			| false 					|Inactive	|Confirm Provider Details|