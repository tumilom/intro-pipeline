#@ignore
@ReadTasksForCase
Feature: Read task for a case
    Background: 
		# For get claims for party
		# For a unit testing uncomment lines below, update claimNumber value, remove @ignore
		* def str_caseNumber = '10060075371'
		* def str_userid = 'yangs'
		* def str_taskTypes = '203,204,3464,3926,950,201,2103,3463,3665,5238,5848'
		* def str_createdAfter = '20241201'
		* def str_createdBefore = '20241201'
		* def str_status = '928000'

		
    Scenario: Case Owner
        Given url WSC_CSS_URL + 'ReadTasksForCase'
        * configure headers  = WSC_HTTP_HEADERS
		And param param_str_caseNumber = str_caseNumber
		And param param_str_userid = str_userid
		And param param_str_taskTypes = str_taskTypes
		And param param_str_createdAfter = str_createdAfter
		And param param_str_createdBefore = str_createdBefore
		And param param_str_status = str_status
			
		When method get
		* print response
		Then status 200
		
