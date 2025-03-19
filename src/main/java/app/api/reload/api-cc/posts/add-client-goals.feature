@ignore
@cc_add-client-goals
Feature: ccapi add add-client-goals

    Background: 		
		# For a unit testing uncomment line below, update value, remove @ignore		
				
		* def JavaApp = Java.type('app.App');
		* def creationDate = JavaApp.daysFromNow('0','yyyy-MM-dd')		
		* def outcomeDate = JavaApp.daysFromNow('0','yyyy-MM-dd')
		
		#* def claimNumber = '10060066370'
		#* def recoveryPlanId = '10060066370-RP'
		
    Scenario:  ccapi add add-activities
		* def path = '/claims/<path-claimNumber>/recovery-plans/<path-recoveryPlanId>/client-goals'
		* def body = read('classpath:app/api/reload/api-cc/posts/add-client-goals.json')		
		
		* replace path.path-claimNumber = claimNumber
		* replace path.path-recoveryPlanId = recoveryPlanId
		
		Given url CONTACT_CENTRE_API_URL + path		
        * configure headers = JSONAPI_HTTP_HEADERS_CC	
		
		And request body
        When method post
        Then status 201
		