@ignore
@css_ReadTasks-basic-flow
Feature: Read task
    Background: 
		# For get tasks for party
		# For a unit testing uncomment lines below, update claimNumber value, remove @ignore
		* def str_customerNumber = '20099132'
		* def STR_USERID = 'YANGS'
		* def str_createdAfter = '20240601'
		* def str_createdBefore = '20241230'
		* def str_status = '928000'

		
    Scenario: Case Owner
        Given url WSC_CSS_URL +'ReadTasks'
        * configure headers  = WSC_HTTP_HEADERS
		And param PARAM_STR_CUSTOMERNO = str_customerNumber
		And param PARAM_STR_USERID = STR_USERID
		And param param_str_createdafter = str_createdAfter
		And param param_str_createdbefore = str_createdBefore
		And param PARAM_STR_STATUS = str_status
			
		When method get
		* string responseStr = response
		* karate.write(responseStr, '../src/test/java/app/api/reload/services-css/ReadTasks/ReadTasks-basic-flow-response 24.2.txt')
		* print response
		Then status 200
		
