@ignore
@cc_actual-earnings
Feature: ccapi actual-earnings

    Background: 
		# For a given claim, get actual-earnings
		# For a unit testing uncomment line below, update  claimNumber value, remove @ignore		
		#* def claimNumber = '10060066376'
		
    Scenario: <claimNumber> medical-codes
		* def path = '/cases/<path-claimNumber>/occupations/<path-occupationId>/actual-earnings'		
		* replace path.path-claimNumber = claimNumber
		* replace path.path-occupationId = occupationId
		
		Given url CONTACT_CENTRE_API_URL + path
		
        * configure headers = JSONAPI_HTTP_HEADERS_CC		
		 
		When method get
		* print response
		
		Then status 200
		