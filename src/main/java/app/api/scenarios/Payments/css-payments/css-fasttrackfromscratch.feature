@css-fasttrackfromscratch
Feature:
    
    Scenario Outline: Fasttrack for ${RUNID}<seq>
		* def response = call read('classpath:app/api/scenarios/payments/css-payments/css-fasttrack.feature'){seq:'<seq>',defType:'<defType>',causeOfInjury:'<causeOfInjury>',claimantFirstName:'<claimantFirstName>',lastname:'<lastname>',lodgementOffset:'<lodgementOffset>',dobOffset:'<dobOffset>',medCode:'<medCode>',taxType:'<taxType>',irdNo:'<irdNo>',adjType:'<adjType>',entitlementName:'<entitlementName>',unitVal:'<unitVal>',rateVal:'<rateVal>'}
	
	@css-fasttrackfromscratchFullLoad	
	Examples:
	    | read('css-fast-track-data.csv') | 
	
	@css-fasttrackfromscratchSingleCase
	Examples:
	    | read('css-fast-track-data-singlecase.csv') | 