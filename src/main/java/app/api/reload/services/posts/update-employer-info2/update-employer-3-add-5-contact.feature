@ignore
@updateEmployer-3-add-5-contact
Feature:
    Background: 
        
    Scenario Outline: Update employer <employerId> information
       
		* def employerResponse = call read('classpath:app/api/reload/services/posts/update-employer-info2/CreateOrUpdateEmployer-3-add-5-contact.feature') { employerId: '#(employerId)' ,tradingName: '#(tradingName)',levyClientName: '#(levyClientName)',notValidForClaimRegIndicator: '#(notValidForClaimRegIndicator)',empReimbAgreementInd: '#(empReimbAgreementInd)', businessTypeName: '#(businessTypeName)'}	
		
				
         Examples:
        | employerId | tradingName					   | levyClientName 				 | notValidForClaimRegIndicator | empReimbAgreementInd | businessTypeName	|
        | U1323116E  | Z Norwest Cluster			   | Jefkar Holdings Ltd			 | false 						| false				   | Self Employed		|
 