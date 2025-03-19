@ignore
@UpdateOrCreateVendor-basic-flow
Feature: Setup UpdateOrCreateVendor 
    Background: 
       
    Scenario: UpdateOrCreateVendor
        Given url WSC_CC_URL + 'UpdateOrCreateVendor'
        * configure headers  = WSC_HTTP_HEADERS
		* def payload = read('classpath:app/api/reload/services-cc/posts/UpdateOrCreateVendor/UpdateOrCreateVendor-restore.xml') 		
        
        And request payload
        When method post
		* print response
		
		Then match response count(/WSUpdateResponse/oid-list/oid) == 1
		Then match response /WSUpdateResponse/additional-data-set/additional-data/name == ['SERVICE_RESPONSE_CODE','CUSTOMER_NUMBER']
		Then match response /WSUpdateResponse/additional-data-set/additional-data[./name/text()='SERVICE_RESPONSE_CODE']/value == '200'
		* def customerNo  = karate.xmlPath(response , "/WSUpdateResponse/additional-data-set/additional-data[./name/text()='CUSTOMER_NUMBER']/value")
		* print customerNo
		
        Then status 200
		
       
