@fasttrackfromscratch
Feature:
    Background: 
        * def JavaApp = Java.type('app.App');
		* def creationDate = JavaApp.daysFromNow('-1')
    
    Scenario: Fast track payment - generic scenario
		* def declarationDate =  JavaApp.daysInPast(lodgementOffset,'yyyy-MM-dd') +'T00:00:00'
		* def lodgementDate = JavaApp.daysInPast(lodgementOffset)
		* def accidentDate = JavaApp.daysInPast(lodgementOffset,'yyyy-MM-dd')
		* def effectiveDateVal = JavaApp.daysInPast(lodgementOffset,'dd/MM/yyyy')
		* def dobDate = JavaApp.daysInPast(dobOffset,'yyyy-MM-dd')
		* def altWorkDate = JavaApp.daysFromNow('7')
		* def incapacityPeriod = '98'
		* def returnToWorkDate = JavaApp.daysFromNow(incapacityPeriod,'yyyy-MM-dd')+'T00:00:00'
		* def fullIncapacityStartDate = JavaApp.daysInPast(lodgementOffset,'yyyy-MM-dd') +'T00:00:00'		
		* def claimFormNumber = RUNID + seq
		* def claimantLastName =  JavaApp.replaceDigits(claimFormNumber + lastname)
		* print 'About to register ' +claimFormNumber +' claim'
		* def verifyClaimRes = call read('classpath:app/api/reload/services-cc/VerifyClaim.feature'){ medFeesNo:'#(claimFormNumber)' }
		Then match verifyClaimRes.errorMessage == 'NoClaimFound:Case not found in database.'
		* def ssaRes = call read('classpath:app/api/reload/submit-acc45/submit-single-acc45.feature'){	declarationDate:'#(declarationDate)',				lodgementDate:'#(lodgementDate)', 				accidentDate:'#(accidentDate)', 				dobDate:'#(dobDate)', 				altWorkDate:'#(altWorkDate)', 				incapacityPeriod:'#(incapacityPeriod)', 				returnToWorkDate:'#(returnToWorkDate)', 				fullIncapacityStartDate:'#(fullIncapacityStartDate)', 				claimFormNumber:'#(claimFormNumber)', 				claimantLastName:'#(claimantLastName)', 				claimantFirstName:'#(claimantFirstName)', defType:'#(defType)', causeOfInjury:'#(causeOfInjury)', medCode:'#(medCode)'	}
		
		
		* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(claimFormNumber)' }
		* def eosCustomerNo  =  overviewResult.eosCustomerNo
		* def eosCaseNo  =  overviewResult.eosCaseNo
		* print 'About to update ' +claimFormNumber +'/' + eosCaseNo + ' claimaint information'
		
		* def irdResult = call read('classpath:app/api/reload/services-css/posts/UpdateClaimant-IRD.feature') { customerNo: '#(eosCustomerNo)', irdNo: '#(irdNo)' }
		* def regResult = call read('classpath:app/api/reload/api-customer/isRegistered.feature') { customerNo: '#(eosCustomerNo)' }
        * def addressResult = call read('classpath:app/api/reload/services-css/posts/claimant-address.feature') { eosCustomerNo: '#(eosCustomerNo)' , verificationStatus:'Verified' }
        * def phoneResult = call read('classpath:app/api/reload/services-css/posts/claimant-phone.feature') { eosCustomerNo: '#(eosCustomerNo)' }
		* def emailResult = call read('classpath:app/api/reload/services-css/posts/claimant-email.feature') { eosCustomerNo: '#(eosCustomerNo)' }
		* def taxResult = call read('classpath:app/api/reload/api-customer/posts/addTaxCodeRecord.feature') { customerNo: '#(eosCustomerNo)', taxType: '#(taxType)'  }
		* def ppResult = call read('classpath:app/api/reload/api-customer/posts/add-payment-preferences.feature') { customerNo: '#(eosCustomerNo)' }
	    
		* print JavaApp.waitBeforeDriverInit()
	    Given driver FRONTOFFICE_URL +'/home.jsp'
		* def login01Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@loginAsOrdinaryUser')
		* waitUntil("document.readyState == 'complete'")
		* def sfc1Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@searchForCase'){ caseNo : '#(claimFormNumber)'}
		* waitForEnabled("input[value=Close]")
	
		* def acsRes = call read('classpath:app/api/reload/web/webui-claim-steps.feature@approveClaimSteps')
		* def amiRes = call read('classpath:app/api/reload/web/webui-claim-steps.feature@approveMedicalIncapacity')

		* def acpRes = call read('classpath:app/api/reload/web/webui-claim-steps.feature@addCollectionPoint'){effectiveDateval:'#(effectiveDateval)'}
		* def employmentStatus = 'Current Employment'
		* def seRes = call read('classpath:app/api/reload/web/webui-claim-steps.feature@setupEarnings'){ employerNumber:'#(employerNumber)', employmentStatus:'#(employmentStatus)', earnings01Amount:'#(earnings01Amount)', earnings02Amount:'#(earnings02Amount)',employmentType:'#(employmentType)',earnings01Type:'#(earnings01Type)',earnings02Type:'#(earnings02Type)'}
		* def asRes = call read('classpath:app/api/reload/web/webui-claim-steps.feature@addSubcase'){ subcaseType :'Weekly Compensation Entitlement'}
		
		* def benefitResult = call read('classpath:app/api/reload/api-customer/benefits.feature') { eosCaseNo: '#(eosCaseNo)', customerNo: '#(eosCustomerNo)'  }		
		* def wceCaseNo = benefitResult.wceCaseNo
		* print "WCE CaseNo: "+wceCaseNo

		* print JavaApp.waitBeforeDriverInit()
		* driver url = FRONTOFFICE_URL +'/home.jsp'
	
		* def sfc1Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@searchForCase'){ caseNo : '#(wceCaseNo)'}
		* def cbpRes = call read('classpath:app/api/reload/web/webui-claim-steps.feature@createBenefitPeriod')
		* def raRes = call read('classpath:app/api/reload/web/webui-claim-steps.feature@reviewAll')
		
		* def logout01Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@logout')
		
		* driver.quit()
		
		* print JavaApp.waitBeforeDriverInit()
		Given driver FRONTOFFICE_URL +'/home.jsp'
		* def login02Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@loginAsPaymentOfficerUser')
		
		* waitUntil("document.readyState == 'complete'")
	
		* def sfc2Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@searchForCase'){ caseNo : '#(wceCaseNo)'}
		* def awpRes = call read('classpath:app/api/reload/web/webui-claim-steps.feature@approvePayment'){ caseNo : '#(wceCaseNo)'}
		* def ftRes = call read('classpath:app/api/reload/web/webui-claim-steps.feature@fastTrackPayment'){ caseNo : '#(wceCaseNo)'}
		
		* def logout02Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@logout')