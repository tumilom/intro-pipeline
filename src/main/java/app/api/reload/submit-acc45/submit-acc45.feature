@acc45submit
Feature:
    Background: 
        * def configParam = 'UploadXmlDocument'
		* def xmlStart = read('acc45-envelope-prefix.txt') + '<![CDATA['
		* def xmlStop = ']]>' + read('acc45-envelope-suffix.txt') 
		* def JavaApp = Java.type('app.App');
		* def creationDate = JavaApp.daysFromNow('-1')
		
    
    Scenario Outline: Submit ACC45 <defType> for ${RUNID}<seq>
		* def declarationDate =  JavaApp.daysInPast('<lodgementOffset>','yyyy-MM-dd') +'T00:00:00'
		* def lodgementDate = JavaApp.daysInPast('<lodgementOffset>')
		* def accidentDate = JavaApp.daysInPast('<lodgementOffset>','yyyy-MM-dd')
		* def dobDate = JavaApp.daysInPast('<dobOffset>','yyyy-MM-dd')
		* def altWorkDate = JavaApp.daysFromNow('7')
		* def incapacityPeriod = '180'
		* def returnToWorkDate = JavaApp.daysFromNow(incapacityPeriod,'yyyy-MM-dd')+'T00:00:00'
		* def fullIncapacityStartDate = JavaApp.daysInPast('<lodgementOffset>','yyyy-MM-dd') +'T00:00:00'		
		* def claimFormNumber = RUNID + '<seq>'
		* def claimantLastName =  JavaApp.replaceDigits(claimFormNumber + lastname)
		* print 'About to register ' +claimFormNumber +' claim'
		* def verifyClaimRes = call read('classpath:app/api/reload/services-cc/VerifyClaim.feature'){ medFeesNo:'#(claimFormNumber)' }
		Then match verifyClaimRes.errorMessage == 'NoClaimFound:Case not found in database.'
		* def ssaRes = call read('classpath:app/api/reload/submit-acc45/submit-single-acc45.feature'){	declarationDate:'#(declarationDate)',				lodgementDate:'#(lodgementDate)', 				accidentDate:'#(accidentDate)', 				dobDate:'#(dobDate)', 				altWorkDate:'#(altWorkDate)', 				incapacityPeriod:'#(incapacityPeriod)', 				returnToWorkDate:'#(returnToWorkDate)', 				fullIncapacityStartDate:'#(fullIncapacityStartDate)', 				claimFormNumber:'#(claimFormNumber)', 				claimantLastName:'#(claimantLastName)', 				claimantFirstName:'<claimantFirstName>', 				defType:'<defType>',				causeOfInjury:'<causeOfInjury>', 				medCode:'<medCode>' 			}
		
	Examples:
	    | read('acc45-data.csv') | 