@updateEmployer
Feature:
    Background: 
        
    Scenario Outline: Update employer <employerId> information
       
		* def employerResponse = call read('classpath:app/api/reload/services/posts/CreateOrUpdateEmployer.feature') { employerId: '#(employerId)' ,tradingName: '#(tradingName)',levyClientName: '#(levyClientName)',notValidForClaimRegIndicator: '#(notValidForClaimRegIndicator)',empReimbAgreementInd: '#(empReimbAgreementInd)', businessTypeName: '#(businessTypeName)'}	
		
		* def classificationResponse = call read('classpath:app/api/reload/services/posts/UpdateEmployerClassification.feature') { employerId: '#(employerId)'}	
		
				
         Examples:
        | employerId | tradingName					   | levyClientName 				 | notValidForClaimRegIndicator | empReimbAgreementInd | businessTypeName	| accreditedEmpInd	|
		| Y4846582E  | ACC CC (Claimants Compensation) | ACC CC (Claimants Compensation) | true 					 	| false 			   | Employer			| N					|
        | B5154738E  | Z Norwest Cluster 1			   | Jefkar Holdings 1 Ltd 			 | false 						| true				   | Self Employed		| N					|
        | CN135780D  | Z Norwest Cluster 2			   | Jefkar Holdings 2 Ltd			 | false						| true				   | Employer			| N					|
		| R3715941E  | Z Norwest Cluster 3			   | Jefkar Holdings 3 Ltd 			 | false 						| true 				   | Employer			| Y					|
        | U1323116E  | Z Norwest Cluster 4  		   | Jefkar Holdings 4 Ltd			 | false 						| false				   | Self Employed		| N					|
        | Y6863521E  | Z Norwest Cluster 5			   | Jefkar Holdings 5 Ltd			 | false 						| false				   | Employer			| N					|
		| Y6863521A  | Z Norwest Cluster 6			   | Jefkar Holdings 6 Ltd			 | false 						| false				   | Employer			| N					|
		| Y6863521B  | Z Norwest Cluster 7			   | Jefkar Holdings 7 Ltd			 | false 						| false				   | Employer			| N					|
		| Y6863521C  | Z Norwest Cluster 8			   | Jefkar Holdings 8 Ltd			 | false 						| false				   | Employer			| N					|
		| Y6863521D  | Z Norwest Cluster 9			   | Jefkar Holdings 9 Ltd			 | false 						| false				   | Employer			| N					|
		| Y6863521F  | Z Norwest Cluster 10			   | Jefkar Holdings 10 Ltd			 | false 						| false				   | Employer			| N					|
