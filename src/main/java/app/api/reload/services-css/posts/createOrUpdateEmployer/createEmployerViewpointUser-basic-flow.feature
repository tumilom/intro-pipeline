@ignore
@createEmployerViewpointUser-basic-flow
Feature:
    Background: 
        * def JavaApp = Java.type('app.App');
		
    Scenario:
        * def url_createuser = WS_CSS_REST_URL + '/rest/externalUserProvisioningService/createOrUpdateEmployerViewpointUser'
		Given url url_createuser
        * configure headers  = WS_HTTP_HEADERS_REST
		
		* def employerId = 'SY0000002E'
		* def eosGCUserId = 'GC-SY0000004E'
		
		* def payload = read('classpath:app/api/reload/services-css/posts/createOrUpdateEmployer/createOrUpdateEmployerViewpointUser-basic-flow-request.xml')        
		
        And request payload
        When method post
		* string responseStr = karate.pretty(response)
		* karate.write(responseStr, '../src/test/java/app/api/reload/services-css/posts/createOrUpdateEmployer/createEmployerViewpointUser-basic-flow-basic-flow-response 24.2.txt')
		* print response
        Then status 200
		Then match response count(/CreateOrUpdateEmployerViewpointUserResponse/result/userOID) == 1				
       

   
