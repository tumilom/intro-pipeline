@customer-scenario7-approval-orders
Feature: Setup 
    Background: 
        # prerequistes: ACC45 with approval orders
		
    Scenario:      

		* def caseAlias = '10060083542'
		
		* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(caseAlias)' }
		* def eosCustomerNo  =  overviewResult.eosCustomerNo
		* def acc45CaseNo  =  overviewResult.eosCaseNo	

		
		* def isRegistered = call read('classpath:app/api/reload/api-customer/isRegistered.feature') { customerNo: '#(eosCustomerNo)' }				
		* def appResp = call read('classpath:app/api/reload/api-customer/approval-orders.feature') { customerNo: '#(eosCustomerNo)', claimNumber: '#(acc45CaseNo)'} 
		* def approvalOrderId = appResp.firstApprovalOrdeId
		* def appIDResp = call read('classpath:app/api/reload/api-customer/approval-decisions.feature') { customerNo: '#(eosCustomerNo)', claimNumber: '#(acc45CaseNo)', approvalOrderId: '#(approvalOrderId)'} 
