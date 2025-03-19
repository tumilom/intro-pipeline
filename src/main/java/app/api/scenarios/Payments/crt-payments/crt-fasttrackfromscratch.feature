@crt-fasttrackfromscratch
Feature:
    Background: 
        * def JavaApp = Java.type('app.App');
		* def creationDate = JavaApp.daysFromNow('-1')
    
    Scenario Outline: Fasttrack for ${RUNID}<seq>
		* def declarationDate =  JavaApp.daysInPast('<lodgementOffset>','yyyy-MM-dd') +'T00:00:00'
		* def lodgementDate = JavaApp.daysInPast('<lodgementOffset>')
		* def accidentDate = JavaApp.daysInPast('<lodgementOffset>','yyyy-MM-dd')
		* def effectiveDateVal = JavaApp.daysInPast('<lodgementOffset>','dd/MM/yyyy')
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
		
		
		* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(claimFormNumber)' }
		* def eosCustomerNo  =  overviewResult.eosCustomerNo
		* def acc45CaseNo  =  overviewResult.eosCaseNo		
		
		* def isRegistered = call read('classpath:app/api/reload/api-customer/isRegistered.feature') { customerNo: '#(eosCustomerNo)' }
	
		* def paymentPreference = call read('classpath:app/api/reload/api-customer/posts/add-payment-preferences.feature') { customerNo: '#(eosCustomerNo)' } 
    
	
		* def eosSubCaseCaseTypeName = 'Client Reimbursement'									
		* def addSubCaseResponse = call read('classpath:app/api/reload/services-css/posts/SubCase.feature') { parentCaseNumber: '#(acc45CaseNo)' , subCaseCaseTypeName: '#(eosSubCaseCaseTypeName)' } 
		* def getCaseResponse = call read('classpath:app/api/reload/api-customer/benefits.feature') { eosCaseNo: '#(acc45CaseNo)' , customerNo: '#(eosCustomerNo)' } 
		
		* def eoscrCaseNumber = getCaseResponse.crCaseNo[0]
		* print eoscrCaseNumber
		
		* def paymentPreferencesResponse = call read('classpath:app/api/reload/api-customer/payment-preferences.feature') { customerNo: '#(eosCustomerNo)' } 
		* def eosPaymentPreferenceOid =  karate.jsonPath(paymentPreferencesResponse, "$..id")
		* print eosPaymentPreferenceOid[0]
		* def pos = eosPaymentPreferenceOid[0].lastIndexOf('-')
	
		* def eosPaymentPreferenceId = eosPaymentPreferenceOid[0].substring(pos + 1, eosPaymentPreferenceOid[0].length)
		* print eosPaymentPreferenceId

		
		* def addInvoiceRespose = call read('classpath:app/api/reload/services-css/posts/CreateInvoice.feature') { customerNo: '#(eosCustomerNo)' , crCaseNumber: '#(eoscrCaseNumber)' ,  paymentPreferenceId: '#(eosPaymentPreferenceId)'} 
		
		* def eosInvoiceRefNo = addInvoiceRespose.invoiceReferenceCreated
		* def readInvoice = call read('classpath:app/api/reload/services-css/ReadInvoice.feature') { STR_REFERENCENUMB: '#(eosInvoiceRefNo)'} 
		
		* print JavaApp.waitBeforeDriverInit()
		Given driver FRONTOFFICE_URL +'/home.jsp'
		* waitUntil("document.readyState == 'complete'")
		* def sfc1Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@searchForCase'){ caseNo : '#(claimFormNumber)'}
		* waitForEnabled("input[value=Close]")
		* print JavaApp.waitBeforeDriverInit()
		* driver url = FRONTOFFICE_URL +'/home.jsp'	
		* def sfc1Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@searchForCase'){ caseNo : '#(eoscrCaseNumber)'}
		* def bcvRes = call read('classpath:app/api/reload/web/webui-claim-steps.feature@bypassCrtValidations')
		* def ftRes = call read('classpath:app/api/reload/web/webui-claim-steps.feature@fastTrackPayment'){ caseNo : '#(eoscrCaseNumber)'}
		* def logout01Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@logout')
		* driver.quit()
				
	
	@crt-fasttrackfromscratchSingleCase
	Examples:
	    | read('crt-fast-track-data-singlecase.csv') | 