@pic-combinedIAfasttrackfromscratch
Feature:
    Background: 
        * def JavaApp = Java.type('app.App');
		* def creationDate = JavaApp.daysFromNow('-1')
    
    Scenario: Combined IA Fasttrack
		* def declarationDate =  JavaApp.daysInPast(lodgementOffset,'yyyy-MM-dd') +'T00:00:00'
		* def lodgementDate = JavaApp.daysInPast(lodgementOffset)
		* def accidentDate = JavaApp.daysInPast(lodgementOffset,'yyyy-MM-dd')
		* def effectiveDateVal = JavaApp.daysInPast(lodgementOffset,'dd/MM/yyyy')
		* def dobDate = JavaApp.daysInPast(dobOffset,'yyyy-MM-dd')
		* def altWorkDate = JavaApp.daysFromNow('7')
		* def incapacityPeriod = '180'
		* def returnToWorkDate = JavaApp.daysFromNow(incapacityPeriod,'yyyy-MM-dd')+'T00:00:00'
		* def fullIncapacityStartDate = JavaApp.daysInPast(lodgementOffset,'yyyy-MM-dd') +'T00:00:00'		
		* def claimFormNumber = RUNID + seq
		* def claimantLastName =  JavaApp.replaceDigits(claimFormNumber + lastname)
		* print 'About to register ' +claimFormNumber +' claim'
		#* def verifyClaimRes = call read('classpath:app/api/reload/services-cc/VerifyClaim.feature'){ medFeesNo:'#(claimFormNumber)' }
		#Then match verifyClaimRes.errorMessage == 'NoClaimFound:Case not found in database.'

		* def ssaRes = call read('classpath:app/api/reload/submit-acc45/submit-single-acc45.feature'){	declarationDate:'#(declarationDate)',				lodgementDate:'#(lodgementDate)', 				accidentDate:'#(accidentDate)', 				dobDate:'#(dobDate)', 				altWorkDate:'#(altWorkDate)', 				incapacityPeriod:'#(incapacityPeriod)', 				returnToWorkDate:'#(returnToWorkDate)', 				fullIncapacityStartDate:'#(fullIncapacityStartDate)', 				claimFormNumber:'#(claimFormNumber)', 				claimantLastName:'#(claimantLastName)', 				claimantFirstName:'#(claimantFirstName)', 				defType:'#(defType)',				causeOfInjury:'#(causeOfInjury)', 				medCode:'#(medCode)' 			}
		
		* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(claimFormNumber)' }
		* def eosCustomerNo  =  overviewResult.eosCustomerNo
		* def eosCaseNo  =  overviewResult.eosCaseNo
		* print 'About to update ' +claimFormNumber +'/' + eosCaseNo + ' claimaint information'
		
		* def irdResult = call read('classpath:app/api/reload/services-css/posts/UpdateClaimant-IRD.feature') { customerNo: '#(eosCustomerNo)', irdNo: '#(irdNo)' }
		* def regResult = call read('classpath:app/api/reload/api-customer/isRegistered.feature') { customerNo: '#(eosCustomerNo)' }       
		* def ppResult = call read('classpath:app/api/reload/api-customer/posts/add-payment-preferences.feature') { customerNo: '#(eosCustomerNo)' }	  
	
		* print JavaApp.waitBeforeDriverInit()
	    Given driver FRONTOFFICE_URL +'/home.jsp'
		* def login01Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@loginAsOrdinaryUser')
		* waitUntil("document.readyState == 'complete'")
		* def sfc1Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@searchForCase'){ caseNo : '#(claimFormNumber)'}
		* waitForEnabled("input[value=Close]")
	
		* def acsRes = call read('classpath:app/api/reload/web/webui-claim-steps.feature@approveClaimSteps')		
		* def uacRes = call read('classpath:app/api/reload/web/webui-claim-pic-steps.feature@updateAccidentDate'){ accidentDateVal:'#(picAccidentDateTime)'}
		* def uidRes = call read('classpath:app/api/reload/web/webui-claim-pic-steps.feature@updateIncurredDate'){ incurredDateVal:'#(incurredDate)'}
		
		* def asRes = call read('classpath:app/api/reload/web/webui-claim-steps.feature@addSubcase'){ subcaseType :'Permanent Injury Compensation'}
		
		* def benefitResult = call read('classpath:app/api/reload/api-customer/benefits.feature') { eosCaseNo: '#(eosCaseNo)', customerNo: '#(eosCustomerNo)'  }		
		* def picCaseNo = benefitResult.picCaseNo		

		* print JavaApp.waitBeforeDriverInit()
		* driver url = FRONTOFFICE_URL +'/home.jsp'	
		* def sfc1Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@searchForCase'){ caseNo : '#(picCaseNo)'}	
		* waitForEnabled("input[value=Close]")
				
		* def aciatRes = call read('classpath:app/api/reload/web/webui-claim-pic-steps.feature@addCombinedIA'){lumpSumVal : '#(lumpSum)', flpPaidVal : '#(flpPaid)', paidDateVal: '#(paidDate)', applicationDateVal: '#(applicationDate)', lumpsumWpiVal: '#(lumpsumWpiScore)'}		
		
		* def assessmentStatus = 'Approved'
		* def decisionDate = JavaApp.daysInPast('0','dd/MM/yyyy')
		* def assessmentDate = JavaApp.daysInPast('0','dd/MM/yyyy')
		
		* def awpiRes = call read('classpath:app/api/reload/web/webui-claim-pic-steps.feature@approveWPI'){assessmentStatusVal : '#(assessmentStatus)', decisionDateVal : '#(decisionDate)', assessmentDateVal : '#(assessmentDate)', wpiScoreVal : '#(wpiScore)' }		
		* def calEntRes = call read('classpath:app/api/reload/web/webui-claim-pic-steps.feature@picCalculateEntitlement')
		* def recRes = call read('classpath:app/api/reload/web/webui-claim-pic-steps.feature@goToPICRecurringPaymentsTab')		
		* def cbpEntRes = call read('classpath:app/api/reload/web/webui-claim-steps.feature@createBenefitPeriod')				
		* def raRes = call read('classpath:app/api/reload/web/webui-claim-steps.feature@reviewAll')
		* def logout01Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@logout')
		
		* driver.quit()
		
		* print JavaApp.waitBeforeDriverInit()
		Given driver FRONTOFFICE_URL +'/home.jsp'
		* def login02Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@loginAsPaymentOfficerUser')
		* waitUntil("document.readyState == 'complete'")
	
		* def sfc2Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@searchForCase'){ caseNo : '#(picCaseNo)'}
		* def rec2Res = call read('classpath:app/api/reload/web/webui-claim-pic-steps.feature@goToPICRecurringPaymentsTab')	
		* def awpRes = call read('classpath:app/api/reload/web/webui-claim-steps.feature@approvePayment'){ caseNo : '#(picCaseNo)'}
		* def ftRes = call read('classpath:app/api/reload/web/webui-claim-steps.feature@fastTrackPayment'){ caseNo : '#(picCaseNo)'}
		
		* def logout02Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@logout')
		