@ignore
@cc_certification-periods
Feature: ccapi certification-periods

    Background: 
		# For a given claim, get certification-periods
		# For a unit testing uncomment line below, update  claimNumber value, remove @ignore		
		#* def claimNumber = '10060066376'
		
    Scenario: <claimNumber> medical-codes
		* def path = '/claims/<path-claimNumber>/certification-periods'		
		* replace path.path-claimNumber = claimNumber
		
		Given url CONTACT_CENTRE_API_URL + path
		
        * configure headers = JSONAPI_HTTP_HEADERS_CC		
		 
		When method get
		* print response
		
		Then status 200
		