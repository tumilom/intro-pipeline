@ignore
@gc_actual-earnings
Feature: gcapi actual-earnings

    Background: 
		# For a given claim, get actual-earnings
		# For a unit testing uncomment line below, update  claimNumber value, remove @ignore		
		#* def benefitCaseNo = '10060066376'
		
    Scenario: 
		* def path = '/cases/<path-benefitCaseNo>/occupations/<path-occupationId>/actual-earnings'		
		* replace path.path-benefitCaseNo = benefitCaseNo
		* replace path.path-occupationId = occupationId
		
	Given url GC_API_URL + path			
		* configure headers = GET_HTTP_HEADER
			And header userid = gcUserId			
		 
		When method get
		* print response
		
		Then status 200
		