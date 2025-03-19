@ignore
@ReadCaseManagementDetails-invalid-flow
Feature: Read Case Management Details
    Background: 
		# For get claims for party
		# For a unit testing uncomment lines below, update claimNumber value, remove @ignore
		* def str_casenumber = ''
		* def str_userid = 'yangs'

		
    Scenario: Case Owner
        Given url WSC_CSS_URL + 'ReadCaseManagementDetails'
        * configure headers  = WSC_HTTP_HEADERS
		And param param_str_casenumber = str_casenumber
		And param param_str_userid = str_userid

			
		When method get
		* string responseStr = response
		* karate.write(responseStr, '../src/test/java/app/api/reload/services-css/ReadCaseManagementDetails/ReadCaseManagementDetails-invalid-flow-response 24.2.txt')
		* print response
		Then status 200
		

		