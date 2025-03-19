@ignore
@UpdateOrCreateFacility-basic-flow
Feature: Setup UpdateOrCreateFacility 
    Background: 
		#Update a facility with the information (business & alternate(AU) address, contact details, point of contact detail and basic information)
		
    Scenario: UpdateOrCreateFacility
        Given url WSC_CC_URL + 'UpdateOrCreateFacility'
        * configure headers  = WSC_HTTP_HEADERS
		* def payload = read('classpath:app/api/reload/services-cc/posts/UpdateOrCreateFacility/UpdateOrCreateFacility-restore.xml') 		
        
        And request payload
        When method post
		* print response
		
		Then match response count(/WSUpdateResponse/oid-list/oid) == 1
		Then match response /WSUpdateResponse/additional-data-set/additional-data/name == ['SERVICE_RESPONSE_CODE','CUSTOMER_NUMBER']
		Then match response /WSUpdateResponse/additional-data-set/additional-data[./name/text()='SERVICE_RESPONSE_CODE']/value == '200'
		* def customerNo  = karate.xmlPath(response , "/WSUpdateResponse/additional-data-set/additional-data[./name/text()='CUSTOMER_NUMBER']/value")
		* print customerNo
		
        Then status 200
		
       
