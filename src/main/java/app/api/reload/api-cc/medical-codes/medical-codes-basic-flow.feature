@ignore
@cc_medicalCodes-basic-flow
Feature: ccapi medical-codes

    Background: 
		# For a given claim, get medical codes 
		# For a unit testing uncomment line below, update  claimNumber value, remove @ignore		
		* def claimNumber = '10060068410'
		* configure logPrettyResponse = true
		
    Scenario: <claimNumber> medical-codes
		* def path = '/claims/<path-claimNumber>/medical-codes'		
		* replace path.path-claimNumber = claimNumber
		
		Given url CONTACT_CENTRE_API_URL + path
		
        * configure headers = JSONAPI_HTTP_HEADERS_CC		
		 

		When method get
		* string responseStr = karate.pretty(response)
		* karate.write(responseStr, '../src/test/java/app/api/reload/api-cc/medical-codes/Read_medicalCodes-basic-flow-response 24.2.txt')
		* print response
		Then status 200