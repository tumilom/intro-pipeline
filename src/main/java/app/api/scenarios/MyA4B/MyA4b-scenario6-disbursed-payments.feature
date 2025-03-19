@mya4b-scenario6-disbursed-payments
Feature: group client API - payments
    Background: 
        # prerequistes:  run @era-fasttrackfromscratchSingleCase to set up data, the employerNo must be in party case role, for disbursed payments, need to wait for overnight batch to process payments to PEI
					
		# ACCCU-623 disbursed-payments				
		
    Scenario:      
	    * def employerNo = 'A1323118E'
		* def eosGCUserId = 'GC-A1323118E'			
													
		* def createGCUserRes = call read('classpath:app/api/reload/services-css/posts/createOrUpdateEmployerViewpointUser.feature') { employerId: '#(employerNo)', userIdToCreate: '#(eosGCUserId)' } 		
		 		
		* def caseNo = '10060066392'		
		
		* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(caseNo)' }
		* def eosCustomerNo  =  overviewResult.eosCustomerNo
		* def acc45CaseNo  =  overviewResult.eosCaseNo	
		
		* def getBenefitsResponse = call read('classpath:app/api/reload/api-groupclient/benefits.feature') { claimNumber: '#(acc45CaseNo)' , gcUserId: '#(eosGCUserId)' } 
		* def wceCaseNo = getBenefitsResponse.wceCaseNo[0]
		* print wceCaseNo
		
		* def getdpaymentsRes = call read('classpath:app/api/reload/api-groupclient/disbursed-payments.feature') { claimNumber: '#(acc45CaseNo)' , gcUserId: '#(eosGCUserId)' } 
		* def eosPeiId = getdpaymentsRes.peiIds[0]
		* print eosPeiId
	
		* def getdpaymentsSingleRes = call read('classpath:app/api/reload/api-groupclient/disbursed-payments-getsingle.feature') { claimNumber: '#(acc45CaseNo)' , peiId: '#(eosPeiId)',gcUserId: '#(eosGCUserId)' } 
		
		* def getdpaymentsSingleBreakDownsRes = call read('classpath:app/api/reload/api-groupclient/disbursed-payments-getsingle-breakdowns.feature') { claimNumber: '#(acc45CaseNo)' , peiId: '#(eosPeiId)',gcUserId: '#(eosGCUserId)' } 
		* def eosPaymentLineId = getdpaymentsSingleBreakDownsRes.paymentLineIds[0]
		* print eosPaymentLineId	
	
		* def getdpaymentsSingleBreakDownsSingleRes = call read('classpath:app/api/reload/api-groupclient/disbursed-payments-getsingle-breakdowns-getsingle.feature') { claimNumber: '#(acc45CaseNo)' , peiId: '#(eosPeiId)',paymentLineId: '#(eosPaymentLineId)', gcUserId: '#(eosGCUserId)' } 
		
		#employer disbursed payments	
		* def geEmpDpaymentsRes = call read('classpath:app/api/reload/api-groupclient/employer-disbursed-payments.feature') {  gcUserId: '#(eosGCUserId)' } 
		* def eosEmpPeiId = geEmpDpaymentsRes.peiIds[0]
		* print eosEmpPeiId
		
		* def getEmpDpaymentsSingleRes = call read('classpath:app/api/reload/api-groupclient/employer-disbursed-payments-getsingle.feature') { peiId: '#(eosPeiId)',gcUserId: '#(eosGCUserId)' } 
		
		* def getEmpdpaymentsSingleBreakDownsRes = call read('classpath:app/api/reload/api-groupclient/employer-disbursed-payments-getsingle-breakdowns.feature') {peiId: '#(eosPeiId)',gcUserId: '#(eosGCUserId)' } 
		* def eosEmpPaymentLineId = getEmpdpaymentsSingleBreakDownsRes.paymentLineIds[0]
		* print eosEmpPaymentLineId
		
		* def getEmpdpaymentsSingleBreakDownsSingleRes = call read('classpath:app/api/reload/api-groupclient/employer-disbursed-payments-getsingle-breakdowns-getsingle.feature') { peiId: '#(eosPeiId)',paymentLineId: '#(eosPaymentLineId)', gcUserId: '#(eosGCUserId)' }
				
		
		