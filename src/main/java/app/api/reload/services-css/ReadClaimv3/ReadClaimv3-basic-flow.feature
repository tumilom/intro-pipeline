#@ignore
@ReadClaimv3-basic-flow
Feature: Read Claim
    Background: 
		# For get claims for party
		# For a unit testing uncomment lines below, update claimNumber value, remove @ignore
		* def str_claimnumber = '10060079646'
		* def str_userid = 'yangs'

		
    Scenario: Case Owner
        Given url WSC_CSS_URL + 'ReadClaimv3'
        * configure headers  = WSC_HTTP_HEADERS
		And param param_str_claimnumber = str_claimnumber
		And param param_str_userid = str_userid

			
		When method get
		* string responseStr = response
		* karate.write(responseStr, '../src/main/java/app/api/reload/services-css/ReadClaimv3/ReadClaimv3-basic-flow-response 24.7.txt')
		* print response
		Then status 200
		

		