@ignore
@cc_sub-cases
Feature: ccapi 

    Background: 
		# For a given claim, retrieve sub cases
		# For a unit testing uncomment line below, 
		#* def claimNumber = '10060066370'
		
		
    Scenario: sub-cases
		* def path = '/cases/<path-claimNumber>/sub-cases'
		* replace path.path-claimNumber = claimNumber		
		
		Given url CONTACT_CENTRE_API_URL + path		
        * configure headers = JSONAPI_HTTP_HEADERS_CC			
		 
		When method get
		* print response	
			
		Then status 200		
 