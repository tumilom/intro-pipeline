@ignore
@gc_claim-summaries-filterby-status-workrel
Feature: gcapi claim-summaries

    Background: 
		# For a given claim, claim-summaries filter by status and event work related
		
				
    Scenario: <claimNumber> claim-summaries
		* def path = '/claim-summaries'				
				
       Given url GC_API_URL + path			
		* configure headers = GET_HTTP_HEADER
			And header userid = gcUserId	
			And param staus.name = statusFilter
			And param eventWorkRelated = eventWorkRelatedFilter
		 
		When method get
		* print response
		
		Then status 200