@ignore
@css_ReadTasksForCase-non-existent-tasktype
Feature: Read task for a case
    Background: 
		# For get tasks for a claim
		# For a unit testing uncomment lines below, update the paramters casenumber, taskTypes, createdbefore and createdafter values, remove @ignore
		* def STR_CASENUMBER = '10060075371'
		* def str_userid = 'yangs'
		* def str_corrid = '123'
		* def str_taskTypes = '001,002'
		* def STR_CREATEDAFTER = '20231011'
		* def STR_CREATEDBEFORE = '20241011'

		
    Scenario: Case Owner
        Given url WSC_CSS_URL + 'ReadTasksForCase'
        * configure headers  = WSC_HTTP_HEADERS
		And param PARAM_STR_CASENUMBER = STR_CASENUMBER
		And param param_str_userid = str_userid
		And param param_str_corrid = str_corrid
		And param param_str_tasktypes = str_taskTypes
		And param PARAM_STR_CREATEDAFTER = STR_CREATEDAFTER
		And param PARAM_STR_CREATEDBEFORE = STR_CREATEDBEFORE
		
			
		When method get
		* string responseStr = response
		* karate.write(responseStr, '../src/test/java/app/api/reload/services-css/ReadTasksForCase/ReadTasksForCase-non-existent-tasktype-response 24.2.txt')
		* print response
		Then status 200
	