#@ignore
@ReadCaseManagementDetailsv1-basic-flow
Feature: Read Case Management Details
    Background: 
		# For get claims for party
		# For a unit testing uncomment lines below, update claimNumber value, remove @ignore
		* def str_casenumber = '10060079621'
		* def str_userid = 'yangs'

		
    Scenario: Case Owner
        Given url WSC_CSS_URL +  'ReadCaseManagementDetailsv1'
        * configure headers  = WSC_HTTP_HEADERS
		And param param_str_casenumber = str_casenumber
		And param param_str_userid = str_userid

			
		When method get
		* string responseStr = response
		* karate.write(responseStr, '../src/main/java/app/api/reload/services-css/ReadCaseManagementDetailsv1/ReadCaseManagementDetailsv1-basic-flow-response 24.7 new.txt')
		* print response
		Then status 200
		

		