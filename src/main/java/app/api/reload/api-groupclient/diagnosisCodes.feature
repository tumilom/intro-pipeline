@ignore
@gc_diagnosisCodes
Feature: ccapi diagnosisCodes

    Background: 
		# For a given claim, diagnosisCodes
		
		#* def claimNumber = '10060066376'
		
    Scenario: <claimNumber> diagnosisCodes
		* def path = '/claims/<path-claimNumber>/medicalDetails/diagnosisCodes'		
		* replace path.path-claimNumber = claimNumber
				
       Given url GC_API_URL + path			
		* configure headers = GET_HTTP_HEADER
			And header userid = gcUserId		
		 
		When method get
		* print response
		
		Then status 200
		