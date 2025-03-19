@fatal-fasttrackfromscratch
Feature:
    
    Scenario Outline: Fasttrack for ${RUNID}<seq>

		* def response = call read('classpath:app/api/scenarios/payments/fatal-payments/fatal-fasttrack.feature'){seq:'<seq>',defType:'<defType>',causeOfInjury:'<causeOfInjury>',claimantFirstName:'<claimantFirstName>',lastname:'<lastname>',lodgementOffset:'<lodgementOffset>',dobOffset:'<dobOffset>',medCode:'<medCode>',taxType:'<taxType>',irdNo:'<irdNo>',firstNames:'<firstNames>',dateOfBirthOffSet:'<dateOfBirthOffSet>',irdNumberVal0:'<irdNumberVal0>',irdNumberVal1:'<irdNumberVal1>',irdNumberVal2:'<irdNumberVal2>',genderVal:'<genderVal>',ethnicityVal:'<ethnicityVal>',addressLine1Val:'<addressLine1Val>',suburbVal:'<suburbVal>',cityVal:'<cityVal>',postCodeVal:'<postCodeVal>',firstNames1:'<firstNames1>',lastName1:'<lastName1>',dateOfBirthOffSet1:'<dateOfBirthOffSet1>',irdNumberVal01:'<irdNumberVal01>',irdNumberVal11:'<irdNumberVal11>',irdNumberVal21:'<irdNumberVal21>',genderVal1:'<genderVal1>',ethnicityVal1:'<ethnicityVal1>',addressLine1Val1:'<addressLine1Val1>',suburbVal1:'<suburbVal1>',cityVal1:'<cityVal1>',postCodeVal1:'<postCodeVal1>',employerNumber:'<employerNumber>',employmentType:'<employmentType>',earnings01Type:'<earnings01Type>',earnings01Amount:'<earnings01Amount>',earnings02Type:'<earnings02Type>',earnings02Amount:'<earnings02Amount>'}				
	
	@fatal-fasttrackfromscratchFullLoad	
	Examples:
	    | read('fatal-fast-track-data.csv') | 
	
	@fatal-fasttrackfromscratchSingleCase
	Examples:
	    | read('fatal-fast-track-data-singlecase.csv') | 