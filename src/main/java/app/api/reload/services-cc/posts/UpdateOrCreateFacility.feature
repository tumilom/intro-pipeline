@UpdateOrCreateFacility
Feature: Setup UpdateOrCreateFacility 
    Background: 
        * def JavaApp = Java.type('app.App')
    Scenario: UpdateOrCreateFacility
        Given url WSC_CC_URL + 'UpdateOrCreateFacility'
        * configure headers  = WSC_HTTP_HEADERS
        * def dateNow = JavaApp.daysFromNow('0') 
		* def payload = read('classpath:app/api/reload/services-cc/posts/UpdateOrCreateFacility-request.xml') 		
        
        # * karate.pause() is only applicable in gatling sessions
        * karate.pause(JavaApp.nextIntRange(2000,3000)) 
        
        And request payload
        When method post
		* print response
		
		Then match response count(/WSUpdateResponse/oid-list/oid) == 1
		Then match response /WSUpdateResponse/additional-data-set/additional-data/name == ['SERVICE_RESPONSE_CODE','CUSTOMER_NUMBER']
		Then match response /WSUpdateResponse/additional-data-set/additional-data[./name/text()='SERVICE_RESPONSE_CODE']/value == '200'
		* def customerNo  = karate.xmlPath(response , "/WSUpdateResponse/additional-data-set/additional-data[./name/text()='CUSTOMER_NUMBER']/value")
		* print "Facility: " + customerNo
		
        Then status 200
		
       
