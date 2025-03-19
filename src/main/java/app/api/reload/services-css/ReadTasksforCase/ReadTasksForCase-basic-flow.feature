@ignore
@css_ReadTasksForCase-basic-flow
Feature: Read task for a case
    Background: 
		# For get tasks for a claim
		# For a unit testing uncomment lines below, update the paramters casenumber, taskTypes, createdbefore and createdafter values, remove @ignore
		* def STR_CASENUMBER = '10060075371'
		* def str_userid = 'yangs'
		* def str_taskTypes = '203,204,3464,3926,950,201,2103,3463,3665,5238'
		* def STR_CREATEDAFTER = '20231011'
		* def STR_CREATEDBEFORE = '20241011'

		
    Scenario: Case Owner
        Given url WSC_CSS_URL +'ReadTasksForCase'
        * configure headers  = WSC_HTTP_HEADERS
		And param PARAM_STR_CASENUMBER = STR_CASENUMBER
		And param param_str_userid = str_userid
		And param param_str_tasktypes = str_taskTypes
		And param PARAM_STR_CREATEDAFTER = STR_CREATEDAFTER
		And param PARAM_STR_CREATEDBEFORE = STR_CREATEDBEFORE
		
			
		When method get
		* string responseStr = response
		* karate.write(responseStr, '../src/test/java/app/api/reload/services-css/ReadTasksForCase/ReadTasksForCase-basic-flow-response 24.2.txt')
		* print response
		Then status 200
	