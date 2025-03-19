@era-fasttrackfromscratch
Feature:
    
    Scenario Outline: Fasttrack for ${RUNID}<seq> 
		* def response = call read('classpath:app/api/scenarios/payments/ERA-payments/era-fasttrack.feature'){seq:'<seq>',defType:'<defType>',causeOfInjury:'<causeOfInjury>',claimantFirstName:'<claimantFirstName>',lastname:'<lastname>',lodgementOffset:'<lodgementOffset>',dobOffset:'<dobOffset>',medCode:'<medCode>',taxType:'<taxType>',irdNo:'<irdNo>',employerNumber:'<employerNumber>',employmentType:'<employmentType>',eraPaymentOption:'<eraPaymentOption>',earnings01Type:'<earnings01Type>',earnings01Amount:'<earnings01Amount>',earnings02Type:'<earnings02Type>',earnings02Amount:'<earnings02Amount>'}				

	@era-fasttrackfromscratchFullLoad	
	Examples:
	    | read('era-fast-track-data.csv') | 
	
	@era-fasttrackfromscratchSingleCase
	Examples:
	    | read('era-fast-track-data-singlecase.csv') | 