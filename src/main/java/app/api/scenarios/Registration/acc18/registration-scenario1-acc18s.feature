
@registration-scenario1-acc18s
Feature: submit eletronic ACC45 and ACC18s
Background: 
	* def JavaApp = Java.type('app.App');
	* def creationDate = JavaApp.daysFromNow('-1')

 Scenario Outline: ACC45 for ${RUNID}<seq> with ACC18 <acc18defType>
		* def declarationDate =  JavaApp.daysInPast('<lodgementOffset>','yyyy-MM-dd') +'T00:00:00'
		* def lodgementDate = JavaApp.daysInPast('<lodgementOffset>')
		* def accidentDate = JavaApp.daysInPast('<lodgementOffset>','yyyy-MM-dd')
		* def effectiveDateVal = JavaApp.daysInPast('<lodgementOffset>','dd/MM/yyyy')
		* def dobDate = JavaApp.daysInPast('<dobOffset>','yyyy-MM-dd')
		* def altWorkDate = JavaApp.daysFromNow('7')
		* def incapacityPeriod = '98'
		* def returnToWorkDate = JavaApp.daysFromNow(incapacityPeriod,'yyyy-MM-dd')+'T00:00:00'
		* def fullIncapacityStartDate = JavaApp.daysInPast('<lodgementOffset>','yyyy-MM-dd') +'T00:00:00'		
		* def claimFormNumber = RUNID + '<seq>'
		* def claimantLastName =  JavaApp.replaceDigits(claimFormNumber + lastname)
		* print 'About to register ' +claimFormNumber +' claim'
	#	* def verifyClaimRes = call read('classpath:app/api/reload/services-cc/VerifyClaim.feature'){ medFeesNo:'#(claimFormNumber)' }
	#	Then match verifyClaimRes.errorMessage == 'NoClaimFound:Case not found in database.'
		
		* def ssaRes = call read('classpath:app/api/reload/submit-acc45/submit-single-acc45.feature'){	declarationDate:'#(declarationDate)',				lodgementDate:'#(lodgementDate)', 				accidentDate:'#(accidentDate)', 				dobDate:'#(dobDate)', 				altWorkDate:'#(altWorkDate)', 				incapacityPeriod:'#(incapacityPeriod)', 				returnToWorkDate:'#(returnToWorkDate)', 				fullIncapacityStartDate:'#(fullIncapacityStartDate)', 				claimFormNumber:'#(claimFormNumber)', 				claimantLastName:'#(claimantLastName)', 				claimantFirstName:'<claimantFirstName>', 				defType:'<defType>',				causeOfInjury:'<causeOfInjury>', 				medCode:'<medCode>' 			}
	
		* def fullyUnfitFromDate = JavaApp.daysInPast('<unfitFromOffset>')
		* def fullyUnfitToDate = JavaApp.daysFromNow('<unfitToOffset>')		
		
		* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(claimFormNumber)' }
		
		* def eosCustomerNo  =  overviewResult.eosCustomerNo
		* def eosCaseNo  =  overviewResult.eosCaseNo

		* def ssa18Res = call read('classpath:app/api/reload/submit-acc18/submit-single-acc18.feature'){defType:'<acc18defType>',providerIdentifier:'<providerIdentifier>',	claimantFirstName:'<claimantFirstName>',claimantLastName:'<lastname>',dobDate:'#(dobDate)',fullyUnfitFromDate:'#(fullyUnfitFromDate)',fullyUnfitToDate:'#(fullyUnfitToDate)',acc45ClaimNumber:'#(eosCaseNo)'}
		* print 'Retrieving task information from  ' + claimFormNumber +'/' + eosCaseNo 

		# this api does not return ACC18 tasks, to check 8.8 behaviour
		#* def tassResp = call read('classpath:app/api/reload/api-cc/tasks.feature')	{claimNumber: '#(eosCaseNo)' }		
		#Then match tassResp.allTaskNames contains '<expectedTaskName>'

	Examples:
	    | read('acc45-acc18-data.csv') | 
	
	