@ignore
@cc_sub-cases-recoveryPlans
Feature: ccapi 

    Background: 
		# For a given claim, retrieve recovery plans
		# For a unit testing uncomment line below, 
		#* def claimNumber = '10060066370'
		* def casetypeFilter = 'recoveryPlans'		
		
    Scenario: sub-cases
		* def path = '/cases/<path-claimNumber>/sub-cases'
		* replace path.path-claimNumber = claimNumber		
		
		Given url CONTACT_CENTRE_API_URL + path		
        * configure headers = JSONAPI_HTTP_HEADERS_CC	
		And param _filter = casetypeFilter		
		 
		When method get
		* print response	
		* def rpCaseNo = karate.jsonPath(response, "$.elements[0].id")
		* print rpCaseNo		
		Then status 200		
 