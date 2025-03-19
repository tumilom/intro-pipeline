#@ignore
@ReadClientDetails-basic-flow
Feature: Read Client Details
    Background: 
		# For get claims for party
		# For a unit testing uncomment lines below, update claimNumber value, remove @ignore
		* def str_customerno = '20124372'
		* def str_userid = 'yangs'
		
    Scenario: Case Owner
        Given url WSC_CSS_URL +'ReadClientDetails'
        * configure headers  = WSC_HTTP_HEADERS
		And param param_str_customerno = str_customerno
		And param param_str_userid = str_userid
			
		When method get
		* string responseStr = response
		* karate.write(responseStr, '../src/main/java/app/api/reload/services-css/ReadClientDetails/ReadClientDetails-basic-flow-response 24.7.txt')
		* print response
		Then status 200
		
		