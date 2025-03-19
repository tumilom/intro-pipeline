@wceApprovePeriods
Feature: Payments setup automation - Approve WCE periods
 Background:

	
	* configure retry = {count:12, interval:2000}
	
	Scenario Outline: Approve ${RUNID}<seq> WCE periods 
	* def caseNumber = RUNID + '<seq>'
	* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(caseNumber)' }
	* def eosCustomerNo  =  overviewResult.eosCustomerNo
	* def eosCaseNo  =  overviewResult.eosCaseNo
	* def benefitResult = call read('classpath:app/api/reload/api-customer/benefits.feature') { eosCaseNo: '#(eosCaseNo)', customerNo: '#(eosCustomerNo)'  }		
	* def wceCaseNo = benefitResult.wceCaseNo
	* print wceCaseNo
	
	Given driver FRONTOFFICE_URL +'/home.jsp'
	* def login02Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@loginAsPaymentOfficerUser')
	* waitUntil("document.readyState == 'complete'")
	
	* def sfcRes = call read('classpath:app/api/reload/web/webui-claim-steps.feature@searchForCase'){ caseNo : '#(wceCaseNo)'}
	* def awpRes = call read('classpath:app/api/reload/web/webui-claim-steps.feature@approvePayment'){ caseNo : '#(wceCaseNo)'}
	* def ftRes = call read('classpath:app/api/reload/web/webui-claim-steps.feature@fastTrackPayment'){ caseNo : '#(wceCaseNo)'}
	
	
	Examples:
        | seq	| 
        | 02 	| 
		| 03 	| 
		| 04 	| 
		| 05 	| 