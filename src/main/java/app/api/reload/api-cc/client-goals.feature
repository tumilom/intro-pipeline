@ignore
@cc_client-goals
Feature: ccapi 

    Background: 
		# For a given claim, get client goals 
		# For a unit testing uncomment line below, 
		#* def claimNumber = '10060066370'
		#* def recoveryPlanId = '10060066370-RP'
		
    Scenario: client-goals
		* def path = '/claims/<path-claimNumber>/recovery-plans/<path-recoveryPlanId>/client-goals'		
		* replace path.path-claimNumber = claimNumber
		* replace path.path-recoveryPlanId = recoveryPlanId
		
		Given url CONTACT_CENTRE_API_URL + path
		
        * configure headers = JSONAPI_HTTP_HEADERS_CC		
		 
		When method get
		* print response	
		* def clientgoalId = karate.jsonPath(response, "$.elements[0].id")
		* print clientgoalId				
		Then status 200
		
 