
@registration-scenario2-sensitive-noACC45
Feature: submit eletronic ACC45 and a sensitive engagement form
Background: 
	* def JavaApp = Java.type('app.App');
	* def creationDate = JavaApp.daysFromNow('-1')

 Scenario Outline: ACC45 for ${RUNID}<seq> with Engagement Form 
		
		* def lodgementDate = JavaApp.daysInPast('<lodgementOffset>')		
		* def dobDate = JavaApp.daysInPast('<dobOffset>','yyyy-MM-dd')	
		* def claimFormNumber = RUNID + '<seq>'
		* def claimantLastName =  JavaApp.replaceDigits(claimFormNumber + lastname)	
		
		* def eventDateFrom = JavaApp.daysInPast('<unfitFromOffset>','yyyy-MM-dd')
		* def eventDateTo = JavaApp.daysFromNow('<unfitToOffset>','yyyy-MM-dd')	
		* def consultationDate =  JavaApp.daysInPast('<lodgementOffset>','yyyy-MM-dd')
		* def secondConsultationDate = JavaApp.daysFromNow('1','yyyy-MM-dd')		
		
		* def eosCaseNo  =  ''
		* print 'About to submit Sensitive Egagement Form'

		* def ssaSensitiveRes = call read('classpath:app/api/reload/submit-sensitive/submit-single-sensitive.feature'){	lodgementDate:'#(lodgementDate)',providerIdentifier:'<providerIdentifier>',				claimantFirstName:'<claimantFirstName>',			claimantLastName:'<lastname>',			dobDate:'#(dobDate)',			eventDateFrom:'#(eventDateFrom)',			eventDateTo:'#(eventDateTo)',	acc45ClaimNumber:'#(eosCaseNo)',	consultationDate:'#(consultationDate)',	SecondConsultationDate:'#(secondConsultationDate)'		}

	Examples:
	    | read('acc45-sensitive-data.csv') | 
	
	