@ignore
@updateEmployerClassification
Feature:
    Background: 
        
    Scenario Outline: Update employer <employerId> information
       		
		* def classificationResponse = call read('classpath:app/api/reload/services/posts/update-employer-classification/UpdateEmployerClassification-multi.feature') { employerId: '#(employerId)'}	
				
         Examples:
        | employerId | tradingName					   | levyClientName 				 | notValidForClaimRegIndicator | empReimbAgreementInd | businessTypeName	|
        | U1323116E  | Z Norwest Cluster			   | Jefkar Holdings Ltd			 | false 						| false				   | Self Employed		|
 