#@ignore
@ReadTasks
Feature: Read task
    Background: 
		# For get claims for party
		# For a unit testing uncomment lines below, update claimNumber value, remove @ignore
		* def str_customerNumber = '20099132'
			* def STR_USERID = 'YANGS'
		* def str_createdAfter = '20241201'
		* def str_createdBefore = '20241201'
		* def str_status = '928000'

		
    Scenario: Case Owner
        Given url WSC_CSS_URL + 'ReadTasks'
        * configure headers  = WSC_HTTP_HEADERS
		And param PARAM_STR_CUSTOMERNO = str_customerNumber
		And param param_str_userid = str_userid
		And param param_STR_USERID = STR_USERID
		And param param_str_createdAfter = str_createdAfter
		And param param_str_createdBefore = str_createdBefore
			
		When method get
		* print response
		Then status 200
		
