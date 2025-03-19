@ignore
@ReadNextPaymentOutEvent-invalid-flow
Feature: Read Claim
    Background: 
		# For get claims for party
		# For a unit testing uncomment lines below, update claimNumber value, remove @ignore
		* def str_casenumber = '19960075371'
		* def str_userid = 'yangs'
		* def str_customerid = 'MYACC:20119030'

		
    Scenario: Case Owner
        Given url WSC_CSS_URL + 'ReadNextPaymentOutEvent'
        * configure headers  = WSC_HTTP_HEADERS
		And param param_str_casenumber = str_casenumber
		And param param_str_userid = str_userid
        And param param_str_customerid = str_customerid
			
		When method get
		* string responseStr = response
		* karate.write(responseStr, '../src/test/java/app/api/reload/services-css/ReadNextPaymentOutEvent/ReadNextPaymentOutEvent-invalid-flow-response 24.2.txt')
		* print response
		Then status 200
		

		