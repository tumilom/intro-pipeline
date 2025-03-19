@customer-scenario5-payments-info
Feature: get payment information
    Background: 
        # prerequistes: customer has a ACC45 claim, WCE case with payments in Payment History with transaction status ='Extracted'
		# API calls:
		# 	get main payee
		#	getpayments
		#	get payment lines
		#	get future payments
		
    Scenario: 
		* def caseNo = RUNID +'51'
		
		* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(caseNo)' }
		* def eosCustomerNo  =  overviewResult.eosCustomerNo
		* def acc45CaseNo  =  overviewResult.eosCaseNo		
		
		* def isRegistered = call read('classpath:app/api/reload/api-customer/isRegistered.feature') { customerNo: '#(eosCustomerNo)' }
	
		* def getCaseResponse = call read('classpath:app/api/reload/api-customer/benefits.feature') { eosCaseNo: '#(acc45CaseNo)' , customerNo: '#(eosCustomerNo)' } 
		
		* def wceCaseNo = getCaseResponse.wceCaseNo[0]
		* print wceCaseNo
		
		* def getMainPayeeResponse = call read('classpath:app/api/reload/api-customer/mainPayeeDetails.feature') { eosCaseNo: '#(acc45CaseNo)' , customerNo: '#(eosCustomerNo)', eosBenefitCaseNo: '#(wceCaseNo)' } 
		
		* def getPaymentsResponse = call read('classpath:app/api/reload/api-customer/payments.feature') { eosCaseNo: '#(acc45CaseNo)' , customerNo: '#(eosCustomerNo)' } 
		* def paymentId = getPaymentsResponse.firstPeiOid
				
		* def getPaymentLineResponse = call read('classpath:app/api/reload/api-customer/paymentLines.feature') { eosCaseNo: '#(acc45CaseNo)' , customerNo: '#(eosCustomerNo)' ,peiOid: '#(paymentId)'} 
			
		* def getFuturePaymentsResponse = call read('classpath:app/api/reload/api-customer/futurePayments.feature') { eosCaseNo: '#(acc45CaseNo)' , customerNo: '#(eosCustomerNo)' } 