@ignore
@cc_claimsummaries-basic-flow
Feature: ccapi claim-summaries
    Background: 
		# For a given customer, get claim summaries for a claim
		# For a unit testing uncomment line below, update customerNo and claimNumber value, remove @ignore
		* def customerNo = '20106136'
		* def claimNumber = '10060068482'		
		* configure logPrettyResponse = true
		
    Scenario: <customerNo> <claimNumber> claim-summaries
		* def path = '/customers/<path-customerNo>/claim-summaries/<path-claimNumber>'
		* replace path.path-customerNo = customerNo
		* replace path.path-claimNumber = claimNumber
		
        Given url CONTACT_CENTRE_API_URL + path
		
        * configure headers = JSONAPI_HTTP_HEADERS_CC	
		 
		When method get
		* string responseStr = karate.pretty(response)
		* karate.write(responseStr, '../src/test/java/app/api/reload/api-cc/claim-summaries/Read-claim-summaries-basic-flow-response 24.2.txt')
		* print response
		* def acc45Number = karate.jsonPath(response, "$.id")
		* print acc45Number		
		* def accidentDate = karate.jsonPath(response, "$.eventDate")
		* print accidentDate	
		Then status 200
		
		