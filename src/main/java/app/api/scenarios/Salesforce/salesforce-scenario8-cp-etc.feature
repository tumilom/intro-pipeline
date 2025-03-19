@salesforce-scenario8-cp-etc
Feature: claims list and details
    Background: 
        # prerequistes: customer has a ACC45 claim with Purchase Orders
		
		# ACCCU-825 - WSC Get Claim collection points
		# ACCCU-827 - GET- WSC Get ECO Details	
		# ACCCU-829 - GET - WSC Get Occupation Details
		# ACCCU-831 - GET - WSC Get claim indicators
		# ACCCU-834 - GET - WSC Get Case Owner
 			
    Scenario: 
        #* def caseNo = '10060066733'			
		#* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(caseNo)' }
		* def caseAlias = RUNID +'03'
		* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(caseAlias)' }		
		* def eosCustomerNo  =  overviewResult.eosCustomerNo
		* def acc45CaseNo  =  overviewResult.eosCaseNo	
			
			
		# Get customer and claim details
		* def getcp = call read('classpath:app/api/reload/services-cc/ReadClaimCollectionPoints.feature') { caseNumber: '#(acc45CaseNo)'} 	
	    * def getecod = call read('classpath:app/api/reload/services-cc/ReadECODetails.feature') { caseNumber: '#(acc45CaseNo)'} 		
		* def getocc = call read('classpath:app/api/reload/services-cc/ReadOccupationDetails.feature') { caseNumber: '#(acc45CaseNo)'} 
		* def getclind = call read('classpath:app/api/reload/services-cc/ReadPartyIndicatorsv1.feature') { strCustomerNumber: '#(eosCustomerNo)'} 
		* def getclind = call read('classpath:app/api/reload/services-cc/ReadCaseOwner.feature') { claimNumber: '#(acc45CaseNo)'} 
		
