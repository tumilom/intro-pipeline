@ignore
@cc_plan-phases-goals
Feature: ccapi 

    Background: 
		# For a given claim, get plan-phases
		# For a unit testing uncomment line below, 
		#* def claimNumber = '10060066370'
		#* def recoveryPlanId = '10060066370-RP'
		#* def planPhaseId = 1234
		
    Scenario: client-goals
	* print planPhaseId
		* def path = '/claims/<path-claimNumber>/recovery-plans/<path-recoveryPlanId>/plan-phases/<path-planphaseId>/goals'				
		* replace path.path-claimNumber = claimNumber
		* replace path.path-recoveryPlanId = recoveryPlanId
		* replace path.path-planphaseId = planPhaseId
		
		Given url CONTACT_CENTRE_API_URL + path
		
        * configure headers = JSONAPI_HTTP_HEADERS_CC		
		 
		When method get
		* print response	
		* def planphaseGoalId = karate.jsonPath(response, "$.elements[0].id")
		* print planphaseGoalId			
		Then status 200
		
 