@ignore
@gc_readDisabilityDetails-invalid
Feature: ccapi readDisabilityDetails

    Background: 
		# For a given claim, readDisabilityDetails
		
		#* def claimNumber = '10060066376'
		
    Scenario: <claimNumber> readDisabilityDetails
		* def path = '/claims/<path-claimNumber>/readDisabilityDetails'		
		* replace path.path-claimNumber = claimNumber
				
       Given url GC_API_URL + path			
		* configure headers = GET_HTTP_HEADER
			And header userid = gcUserId		
		 
		When method get
		* print response
		
		Then status 401
		