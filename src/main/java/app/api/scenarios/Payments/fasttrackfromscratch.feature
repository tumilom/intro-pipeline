@fasttrackfromscratch
Feature:
    
    Scenario Outline: Fasttrack for ${RUNID}<seq>		   
		* def response = call read('classpath:app/api/scenarios/payments/fasttrack.feature'){seq:'<seq>',defType:'<defType>',causeOfInjury:'<causeOfInjury>',claimantFirstName:'<claimantFirstName>',lastname:'<lastname>',lodgementOffset:'<lodgementOffset>',dobOffset:'<dobOffset>',medCode:'<medCode>',taxType:'<taxType>',irdNo:'<irdNo>',employerNumber:'<employerNumber>',employmentType:'<employmentType>',earnings01Type:'<earnings01Type>',earnings01Amount:'<earnings01Amount>',earnings02Type:'<earnings02Type>',earnings02Amount:'<earnings02Amount>'}				
	
	@fasttrackfromscratchFullLoad	
	Examples:
	    | read('fast-track-data.csv') | 
	
	@fasttrackfromscratchSingleCase
	Examples:
	    | read('fast-track-data-singlecase.csv') | 