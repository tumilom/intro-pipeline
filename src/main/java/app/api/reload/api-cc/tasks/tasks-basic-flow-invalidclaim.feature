#@ignore
@cc_tasks-invalidclaim-flow
Feature: ccapi tasks

    Background: 
		# For a given claim, get eforms 
		# For a unit testing uncomment line below, update  claimNumber value, remove @ignore		
		* def claimNumber = '10960078986'
		* def str_filter = 'tasksOnly'
		
    Scenario: <claimNumber> medical-codes
		* def path = '/cases/<path-claimNumber>/activities'		
		* replace path.path-claimNumber = claimNumber
		
		Given url CONTACT_CENTRE_API_URL + path
		
        * configure headers = JSONAPI_HTTP_HEADERS_CC		
		And param _filter = str_filter
		 
		When method get
		* string responseStr = karate.pretty(response)
		* karate.write(responseStr, '../src/main/java/app/api/reload/api-cc/tasks/Get-tasks-invalidclaim-flow-response 24.7.txt')
		* print response
		Then status 200
		