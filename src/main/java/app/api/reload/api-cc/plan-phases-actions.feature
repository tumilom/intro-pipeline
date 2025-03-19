@ignore
@cc_plan-phases-actions
Feature: ccapi 

    Background: 
		# For a given claim, get plan-phases
		# For a unit testing uncomment line below, 
		#* def claimNumber = '10060066370'
		#* def recoveryPlanId = '10060066370-RP'
		
    Scenario: client-goals
		* def path = '/claims/<path-claimNumber>/recovery-plans/<path-recoveryPlanId>/plan-phases/<path-planphaseId>/goals/<path-goalId>/actions'		
		* replace path.path-claimNumber = claimNumber
		* replace path.path-recoveryPlanId = recoveryPlanId
		* replace path.path-planphaseId = planPhaseId
		* replace path.path-goalId = goalId
		
		Given url CONTACT_CENTRE_API_URL + path
		
        * configure headers = JSONAPI_HTTP_HEADERS_CC		
		 
		When method get
		* print response	
		* def actionId = karate.jsonPath(response, "$.elements[0].id")
		* print actionId		
		Then status 200
		
		
 