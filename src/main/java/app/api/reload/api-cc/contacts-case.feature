@ignore
@cc_contacts-case
Feature: ccapi contacts case
    Background: 
		# get a list of contacts				
		
    Scenario: 
		* def path = '/cases/<path-caseNo>/contacts'
		* replace path.path-caseNo = caseNo
		
        Given url CONTACT_CENTRE_API_URL + path
		
        * configure headers = JSONAPI_HTTP_HEADERS_CC		
		 
		When method get
		* print response		
		Then status 200
		
		* def allContactIds = karate.jsonPath(response, "$..id")
		* print "allContactIds: " + allContactIds
		