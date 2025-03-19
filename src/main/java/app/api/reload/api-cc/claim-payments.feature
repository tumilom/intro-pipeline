@ignore
@cc_claim-payments
Feature: ccapi claim-payments

    Background: 
		# For a given claim, get claim-payments
		# For a unit testing uncomment line below, update  claimNumber value, remove @ignore		
		#* def claimNumber = '10060066376'
		
    Scenario: <claimNumber> medical-codes
		* def path = '/claims/<path-claimNumber>/claim-payments'		
		* replace path.path-claimNumber = claimNumber
		
		Given url CONTACT_CENTRE_API_URL + path
		
        * configure headers = JSONAPI_HTTP_HEADERS_CC		
		 
		When method get
		* print response
		
		Then status 200
		