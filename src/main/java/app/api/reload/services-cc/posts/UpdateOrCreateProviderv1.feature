@UpdateOrCreateProviderv1
Feature: Setup UpdateOrCreateProviderv1 
    Background: 
        * def JavaApp = Java.type('app.App')
    Scenario: UpdateOrCreateProviderv1
        Given url WSC_CC_URL + 'UpdateOrCreateProviderv1'
        * configure headers  = WSC_HTTP_HEADERS
        * def dateNow = JavaApp.daysFromNow('0') 
        * def payload = read('classpath:app/api/reload/services-cc/posts/UpdateOrCreateProvider-request.xml') 		
        
        # * karate.pause() is only applicable in gatling sessions
        * karate.pause(JavaApp.nextIntRange(2000,3000)) 
       
        And request payload
        When method post
		* print response
		
		Then match response count(/WSUpdateResponse/oid-list/oid) == 1
		Then match response /WSUpdateResponse/additional-data-set/additional-data/name == ['SERVICE_RESPONSE_CODE','CUSTOMER_NUMBER']
		Then match response /WSUpdateResponse/additional-data-set/additional-data[./name/text()='SERVICE_RESPONSE_CODE']/value == '200'
		* def customerNo  = karate.xmlPath(response , "/WSUpdateResponse/additional-data-set/additional-data[./name/text()='CUSTOMER_NUMBER']/value")
		* print "Provider: " + customerNo
		Then match response /WSUpdateResponse/additional-data-set/additional-data[./name/text()='CUSTOMER_NUMBER']/value == providerId
        Then status 200
		
       
