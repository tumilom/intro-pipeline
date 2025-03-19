#@ignore
@cc_claimsummaries
Feature: ccapi claim-summaries
    Background: 
		# For a given customer, get claim summaries for a claim
		# For a unit testing uncomment line below, update customerNo and claimNumber value, remove @ignore
		#* def customerNo = '20104040'
		#* def claimNumber = '10060066384'		
		
    Scenario: <customerNo> <claimNumber> claim-summaries
		* def path = '/customers/<path-customerNo>/claim-summaries'
		* replace path.path-customerNo = customerNo
		
        Given url CONTACT_CENTRE_API_URL + path
		
        * configure headers = JSONAPI_HTTP_HEADERS_CC	
		 
		When method get
		* print response	
		Then status 200
		