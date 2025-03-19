@ignore
@updateProvider-basic-flow
Feature: Setup Providers 
    Background: 
        * def JavaApp = Java.type('app.App');
		* def dateNow = JavaApp.daysFromNow('0') 
    Scenario Outline: Update <providerId> info
        
		* def response = call read('classpath:app/api/reload/services-cc/posts/UpdateOrCreateProvider/UpdateOrCreateProvider-basic-flow.feature'){providerId:'#(providerId)',extLocationInstanceName:'#(extLocationInstanceName)',extClassDesc:'#(extClassDesc)',extRegisteredForServices:'#(extRegisteredForServices)',extStatus:'#(extStatus)',extStatusReason:'#(extStatusReason)'}				

        Examples:
        | providerId | extLocationInstanceName | extClassDesc 			| extClassCode 	| extRegisteredForServices 	|extStatus	|extStatusReason 				|
        | A10004 	 | Wellington City		   | Paediatrician		 	| 38 			| true 						|Held		|No Current Annual Practice Cert|

       
