@ignore
@cc_outcome-measures-single
Feature: ccapi 

    Background: 
		# For a given claim, get client goals 
		# For a unit testing uncomment line below, 
	#	* def claimNumber = '10060066370'
	#	* def recoveryPlanId = '10060066370-RP'
		
    Scenario: client-goals
		* def path = '/claims/<path-claimNumber>/recovery-plans/<path-recoveryPlanId>/outcome-measures/<path-outcomeMeasureId>'		
		* replace path.path-claimNumber = claimNumber
		* replace path.path-recoveryPlanId = recoveryPlanId
		* replace path.path-outcomeMeasureId = outcomeMeasureId		
		
		Given url CONTACT_CENTRE_API_URL + path
		
        * configure headers = JSONAPI_HTTP_HEADERS_CC		
		 
		When method get
		* print response		
		Then status 200
		
 