@acc18submit
Feature:
    Background: 
        * def configParam = 'UploadXmlDocument'
		* def xmlStart = read('acc18-envelope-prefix.txt') + '<![CDATA['
		* def xmlStop = ']]>' + read('acc18-envelope-suffix.txt') 
		* def JavaApp = Java.type('app.App');
		* def dateNow = JavaApp.daysFromNow('0')
		* def declarationDate =  JavaApp.daysFromNow('-4')
		
    Scenario Outline: Submit ACC18 for ${RUNID}<seq> <defType>
		
		* def fullyUnfitFromDate = JavaApp.daysInPast('<unfitFromOffset>')
		* def fullyUnfitToDate = JavaApp.daysFromNow('<unfitToOffset>')
		* def dobDate = JavaApp.daysInPast('<dobOffset>')
		* def acc45ClaimNumber = RUNID + '<seq>'
		* print 'About to register med cert for ' + acc45ClaimNumber +' claim'
		
		* def verifyClaimRes = call read('classpath:app/api/reload/services-cc/VerifyClaim.feature'){ medFeesNo:'#(acc45ClaimNumber)' }
		Then match verifyClaimRes.claimExists == 'true'
		* def ssaRes = call read('classpath:app/api/reload/submit-acc18/submit-single-acc18.feature'){	declarationDate:'#(declarationDate)',	providerIdentifier:'<providerIdentifier>', fullyUnfitFromDate:'#(fullyUnfitFromDate)',	fullyUnfitToDate:'#(fullyUnfitToDate)',		dobDate:'#(dobDate)', 		 				acc45ClaimNumber:'#(acc45ClaimNumber)', 				claimantLastName:'#(verifyClaimRes.eosCustomerLastName)', 				claimantFirstName:'#(verifyClaimRes.eosCustomerFirstName)', 				defType:'<defType>'					}
		
        Examples:
			| read('acc18-data.csv') | 

       