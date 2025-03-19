@ignore
@cc_edit-planphase-goals-action
Feature: ccapi add add-planphase-goals

    Background: 		
		# For a unit testing uncomment line below, update value, remove @ignore		
				
		* def JavaApp = Java.type('app.App');
		* def startDate = JavaApp.daysFromNow('0','yyyy-MM-dd')	
		* def endDate = JavaApp.daysFromNow('20','yyyy-MM-dd')	
		* def reviewDate = JavaApp.daysFromNow('21','yyyy-MM-dd')				
		
		#* def claimNumber = '10060066370'
		#* def recoveryPlanId = '10060066370-RP'
		
    Scenario:  ccapi add add-activities
		* def path = '/claims/<path-claimNumber>/recovery-plans/<path-recoveryPlanId>/plan-phases/<path-planPhaseId>/goals/<path-goalId>/actions/<path-actionId>/edit'
		* def body = read('classpath:app/api/reload/api-cc/posts/edit-actions.json')		
		
		* replace path.path-claimNumber = claimNumber
		* replace path.path-recoveryPlanId = recoveryPlanId
		* replace path.path-planPhaseId = planPhaseId
		* replace path.path-goalId = goalId
		* replace path.path-actionId = actionId
		
		Given url CONTACT_CENTRE_API_URL + path		
        * configure headers = JSONAPI_HTTP_HEADERS_CC	
		
		And request body
        When method post
        Then status 200
		