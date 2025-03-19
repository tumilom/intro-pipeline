@ignore
@cc_customer-identifier
Feature: ccapi customer-identifier

    Background: 
		# For a given claim, get customer-identifier
		# For a unit testing uncomment line below, update  claimNumber value, remove @ignore		
		#* def claimNumber = '10060066376'
		
    Scenario: <claimNumber> customer-identifier
		* def path = '/cases/<path-claimNumber>/customer-identifier'		
		* replace path.path-claimNumber = claimNumber
		
		Given url CONTACT_CENTRE_API_URL + path
		
        * configure headers = JSONAPI_HTTP_HEADERS_CC		
		 
		When method get
		* print response		
		
		Then status 200
		