@mya4b-scenario5-payments
Feature: group client API - payments
    Background: 
        # prerequistes:  run @era-fasttrackfromscratchSingleCase to set up data, the employerNo must be in party case role
					
		# ACCCU-621 amounts-pending-payment
			
		
    Scenario:      
	    * def employerNo = 'CN135780D'
		* def eosGCUserId = 'GC-CN135780D'			
													
		* def createGCUserRes = call read('classpath:app/api/reload/services-css/posts/createOrUpdateEmployerViewpointUser.feature') { employerId: '#(employerNo)', userIdToCreate: '#(eosGCUserId)' } 		
		 		
		* def caseNo = 'SY00241'		
		
		* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(caseNo)' }
		* def eosCustomerNo  =  overviewResult.eosCustomerNo
		* def acc45CaseNo  =  overviewResult.eosCaseNo	
		
		* def getBenefitsResponse = call read('classpath:app/api/reload/api-groupclient/benefits.feature') { claimNumber: '#(acc45CaseNo)' , gcUserId: '#(eosGCUserId)' } 
		* def wceCaseNo = getBenefitsResponse.wceCaseNo[0]
		* print wceCaseNo
		
		* def getAmountsPendingRes = call read('classpath:app/api/reload/api-groupclient/amounts-pending-payment.feature') { claimNumber: '#(acc45CaseNo)' , gcUserId: '#(eosGCUserId)' } 
		
	
		
		