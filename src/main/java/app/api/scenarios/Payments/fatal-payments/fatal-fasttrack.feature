@fatal-fasttrackfromscratch
Feature:
    Background: 
        * def JavaApp = Java.type('app.App');
		* def creationDate = JavaApp.daysFromNow('-1')
    
    Scenario: Fatal Fasttrack 
		* def declarationDate =  JavaApp.daysInPast(lodgementOffset,'yyyy-MM-dd') +'T00:00:00'
		* def lodgementDate = JavaApp.daysInPast(lodgementOffset)
		* def accidentDate = JavaApp.daysInPast(lodgementOffset,'yyyy-MM-dd')
		* def effectiveDateVal = JavaApp.daysInPast(lodgementOffset,'dd/MM/yyyy')
		* def dobDate = JavaApp.daysInPast(dobOffset,'yyyy-MM-dd')
		* def dep01dobDate = JavaApp.daysInPast('800','dd/MM/yyyy')
		* def spouseDobDate = JavaApp.daysInPast('10000','dd/MM/yyyy')
		* def altWorkDate = JavaApp.daysFromNow('7')	
		* def incapacityPeriod = '180'
		* def returnToWorkDate = JavaApp.daysFromNow(incapacityPeriod,'yyyy-MM-dd')+'T00:00:00'
		* def fullIncapacityStartDate = JavaApp.daysInPast(lodgementOffset,'yyyy-MM-dd') +'T00:00:00'		
		* def claimFormNumber = RUNID + seq
		* def claimantLastName =  JavaApp.replaceDigits(claimFormNumber + lastname)
		* print 'About to register ' +claimFormNumber +' claim'
		* def verifyClaimRes = call read('classpath:app/api/reload/services-cc/VerifyClaim.feature'){ medFeesNo:'#(claimFormNumber)' }
		Then match verifyClaimRes.errorMessage == 'NoClaimFound:Case not found in database.'
		
		* def ssaRes = call read('classpath:app/api/reload/submit-acc45/submit-single-acc45.feature'){	declarationDate:'#(declarationDate)',				lodgementDate:'#(lodgementDate)', 				accidentDate:'#(accidentDate)', 				dobDate:'#(dobDate)', 				altWorkDate:'#(altWorkDate)', 				incapacityPeriod:'#(incapacityPeriod)', 				returnToWorkDate:'#(returnToWorkDate)', 				fullIncapacityStartDate:'#(fullIncapacityStartDate)', 				claimFormNumber:'#(claimFormNumber)', 				claimantLastName:'#(claimantLastName)', 				claimantFirstName:'#(claimantFirstName)', 				defType:'#(defType)',				causeOfInjury:'#(causeOfInjury)', 				medCode:'#(medCode)' 			}
				
		* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(claimFormNumber)' }
		* def eosCustomerNo  =  overviewResult.eosCustomerNo
		* def eosCaseNo  =  overviewResult.eosCaseNo
		* print 'About to update ' +claimFormNumber +'/' + eosCaseNo + ' claimaint information'

		* def regResult = call read('classpath:app/api/reload/api-customer/isRegistered.feature') { customerNo: '#(eosCustomerNo)' }
		#* def irdResult = call read('classpath:app/api/reload/services-css/posts/UpdateClaimant-IRD.feature') { customerNo: '#(eosCustomerNo)', irdNo: '#(irdNo)' }
		
		* print JavaApp.waitBeforeDriverInit()
		Given driver FRONTOFFICE_URL +'/home.jsp'
		* def login01Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@loginAsOrdinaryUser')
		* waitUntil("document.readyState == 'complete'")		
			
		* def sclRes = call read('classpath:app/api/reload/web/webui-party-steps.feature@searchPersonByCustomerNo'){customerNoVal :'#(eosCustomerNo)' }
		* def udpRes = call read('classpath:app/api/reload/web/webui-party-steps.feature@updateDeceasedPerson'){dateOfDeathVal :'#(effectiveDateVal)' }

		* def sfc1Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@searchForCase'){ caseNo : '#(claimFormNumber)'}
		#* waitForEnabled("input[value=Close]")
		#* def sfrRes = call read('classpath:app/api/reload/web/webui-claim-fatal-steps.feature@addFatalRelationships'){ caseNo : '#(claimFormNumber)',firstNamesVal :'#(firstNames)' ,lastNameVal :'#(lastName)'}
		

		* waitForEnabled("input[value='Add Dep']").click()
		* waitForEnabled("input[value='Find Party']").click()
		* def sfc01Res = call read('classpath:app/api/reload/web/webui-party-steps.feature@searchForPerson'){firstNames :'#(firstNames)' ,lastName :'#(claimantLastName)'}
		* def cspoRes = call read('classpath:app/api/reload/web/webui-party-steps.feature@addNewPerson'){firstNames :'#(firstNames)' ,lastName :'#(claimantLastName)',dateOfBirthVal :'#(dep01dobDate)',irdNumberVal0 :'#(irdNumberVal0)',irdNumberVal1 :'#(irdNumberVal1)',irdNumberVal2 :'#(irdNumberVal2)',genderVal :'#(genderVal)',ethnicityVal :'#(ethnicityVal)',addressLine1Val :'#(addressLine1Val)',suburbVal :'#(suburbVal)',cityVal :'#(cityVal)',postCodeVal :'#(postCodeVal)'}
		
		* waitForEnabled("input[value='Add Dep']").click()
		* select('select[id$=_Roles]','{}Dependant - Spouse').delay(100)	
		
		* waitForEnabled("input[value='Find Party']").click()
		* def sfc02Res = call read('classpath:app/api/reload/web/webui-party-steps.feature@searchForPerson'){firstNames :'SpouseN' ,lastName :'#(claimantLastName)'}
		* def cspo2Res = call read('classpath:app/api/reload/web/webui-party-steps.feature@addNewPerson'){firstNames :'SpouseN' ,lastName :'#(claimantLastName)',dateOfBirthVal :'#(spouseDobDate)',irdNumberVal0 :'#(irdNumberVal0)',irdNumberVal1 :'#(irdNumberVal1)',irdNumberVal2 :'#(irdNumberVal2)',genderVal :'#(genderVal)',ethnicityVal :'#(ethnicityVal)',addressLine1Val :'#(addressLine1Val)',suburbVal :'#(suburbVal)',cityVal :'#(cityVal)',postCodeVal :'#(postCodeVal)'}

		* waitForEnabled("input[value='Add Dep']").click()
		* select('select[id$=_Roles]','{}Dependant - Other').delay(100)	
			
		* waitForEnabled("input[value='Find Party']").click()
		* def sfc02Res = call read('classpath:app/api/reload/web/webui-party-steps.feature@searchForPerson'){firstNames :'Nm' ,lastName :'#(claimantLastName)'}
		* def cspo2Res = call read('classpath:app/api/reload/web/webui-party-steps.feature@addNewPerson'){firstNames :'Nm' ,lastName :'#(claimantLastName)',dateOfBirthVal :'#(spouseDobDate)',irdNumberVal0 :'#(irdNumberVal0)',irdNumberVal1 :'#(irdNumberVal1)',irdNumberVal2 :'#(irdNumberVal2)',genderVal :'#(genderVal)',ethnicityVal :'#(ethnicityVal)',addressLine1Val :'#(addressLine1Val)',suburbVal :'#(suburbVal)',cityVal :'#(cityVal)',postCodeVal :'#(postCodeVal)'}		

		* def getCaseResponse = call read('classpath:app/api/reload/services-css/ReadClaim.feature') { str_claimnumber: '#(eosCaseNo)' } 
		* def spouseCustNo = getCaseResponse.depSpouseCustomerNo
		* def childCustNo = getCaseResponse.depChildCustomerNo
		* def otherCustNo = getCaseResponse.depOtherCustomerNo

		* def spouseRegResult = call read('classpath:app/api/reload/api-customer/isRegistered.feature') { customerNo: '#(spouseCustNo)' }
		* def spousePpResult = call read('classpath:app/api/reload/api-customer/posts/add-payment-preferences.feature') { customerNo: '#(spouseCustNo)' }
	    * def spouseTaxResult = call read('classpath:app/api/reload/api-customer/posts/addTaxCodeRecord.feature') { customerNo: '#(spouseCustNo)',taxType: 'M'  }
		
		* def childRegResult = call read('classpath:app/api/reload/api-customer/isRegistered.feature') { customerNo: '#(childCustNo)' }
		* def childPpResult = call read('classpath:app/api/reload/api-customer/posts/add-payment-preferences.feature') { customerNo: '#(childCustNo)' }
	    * def childTaxResult = call read('classpath:app/api/reload/api-customer/posts/addTaxCodeRecord.feature') { customerNo: '#(childCustNo)',taxType: 'M'  }
		
		* def otherRegResult = call read('classpath:app/api/reload/api-customer/isRegistered.feature') { customerNo: '#(otherCustNo)' }
		* def otherPpResult = call read('classpath:app/api/reload/api-customer/posts/add-payment-preferences.feature') { customerNo: '#(otherCustNo)' }
	    * def otherTaxResult = call read('classpath:app/api/reload/api-customer/posts/addTaxCodeRecord.feature') { customerNo: '#(otherCustNo)',taxType: 'M'  }
		
		* waitForEnabled("{div}General").click()
		* def acsRes = call read('classpath:app/api/reload/web/webui-claim-steps.feature@approveClaimSteps')
		* def acpRes = call read('classpath:app/api/reload/web/webui-claim-steps.feature@addCollectionPoint'){effectiveDateval:'#(effectiveDateval)'}
		* def employmentStatus = 'Current Employment'
		* def seRes = call read('classpath:app/api/reload/web/webui-claim-steps.feature@setupEarnings'){ employerNumber:'#(employerNumber)', employmentStatus:'#(employmentStatus)', earnings01Amount:'#(earnings01Amount)', earnings02Amount:'#(earnings02Amount)',employmentType:'#(employmentType)',earnings01Type:'#(earnings01Type)',earnings02Type:'#(earnings02Type)'}
			

		* waitForEnabled("{div}Accidental Death").click()
	
		* waitForEnabled("input[value='Create Eos Entitlements']").click()
		
		* waitForEnabled("{a}Fatal Survivors Grant Entitlement").click() 
		* waitForEnabled("{div}Payment History").click()

		* def benefitResult = call read('classpath:app/api/reload/api-customer/benefits.feature') { eosCaseNo: '#(eosCaseNo)', customerNo: '#(eosCustomerNo)'  }
		* def fwcCaseNo01 = benefitResult.fwcCaseNos[0]

		* def sfc01Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@searchForCase'){ caseNo : '#(fwcCaseNo01)'}
		* def cbp01Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@createBenefitPeriod')
		* def ra01Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@reviewAll')
		
		* def fwcCaseNo02 = benefitResult.fwcCaseNos[1]
		* def sfc02Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@searchForCase'){ caseNo : '#(fwcCaseNo02)'}
		* def cbp02Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@createBenefitPeriod')
		* def ra02Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@reviewAll')

		* def fwcCaseNo03 = benefitResult.fwcCaseNos[2]
		* def sfc03Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@searchForCase'){ caseNo : '#(fwcCaseNo03)'}
		* def cbp03Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@createBenefitPeriod')
		* def ra03Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@reviewAll')
	
		* def fccCaseNo = benefitResult.fccCaseNo
		* def sfc03Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@searchForCase'){ caseNo : '#(fccCaseNo)'}
		* def cbp03Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@createBenefitPeriod')
		* def ra03Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@reviewAll')
	

		* def logout01Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@logout')
	
		* driver.quit()
		
		* print JavaApp.waitBeforeDriverInit()	
		Given driver FRONTOFFICE_URL +'/home.jsp'
		* def login02Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@loginAsPaymentOfficerUser')
		* waitUntil("document.readyState == 'complete'")
		
		* def sfc03Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@searchForCase'){ caseNo : '#(fwcCaseNo01)'}
		* def awp01Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@approvePayment'){ caseNo : '#(fwcCaseNo01)'}
		* def ft01Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@fastTrackPayment'){ caseNo : '#(fwcCaseNo01)'}
		
		* def sfc04Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@searchForCase'){ caseNo : '#(fwcCaseNo02)'}
		* def awp02Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@approvePayment'){ caseNo : '#(fwcCaseNo02)'}
		* def ft02Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@fastTrackPayment'){ caseNo : '#(fwcCaseNo02)'}

		* def sfc05Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@searchForCase'){ caseNo : '#(fccCaseNo)'}
		* def awp03Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@approvePayment'){ caseNo : '#(fccCaseNo)'}
		* def ft03Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@fastTrackPayment'){ caseNo : '#(fccCaseNo)'}

		* def sfc06Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@searchForCase'){ caseNo : '#(fwcCaseNo03)'}
		* def awp04Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@approvePayment'){ caseNo : '#(fwcCaseNo03)'}
		* def ft04Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@fastTrackPayment'){ caseNo : '#(fwcCaseNo03)'}

		* def logout02Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@logout')
