@ignore
@ReadClaimInjuryDetails-basic-flow
Feature: Read Claim
    Background: 
		# For get claims for party
		# For a unit testing uncomment lines below, update claimNumber value, remove @ignore
		* def str_claimnumber = '10060066370'
		* def str_userid = 'yangs'

		
    Scenario: Case Owner
        Given url WSC_CSS_URL + 'ReadClaimInjuryDetails'
        * configure headers  = WSC_HTTP_HEADERS
		And param param_str_claimnumber = str_claimnumber
		And param param_str_userid = str_userid

			
		When method get
		* string responseStr = response
		* karate.write(responseStr, '../src/test/java/app/api/reload/services-css/ReadClaimInjuryDetails/ReadClaimInjuryDetails-basic-flow-response 24.2.txt')
		* print response
		Then status 200
		

		