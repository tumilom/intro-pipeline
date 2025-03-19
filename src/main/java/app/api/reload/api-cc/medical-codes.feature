@ignore
@cc_medicalCodes
Feature: ccapi medical-codes

    Background: 
		# For a given claim, get medical codes 
		# For a unit testing uncomment line below, update  claimNumber value, remove @ignore		
		#* def claimNumber = '10060066376'
		
    Scenario: <claimNumber> medical-codes
		* def path = '/claims/<path-claimNumber>/medical-codes'		
		* replace path.path-claimNumber = claimNumber
		
		Given url CONTACT_CENTRE_API_URL + path
		
        * configure headers = JSONAPI_HTTP_HEADERS_CC		
		 
		When method get
		* print response
		* def codeId = karate.jsonPath(response, "$.elements[0].codeId")
		* print codeId		
		Then status 200
		