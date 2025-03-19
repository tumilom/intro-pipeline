@pic-combinedIAfasttrackfromscratch
Feature:
    
    Scenario Outline: Combined IA Fasttrack for ${RUNID}<seq>
		* def response = call read('classpath:app/api/scenarios/payments/pic-payments/pic-combinedIA-fasttrack.feature'){seq:'<seq>',defType:'<defType>',causeOfInjury:'<causeOfInjury>',claimantFirstName:'<claimantFirstName>',lastname:'<lastname>',lodgementOffset:'<lodgementOffset>',dobOffset:'<dobOffset>',medCode:'<medCode>',taxType:'<taxType>',irdNo:'<irdNo>',picAccidentDateTime:'<picAccidentDateTime>',picAccidentDateNoTime:'<picAccidentDateNoTime>',incurredDate:'<incurredDate>',lumpSum:'<lumpSum>',flpPaid:'<flpPaid>',lumpsumWpiScore:'<lumpsumWpiScore>',paidDate:'<paidDate>',applicationDate:'<applicationDate>',wpiScore:'<wpiScore>'	}				
	

	@pic-combinedIA-fasttrackfromscratchFullLoad	
	Examples:
	    | read('pic-combinedIA-fast-track-data.csv') | 
	
	@pic-combinedIA-fasttrackfromscratchSingleCase
	Examples:
	    | read('pic-combinedIA-fast-track-data-singlecase.csv') | 