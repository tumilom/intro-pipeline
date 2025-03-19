@ignore
@ReadClientDetailsv1-basic-flow
Feature: Read Client Details
    Background: 
		# For get claims for party
		# For a unit testing uncomment lines below, update claimNumber value, remove @ignore
		* def str_customerno = '20125033'
		* def str_userid = 'yangs'
		
    Scenario: Case Owner
        Given url WSC_CSS_URL +'ReadClientDetailsv1'
        * configure headers  = WSC_HTTP_HEADERS
		And param param_str_customerno = str_customerno
		And param param_str_userid = str_userid
			
		When method get
		* string responseStr = response
		* karate.write(responseStr, '../src/test/java/app/api/reload/services-css/ReadClientDetailsv1/ReadClientDetailsv1-basic-flow-response 24.2.txt')
		* print response
		Then status 200
		
		