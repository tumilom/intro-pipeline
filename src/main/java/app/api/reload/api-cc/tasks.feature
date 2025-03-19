#@ignore
@cc_tasks
Feature: ccapi tasks

    Background: 
		# For a given claim, get tasks 
		# For a unit testing uncomment line below, update  claimNumber value, remove @ignore		
		#* def claimNumber = '10060068785'
		* def str_filter = 'tasksOnly'
		* def status_filter = 'Open'
		
    Scenario: <claimNumber> activities - tasksOnly
		* def path = '/cases/<path-claimNumber>/activities'		
		* replace path.path-claimNumber = claimNumber
		
		Given url CONTACT_CENTRE_API_URL + path
		
        * configure headers = JSONAPI_HTTP_HEADERS_CC		
		And param _filter = str_filter
		And param status.name = status_filter
		
		When method get
		* print response
		* def allTaskNames = karate.jsonPath(response, ".elements[*].workType")
		* print "All task names: " +allTaskNames	
		
		Then status 200
		