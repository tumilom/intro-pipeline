@ignore
@gc_claim-summaries-filterby-staff-deceased
Feature: gcapi claim-summaries

    Background: 
		# For a given claim, claim-summaries filter by staff and deceased
		
				
    Scenario: <claimNumber> claim-summaries
		* def path = '/claim-summaries'				
				
       Given url GC_API_URL + path			
		* configure headers = GET_HTTP_HEADER
			And header userid = gcUserId	
			And param _isStaff = staffFilter
			And param _isDeceased = deceasedFilter
		 
		When method get
		* print response
		
		Then status 200