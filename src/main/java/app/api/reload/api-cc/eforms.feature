@ignore
@cc_eforms
Feature: ccapi eforms

    Background: 
		# For a given claim, get eforms 
		# For a unit testing uncomment line below, update  claimNumber value, remove @ignore		
		#* def claimNumber = '10060066376'
		
    Scenario: <claimNumber> medical-codes
		* def path = '/cases/<path-claimNumber>/eforms'		
		* replace path.path-claimNumber = claimNumber
		
		Given url CONTACT_CENTRE_API_URL + path
		
        * configure headers = JSONAPI_HTTP_HEADERS_CC		
		 
		When method get
		* print response
		* def eformName = karate.jsonPath(response, "$.elements[0].name")
		* print eformName		
		Then status 200
		