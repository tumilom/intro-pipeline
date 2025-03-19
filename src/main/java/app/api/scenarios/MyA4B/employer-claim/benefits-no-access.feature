@ignore
@gc_benefits-no-access
Feature: ccapi benefits

    Background: 
		# For a given claim, benefits
		
		#* def claimNumber = '10060066376'
		
    Scenario: <claimNumber> benefits
		* def path = '/claims/<path-claimNumber>/benefits'		
		* replace path.path-claimNumber = claimNumber
				
       Given url GC_API_URL + path			
		* configure headers = GET_HTTP_HEADER
			And header userid = gcUserId		
		 
		When method get
		* print response
		* def wceCaseNo = karate.jsonPath(response, "$[?(@.benefitId =~ /WCE.*/i )].benefitId")
		* print wceCaseNo		
		
		Then status 403
		