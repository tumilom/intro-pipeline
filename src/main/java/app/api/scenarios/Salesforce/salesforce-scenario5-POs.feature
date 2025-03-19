@salesforce-scenario5-POs
Feature: PO related endpoints
    Background: 
        # prerequistes: customer has a ACC45 claim with Purchase Orders

 			
    Scenario: 
        #* def caseNo = '10060066733'			
		#* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(caseNo)' }
		* def caseAlias = RUNID +'03'
		* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(caseAlias)' }		
		* def eosCustomerNo  =  overviewResult.eosCustomerNo
		* def eosCustomerNo  =  overviewResult.eosCustomerNo
		* def acc45CaseNo  =  overviewResult.eosCaseNo	
			
			
		# GetApprovalOrders and ApprovalDecisions ForCase
		* def getappord = call read('classpath:app/api/reload/api-cc/approval-orders.feature') { claimNumber: '#(acc45CaseNo)'} 	
	    * def getappdec = call read('classpath:app/api/reload/api-cc/approval-decisions.feature') { claimNumber: '#(acc45CaseNo)'} 			
		
