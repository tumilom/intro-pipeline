@ignore
@updateEmployer-invalid1
Feature:
    Background: 
        
    Scenario Outline: Update employer with 4 different address types. Only 3 address types are allowed by the system.
       
		* def employerResponse = call read('classpath:app/api/reload/services/posts/update-employer-invalid1/CreateOrUpdateEmployer-invalid1.feature') { employerId: '#(employerId)' ,tradingName: '#(tradingName)',levyClientName: '#(levyClientName)',notValidForClaimRegIndicator: '#(notValidForClaimRegIndicator)',empReimbAgreementInd: '#(empReimbAgreementInd)', businessTypeName: '#(businessTypeName)'}	
		
				
         Examples:
        | employerId | tradingName					   | levyClientName 				 | notValidForClaimRegIndicator | empReimbAgreementInd | businessTypeName	|
        | B5154738E  | Z Norwest Cluster 			   | Jefkar Holdings Ltd 			 | false 						| true				   | Self Employed		|
        | CN135780D  | Z Norwest Cluster 			   | Jefkar Holdings Ltd			 | false						| true				   | Employer			|
