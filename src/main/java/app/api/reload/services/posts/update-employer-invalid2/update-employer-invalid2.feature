@ignore
@updateEmployer-invalid2
Feature:
    Background: 
        
    Scenario Outline: Update employer with an unsupported address type (Home).
       
		* def employerResponse = call read('classpath:app/api/reload/services/posts/update-employer-invalid2/CreateOrUpdateEmployer-invalid2.feature') { employerId: '#(employerId)' ,tradingName: '#(tradingName)',levyClientName: '#(levyClientName)',notValidForClaimRegIndicator: '#(notValidForClaimRegIndicator)',empReimbAgreementInd: '#(empReimbAgreementInd)', businessTypeName: '#(businessTypeName)'}	
		
				
         Examples:
        | employerId | tradingName					   | levyClientName 				 | notValidForClaimRegIndicator | empReimbAgreementInd | businessTypeName	|
        | B5154738E  | Z Norwest Cluster 			   | Jefkar Holdings Ltd 			 | false 						| true				   | Self Employed		|
        | CN135780D  | Z Norwest Cluster 			   | Jefkar Holdings Ltd			 | false						| true				   | Employer			|
