@addExternalDocs
Feature:
    @addClaimExternalDocs
    Scenario Outline: Add external <dmsDocType> doc to ${RUNID}<seq>
	
		* def claimFormNumber = RUNID + '<seq>'
		* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(claimFormNumber)' }
		* def eosCaseNo  =  overviewResult.eosCaseNo
	    * call read('classpath:app/api/reload/documents/external-document.feature@createExternalDoc') { keyId: '#(eosCaseNo)', systemUser: <systemUser>, dmsDocType: <dmsDocType>, additionalMetadata: <additionalMetadata>, expectedStatus: <expectedStatus> }

        Examples:
        | seq| systemUser | dmsDocType		   | additionalMetadata 													| expectedStatus |
        | 04 | _OASIS	 | WGTRANSCRIPT 	   | _Daryl C_Coordinated_Compensation - Eligibility 									| 200 |
		| 04 |			 | WCTRANSCRIPT 	   | 																					| 200 |
		| 04 |			 | CONFVOCCONTSCRIPT   |  																					| 200 |
		| 04 |			 | PROVIDERTRANS 		| 																					| 200 |
		| 04 |			 | WCPAYMENTADVICE		| 																					| 200 |
		| 04 | _ISUSER   | CREMAIL 		  		| _Email_101007_TravelBBzz 															| 200 |
		| 04 | _ISUSER   | CRLETTER		  		| _Letter_101007_TravelBB															| 200 |
	
    @addClaimExternalDocsMatchingClaimantDetails
    Scenario Outline: Add external <dmsDocType> doc to ${RUNID}<seq> 
	
		* def claimFormNumber = RUNID + '<seq>'
		* def reslt = call read('classpath:app/api/reload/services-cc/VerifyClaim.feature') { medFeesNo: '#(claimFormNumber)' }
		* def eosCaseNo  =  reslt.eosCaseNo
		* def replaceAll = function(jsString, key1, value1) { return  jsString.replaceAll(key1,value1) }
		* def dob = replaceAll(reslt.eosCustomerDOB ,'/','-')
		* def addMeta = '<additionalMetadata>' + reslt.eosCustomerFirstName+'_' + reslt.eosCustomerLastName +'_' + dob

	    * call read('classpath:app/api/reload/documents/external-document.feature@createExternalDoc') { keyId: '#(eosCaseNo)', systemUser: <systemUser>, dmsDocType: <dmsDocType>, additionalMetadata: '#(addMeta)', expectedStatus: <expectedStatus> }

        Examples:
        | seq| systemUser | dmsDocType		   | additionalMetadata 						 	 | expectedStatus |
        | 04 |			 | MMEXESHTI		   | _BBPROVIDER&NAMETJR_17 Nov 2014__TEST10_INFO5_DCB1979_  	| 200 |
		| 04 |			 | MMEXSPECR 		   | _TESTPROVIDER&NAMETJR_17 Nov 2014__TEST10_INFO5_TAC3367_ 	| 200 |
		| 04 | 			 | MMEXDISOP 		   | _AnaghaKawley_25-10-2023_____ 								| 200 |
		| 04 |			 | ICPIRP			   | _ProviderX_____HWU9730_									| 200 |
		| 04 |			 | ICPTRIAGEASSESS 	   | _ProviderX_____HWU9731_ 									| 200 |
		| 04 |			 | ICPMSKSURGERYREQ    | _ProviderX_____HWU9730_ 									| 200 |
		

	@addCustomerExternalDocs
    Scenario Outline: Add external <dmsDocType> doc to ${RUNID}<seq> claimant
	
		* def claimFormNumber = RUNID + '<seq>'
		* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(claimFormNumber)' }
		* def eosCustomerNo  =  overviewResult.eosCustomerNo
	    * call read('classpath:app/api/reload/documents/external-document.feature@createExternalDoc') { keyId: '#(eosCustomerNo)', systemUser: <systemUser>, dmsDocType: <dmsDocType>, additionalMetadata: <additionalMetadata>, expectedStatus: <expectedStatus> }

        Examples:
        | seq| systemUser | dmsDocType		   | additionalMetadata 													| expectedStatus |
        | 04 | _ISUSER   | IPEMAIL				| _FallsPrevention-QA_IP_FallsMVP_CC550_eDM_variant_1a_self 						| 200 |
		| 04 | _isuser   | IPLETTER 			| _FISexample_Clinical_TestTopic 													| 200 |
		
		
	@addEmployerExternalDocs
    Scenario Outline: Add external <dmsDocType> doc to B5154738E
	
		* call read('classpath:app/api/reload/documents/external-document.feature@createExternalDoc') { keyId: 'B5154738E', systemUser: <systemUser>, dmsDocType: <dmsDocType>, additionalMetadata: <additionalMetadata>, expectedStatus: <expectedStatus> }

        Examples:
        | seq| systemUser | dmsDocType		   | additionalMetadata 													| expectedStatus |
        | 04 |			 | ACCEPTANCE 			|  																					| 500 |
		| 04 |			 | ERAEMPLOYERADVICE 	| _B5154738E 																		| 200 |
		



