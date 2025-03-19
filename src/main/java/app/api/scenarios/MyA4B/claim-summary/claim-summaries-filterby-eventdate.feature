@ignore
@gc_claim-summaries-filterby-eventdate
Feature: gcapi claim-summaries

    Background: 
		# For a given claim, claim-summaries filter by event dates
		
				
    Scenario: <claimNumber> claim-summaries
		* def path = '/claim-summaries'				
				
       Given url GC_API_URL + path			
		* configure headers = GET_HTTP_HEADER
			And header userid = gcUserId	
			And param eventDate._ge = datesFilterFrom
			And param eventDate._le = datesFilterTo
		 
		When method get
		* print response
		
		Then status 200