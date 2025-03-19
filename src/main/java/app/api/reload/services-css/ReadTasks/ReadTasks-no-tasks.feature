@ignore
@css_ReadTasks-no-tasks
Feature: Read task
    Background: 
		# For get tasks for party
		# For a unit testing uncomment lines below, update claimNumber value, remove @ignore
		* def str_customerNumber = '20103028'
		* def STR_USERID = 'YANGS'
		* def str_createdAfter = '20240101'
		* def str_createdBefore = '20241201'
		* def str_status = '928000'

		
    Scenario: Case Owner
        Given url WSC_CSS_URL + 'ReadTasks'
        * configure headers  = WSC_HTTP_HEADERS
		And param param_str_customerNumber = str_customerNumber
		And param param_STR_USERID = STR_USERID
		And param param_str_createdAfter = str_createdAfter
		And param param_str_createdBefore = str_createdBefore
		And param param_str_status = str_status
			
		When method get
		* string responseStr = response
		* karate.write(responseStr, '../src/test/java/app/api/reload/services-css/ReadTasks/ReadTasks-no-tasks-response 24.2.txt')
		* print response
		Then status 200
		
