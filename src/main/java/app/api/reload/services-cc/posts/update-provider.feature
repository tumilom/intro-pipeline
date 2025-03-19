@updateProvider
Feature: Setup Providers 
   
    Scenario Outline: Update <providerId> info
        
		* def response = call read('classpath:app/api/reload/services-cc/posts/UpdateOrCreateProviderv1.feature'){providerId:'#(providerId)',extLocationInstanceName:'#(extLocationInstanceName)',extClassDesc:'#(extClassDesc)',extRegisteredForServices:'#(extRegisteredForServices)',extStatus:'#(extStatus)',extStatusReason:'#(extStatusReason)'}				

	Examples:
	    | read('update-provider-data.csv') | 
    

       
