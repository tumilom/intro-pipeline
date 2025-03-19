@salesforce-scenario7-claims-list
Feature: claims list and details
    Background: 
        # prerequistes: customer has a ACC45 claim with Purchase Orders
		
		# ACCCU-787 - GET - Returns a list of claims associated with the customer
		# ACCCU-788 - GET - Returns a claim for the claim Id
		# ACCCU-789 - GET - Returns a list of the case participants
		# ACCCU-800 - GET - Returns a customer for the case

 			
    Scenario: 
        #* def caseNo = '10060066733'			
		#* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(caseNo)' }
		* def caseAlias = RUNID +'03'
		* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(caseAlias)' }		
		* def eosCustomerNo  =  overviewResult.eosCustomerNo
		* def acc45CaseNo  =  overviewResult.eosCaseNo	
			
			
		# Get customer and claim details
		* def getappord = call read('classpath:app/api/reload/api-cc/customer-identifier.feature') { claimNumber: '#(acc45CaseNo)'} 	
	    * def getappdec = call read('classpath:app/api/reload/api-cc/claim-summaries.feature') { customerNo: '#(eosCustomerNo)'} 		
		* def getappdecid = call read('classpath:app/api/reload/api-cc/claim-summaries-id.feature') { claimNumber: '#(acc45CaseNo)',customerNo: '#(eosCustomerNo)'} 

		
