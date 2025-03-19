@ignore
@gc_documents-invalid
Feature: ccapi documents

    Background: 
		# For a given claim, documents
		
		#* def claimNumber = '10060066376'
		
    Scenario: <claimNumber> documents
		* def path = '/cases/<path-claimNumber>/documents'		
		* replace path.path-claimNumber = claimNumber
				
       Given url GC_API_URL + path			
		* configure headers = GET_HTTP_HEADER
			And header userid = gcUserId		
		 
		When method get
		* print response
		
		Then status 401
		