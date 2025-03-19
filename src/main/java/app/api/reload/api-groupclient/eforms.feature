@ignore
@gc_eforms
Feature: ccapi eforms

    Background: 
		# For a given claim, eforms
		
		#* def claimNumber = '10060066376'
		
    Scenario: <claimNumber> eforms
		* def path = '/cases/<path-claimNumber>/eforms'		
		* replace path.path-claimNumber = claimNumber
				
       Given url GC_API_URL + path			
		* configure headers = GET_HTTP_HEADER
			And header userid = gcUserId		
		 
		When method get
		* print response
		* def eformIds = karate.jsonPath(response, "$..eformId")		
		* def eformId = eformIds[0]
		Then status 200
		