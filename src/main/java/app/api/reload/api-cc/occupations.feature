@ignore
@cc_occupations
Feature: ccapi occupations

    Background: 
		# For a given claim, get occupations
		# For a unit testing uncomment line below, update  claimNumber value, remove @ignore		
		#* def claimNumber = '10060066376'
		
    Scenario: <claimNumber> medical-codes
		* def path = '/cases/<path-claimNumber>/occupations'		
		* replace path.path-claimNumber = claimNumber
		
		Given url CONTACT_CENTRE_API_URL + path
		
        * configure headers = JSONAPI_HTTP_HEADERS_CC		
		 
		When method get
		* print response
		* def occOid = karate.jsonPath(response, "$.elements[0].id")
		* print occOid
		
		Then status 200
		