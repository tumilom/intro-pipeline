@ignore
@gc_claim-summaries-filterby-incurreddate
Feature: gcapi claim-summaries

    Background: 
		# For a given claim, claim-summaries filter by incurred dates
		
		#* def claimNumber = '10060066376'
		#* def extensionFilter = '_Claim._extClaimTypeMentalInjury._eq.true'
		
    Scenario: <claimNumber> claim-summaries
		* def path = '/claim-summaries'				
				
       Given url GC_API_URL + path			
		* configure headers = GET_HTTP_HEADER
			And header userid = gcUserId	
			And param incurredDate._ge = datesFilterFrom
			And param incurredDate._le = datesFilterTo
		 
		When method get
		* print response
		
		Then status 200