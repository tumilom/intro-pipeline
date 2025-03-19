@ignore
@gc_claim-summaries
Feature: ccapi claim-summaries

    Background: 
		# For a given claim, claim-summaries
		
		#* def claimNumber = '10060066376'		
		
    Scenario: <claimNumber> claim-summaries
		* def path = '/claim-summaries'				
				
       Given url GC_API_URL + path			
		* configure headers = GET_HTTP_HEADER
			And header userid = gcUserId			
		 
		When method get
		* print response
		#* string responseStr = karate.pretty(response)
		#* karate.write(responseStr, '../src/test/java/app/api/reload/api-groupclient/claim-summaries-response 24.2.txt')
		
		Then status 200