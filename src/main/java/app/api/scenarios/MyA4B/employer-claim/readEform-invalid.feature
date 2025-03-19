@ignore
@gc_readEform-invalid
Feature: ccapi readEform

    Background: 
		# For a given claim, readEform
		
		#* def claimNumber = '10060066376'
		
    Scenario: <claimNumber> readEform
		* def path = '/cases/<path-claimNumber>/eforms/<path-eformId>/readEform'		
		* replace path.path-claimNumber = claimNumber
		* replace path.path-eformId = eformId
				
       Given url GC_API_URL + path			
		* configure headers = GET_HTTP_HEADER
			And header userid = gcUserId		
		 
		When method get
		* print response
		
		Then status 401
		