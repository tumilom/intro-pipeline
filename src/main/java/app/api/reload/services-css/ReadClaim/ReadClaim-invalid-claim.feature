@ignore
@ReadClaim-invalid-claim
Feature: Read Claim
    Background: 
		# For get claims for party
		# For a unit testing uncomment lines below, update claimNumber value, remove @ignore
		* def str_claimnumber = '@#$%^&'
		* def str_userid = 'yangs'

		
    Scenario: Case Owner
        Given url WSC_CSS_URL + 'ReadClaim'
        * configure headers  = WSC_HTTP_HEADERS
		And param param_str_claimnumber = str_claimnumber
		And param param_str_userid = str_userid

			
		When method get
		* string responseStr = response
		* karate.write(responseStr, '../src/test/java/app/api/reload/services-css/ReadClaim/ReadClaim-invalid-claim-response 24.2.txt')
		* print response
		Then status 200
		

		