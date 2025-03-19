#@ignore
@ReadClientDetailsv1
Feature: Read Client Details
    Background: 
		# For get claims for party
		# For a unit testing uncomment lines below, update claimNumber value, remove @ignore
		* def str_customerno = '20125033'
		* def str_userid = 'yangs'
		
    Scenario: Case Owner
        Given url WSC_CSS_URL + 'ReadClientDetailsv1'
        * configure headers  = WSC_HTTP_HEADERS
		And param param_str_customerno = str_customerno
		And param param_str_userid = str_userid
			
		When method get
		* print response
		Then status 200
		
		