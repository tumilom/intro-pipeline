@customer-scenario6-claims-info
Feature: get claims information
    Background: 
        # prerequistes: customer has a ACC45 claim
		# API calls:
		# 	readClaim
		#	readCaseManagementDetails
		#	readClaimInjuryDetails
		
    Scenario: 

		* def caseNo = '10060068497'
		
		* def getReadClaimResponse = call read('classpath:app/api/reload/services-css/ReadClaim.feature') { str_claimnumber: '#(caseNo)'} 
		* def getReadCaseManagementDetailsresponse = call read('classpath:app/api/reload/services-css/ReadCaseManagementDetails.feature') { str_casenumber: '#(caseNo)'} 
		* def getReadClaimInjuryDetailsresponse = call read('classpath:app/api/reload/services-css/readClaimInjuryDetails.feature') { str_claimnumber: '#(caseNo)'} 
	