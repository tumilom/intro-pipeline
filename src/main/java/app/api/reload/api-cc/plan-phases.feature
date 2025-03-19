@ignore
@cc_plan-phases
Feature: ccapi 

    Background: 
		# For a given claim, get plan-phases
		# For a unit testing uncomment line below, 
		#* def claimNumber = '10060066449'
		#* def recoveryPlanId = '10060066449-RP'
		
    Scenario: client-goals
		* def path = '/claims/<path-claimNumber>/recovery-plans/<path-recoveryPlanId>/plan-phases'		
		* replace path.path-claimNumber = claimNumber
		* replace path.path-recoveryPlanId = recoveryPlanId
		
		Given url CONTACT_CENTRE_API_URL + path
		
        * configure headers = JSONAPI_HTTP_HEADERS_CC		
		 
		When method get
		* print response	
		* def planPhaseId = karate.jsonPath(response, "$.elements[0].id")
		* print planPhaseId		
		Then status 200
		
 