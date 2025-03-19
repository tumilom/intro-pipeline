@ignore
@cc_plan-phases-life-areas
Feature: ccapi 

    Background: 
		# For a given claim, get plan-phases life-areas
		# For a unit testing uncomment line below, 
		#* def claimNumber = '10060066370'
		#* def recoveryPlanId = '10060066370-RP'
		
    Scenario: client-goals
		* def path = '/claims/<path-claimNumber>/recovery-plans/<path-recoveryPlanId>/plan-phases/<path-planPhaseId>/life-areas'		
		* replace path.path-claimNumber = claimNumber
		* replace path.path-recoveryPlanId = recoveryPlanId
		* replace path.path-planPhaseId = planPhaseId
		
		Given url CONTACT_CENTRE_API_URL + path
		
        * configure headers = JSONAPI_HTTP_HEADERS_CC		
		 
		When method get
		* print response		
		* def lifeAreaId = karate.jsonPath(response, "$.elements[0].id")
		* print lifeAreaId				
		Then status 200
		
 