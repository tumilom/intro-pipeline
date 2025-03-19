@ignore
@cc_add-planphase-goals-actions
Feature: ccapi add add-planphase-goals-actions

    Background: 		
		# For a unit testing uncomment line below, update value, remove @ignore		
				
		* def JavaApp = Java.type('app.App');
		* def startDate = JavaApp.daysFromNow('0','yyyy-MM-dd')	
		* def endDate = JavaApp.daysFromNow('20','yyyy-MM-dd')	
		* def reviewDate = JavaApp.daysFromNow('22','yyyy-MM-dd')			
		
		#* def claimNumber = '10060066370'
		#* def recoveryPlanId = '10060066370-RP'
		
    Scenario:  ccapi add add-activities
		* def path = '/claims/<path-claimNumber>/recovery-plans/<path-recoveryPlanId>/plan-phases/<path-planPhaseId>/goals/<path-goalId>/actions'
		* def body = read('classpath:app/api/reload/api-cc/posts/add-actions.json')		
		
		* replace path.path-claimNumber = claimNumber
		* replace path.path-recoveryPlanId = recoveryPlanId
		* replace path.path-planPhaseId = planPhaseId
		* replace path.path-goalId = goalId
		
		Given url CONTACT_CENTRE_API_URL + path		
        * configure headers = JSONAPI_HTTP_HEADERS_CC	
		
		And request body
        When method post
        Then status 201
