#@ignore
@gc_occupations
Feature: gcapi occupations

    Background: 
		# For a given claim, get occupations
		# For a unit testing uncomment line below, update  claimNumber value, remove @ignore		
		# * def benefitCaseNo = 'WCE10060066378'
		
    Scenario:
		* def path = '/cases/<path-benefitCaseNumber>/occupations'		
		* replace path.path-benefitCaseNumber = benefitCaseNo
		
		Given url GC_API_URL + path			
		* configure headers = GET_HTTP_HEADER
			And header userid = gcUserId	
		 
		When method get
		* print response
		* def occOid = karate.jsonPath(response, "$.elements[0].id")
		* print occOid
		
		Then status 200
		