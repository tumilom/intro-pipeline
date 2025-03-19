@UpdateOrCreateVendor
Feature: Setup UpdateOrCreateVendor 
    Background: 
        * def JavaApp = Java.type('app.App')
		
    Scenario: UpdateOrCreateVendor
        Given url WSC_CC_URL + 'UpdateOrCreateVendor'
        * configure headers  = WSC_HTTP_HEADERS
        * def dateNow = JavaApp.daysFromNow('0') 
		* def payload = read('classpath:app/api/reload/services-cc/posts/UpdateOrCreateVendor-request.xml') 		
        
        # * karate.pause() is only applicable in gatling sessions
        * karate.pause(JavaApp.nextIntRange(2000,3000)) 
        
        And request payload
        When method post
		* print response
		
		Then match response count(/WSUpdateResponse/oid-list/oid) == 1
		Then match response /WSUpdateResponse/additional-data-set/additional-data/name == ['SERVICE_RESPONSE_CODE','CUSTOMER_NUMBER']
		Then match response /WSUpdateResponse/additional-data-set/additional-data[./name/text()='SERVICE_RESPONSE_CODE']/value == '200'
		* def customerNo  = karate.xmlPath(response , "/WSUpdateResponse/additional-data-set/additional-data[./name/text()='CUSTOMER_NUMBER']/value")
		* print "Vendor: " + customerNo
		
        Then status 200
		
       
