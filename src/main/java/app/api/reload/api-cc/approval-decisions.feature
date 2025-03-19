@ignore
@cc_approvalDecisions
Feature: ccapi approval-decisions
    Background: 
		# For a given claim, get approval-decisions 
		# For a unit testing uncomment line below, update claimNumber value, remove @ignore		
		#* def claimNumber = '10060069873'
		
    Scenario: <claimNumber> approval-decisions
		* def path = '/claims/<path-claimNumber>/approval-decisions'		
		* replace path.path-claimNumber = claimNumber
		
        Given url CONTACT_CENTRE_API_URL + path
		
        * configure headers = JSONAPI_HTTP_HEADERS_CC		
		 
		When method get
		* print response
		* def benefitId = karate.jsonPath(response, "$.elements[0].benefitId")
		* print benefitId		
		Then status 200
		