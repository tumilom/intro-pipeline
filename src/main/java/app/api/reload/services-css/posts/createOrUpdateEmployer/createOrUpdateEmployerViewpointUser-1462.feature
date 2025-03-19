#@ignore
@createOrUpdateEmployerViewpointUser1462
Feature:
    Background: 
        * def JavaApp = Java.type('app.App');
		
    Scenario: 
        * def url_createuser = WS_CSS_REST_URL + '/rest/externalUserProvisioningService/createOrUpdateEmployerViewpointUser'
		Given url url_createuser
        * configure headers  = WS_HTTP_HEADERS_REST

        * def employerId = 'CN135780D'
		* def userIdToCreate = '1103BEA'
		* def fullName = 'BlueBerry@Farm'
		* def payload = read('classpath:app/api/reload/services-css/posts/createOrUpdateEmployer/createOrUpdateEmployerViewpointUser-1462-request.xml')        
		
        And request payload
        When method post
		* print response
        Then status 200
		Then match response count(/CreateOrUpdateEmployerViewpointUserResponse/result/userOID) == 1				
       

   
