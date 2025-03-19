#@ignore
@cc_ReadTasksForCase
Feature: Read task for a case
    Background: 
		# For get claims for party
		# For a unit testing uncomment lines below, update claimNumber value, remove @ignore
		* def str_casenumber = '10060075371'
		* def str_userid = 'yangs'
		* def str_corrid = '123'
		* def str_taskTypes = '203,204,3464,3926,950,201,2103,3463,3665,5238'
		

		
    Scenario: Case Owner
        Given url WSC_CC_URL + 'ReadTasksForCase'
        * configure headers  = WSC_HTTP_HEADERS
		And param param_str_casenumber = str_casenumber
		And param param_str_userid = str_userid
		And param param_str_corrid = str_corrid
		And param param_str_tasktypes = str_taskTypes
		
			
		When method get
		* print response
		Then status 200
	