@createOrUpdateEmployerViewpointUser
Feature:
    Background: 
        * def JavaApp = Java.type('app.App');
		
    Scenario: 
        * def url_createuser = WS_CSS_REST_URL + '/rest/externalUserProvisioningService/createOrUpdateEmployerViewpointUser'
		Given url url_createuser
        * configure headers  = WS_HTTP_HEADERS_REST

        * def employerId = 'B5154738E'
		* def eosGCUserId = 'GC-B5154738E'

		* def payload = read('classpath:app/api/reload/services-css/posts/createOrUpdateEmployerViewpointUser-request.xml')        
		
        And request payload
        When method post
		* print response
        Then status 200
		Then match response count(/CreateOrUpdateEmployerViewpointUserResponse/result/userOID) == 1				
       

   
