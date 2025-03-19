@ignore
@updateEmployer-add-work
Feature:
    Background: 
        
    Scenario Outline: Update employer <employerId> information
       
		* def employerResponse = call read('classpath:app/api/reload/services/posts/update-employer-info1/CreateOrUpdateEmployer-add-work.feature') { employerId: '#(employerId)' ,tradingName: '#(tradingName)',levyClientName: '#(levyClientName)',notValidForClaimRegIndicator: '#(notValidForClaimRegIndicator)',empReimbAgreementInd: '#(empReimbAgreementInd)', businessTypeName: '#(businessTypeName)'}	
		
				
         Examples:
        | employerId | tradingName					   | levyClientName 				 | notValidForClaimRegIndicator | empReimbAgreementInd | businessTypeName		|
        | B5154738E  | Z Norwest Cluster 			   | Jefkar Holdings Ltd 			 | false 						| true				   | Self Employed			|
        | CN135780D  | Z Norwest Cluster 			   | Jefkar Holdings Ltd			 | false						| true				   | Employer				|
        | U1323116E  | Z Norwest Cluster			   | Jefkar Holdings Ltd			 | false 						| false				   | Self Employed			|
        | Y6863521E  | Z Norwest Cluster			   | Jeremy Holdings Ltd			 | false 						| true				   | Shareholder Employee	|
