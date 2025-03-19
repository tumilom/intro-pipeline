
@registration-scenario1-sensitive
Feature: submit eletronic ACC45 and a sensitive engagement form
Background: 
	* def JavaApp = Java.type('app.App');
	* def creationDate = JavaApp.daysFromNow('-1')

 Scenario Outline: ACC45 for ${RUNID}<seq> with Engagement Form 
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
		
		* def ssaRes = call read('classpath:app/api/reload/submit-acc45/submit-single-acc45.feature'){	declarationDate:'#(declarationDate)',	lodgementDate:'#(lodgementDate)', 					accidentDate:'#(accidentDate)', 				dobDate:'#(dobDate)', 				altWorkDate:'#(altWorkDate)', 					incapacityPeriod:'#(incapacityPeriod)', 				returnToWorkDate:'#(returnToWorkDate)', 				fullIncapacityStartDate:'#(fullIncapacityStartDate)', 				claimFormNumber:'#(claimFormNumber)', 				claimantLastName:'#(claimantLastName)', 				claimantFirstName:'<claimantFirstName>', 				defType:'<defType>',					causeOfInjury:'<causeOfInjury>', 				medCode:'<medCode>' }	
		* def eventDateFrom = JavaApp.daysInPast('<unfitFromOffset>','yyyy-MM-dd')
		* def eventDateTo = JavaApp.daysFromNow('<unfitToOffset>','yyyy-MM-dd')	
		* def consultationDate =  JavaApp.daysInPast('<lodgementOffset>','yyyy-MM-dd')
		* def secondConsultationDate = JavaApp.daysFromNow('1','yyyy-MM-dd')
		
		* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(claimFormNumber)' }
		
		* def eosCustomerNo  =  overviewResult.eosCustomerNo
		* def eosCaseNo  =  overviewResult.eosCaseNo

		* def ssaSensitiveRes = call read('classpath:app/api/reload/submit-sensitive/submit-single-sensitive.feature'){	lodgementDate:'#(lodgementDate)',providerIdentifier:'<providerIdentifier>',				claimantFirstName:'<claimantFirstName>',			claimantLastName:'<lastname>',			dobDate:'#(dobDate)',			eventDateFrom:'#(eventDateFrom)',			eventDateTo:'#(eventDateTo)',	acc45ClaimNumber:'#(eosCaseNo)',	consultationDate:'#(consultationDate)',	SecondConsultationDate:'#(secondConsultationDate)'		}

			

	Examples:
	    | read('acc45-sensitive-data.csv') | 
	
	