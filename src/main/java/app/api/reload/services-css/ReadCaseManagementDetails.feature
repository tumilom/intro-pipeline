#@ignore
@ReadCaseManagementDetails
Feature: Read Claim
    Background: 
		# For get claims for party
		# For a unit testing uncomment lines below, update claimNumber value, remove @ignore
		* def str_casenumber = '10060066370'
		* def str_userid = 'yangs'

		
    Scenario: Case Owner
        Given url WSC_CSS_URL + 'ReadCaseManagementDetails'
        * configure headers  = WSC_HTTP_HEADERS
		And param param_str_casenumber = str_casenumber
		And param param_str_userid = str_userid

			
		When method get
		* print response
		Then status 200
		