@ignore
@cc_tasks-basic-flow
Feature: ccapi tasks

    Background: 
		# For a given claim, get eforms 
		# For a unit testing uncomment line below, update  claimNumber value, remove @ignore		
		* def claimNumber = '10060068785'
		* def str_filter = 'tasksOnly'
		
    Scenario: <claimNumber> medical-codes
		* def path = '/cases/<path-claimNumber>/activities'		
		* replace path.path-claimNumber = claimNumber
		
		Given url CONTACT_CENTRE_API_URL + path
		
        * configure headers = JSONAPI_HTTP_HEADERS_CC		
		And param _filter = str_filter
		 
		When method get
		* string responseStr = karate.pretty(response)
		* karate.write(responseStr, '../src/test/java/app/api/reload/api-cc/tasks/Read-tasks-basic-flow-response 24.2.txt')
		* print response
		Then status 200
		