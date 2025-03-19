@ignore
@cc_add-outcome-measures
Feature: ccapi add add-outcome-measures

    Background: 		
		# For a unit testing uncomment line below, update value, remove @ignore		
				
		#* def claimNumber = '10060066370'
		#* def recoveryPlanId = '10060066370-RP'
		
    Scenario:  ccapi add add-activities
		* def path = '/claims/<path-claimNumber>/recovery-plans/<path-recoveryPlanId>/outcome-measures'
		* def body = read('classpath:app/api/reload/api-cc/posts/add-outcome-measures.json')		
		
		* replace path.path-claimNumber = claimNumber
		* replace path.path-recoveryPlanId = recoveryPlanId
		
		Given url CONTACT_CENTRE_API_URL + path		
        * configure headers = JSONAPI_HTTP_HEADERS_CC	
		
		And request body
        When method post
        Then status 201
		