@ignore
@UpdateOrCreateProvider-basic-flow
Feature: Setup UpdateOrCreateProviderv1 
    Background: 
        #Update a provider with the following details (business & alternate address, contact details like phone, fax, vacational classification and #basic information details.
    Scenario: UpdateOrCreateProviderv1
        Given url WSC_CC_URL + 'UpdateOrCreateProviderv1'
        * configure headers  = WSC_HTTP_HEADERS
		* def payload = read('classpath:app/api/reload/services-cc/posts/UpdateOrCreateProvider/UpdateOrCreateProvider-basic-flow-request.xml') 		
        And request payload
        When method post
		* print response
		
		Then match response count(/WSUpdateResponse/oid-list/oid) == 1
		Then match response /WSUpdateResponse/additional-data-set/additional-data/name == ['SERVICE_RESPONSE_CODE','CUSTOMER_NUMBER']
		Then match response /WSUpdateResponse/additional-data-set/additional-data[./name/text()='SERVICE_RESPONSE_CODE']/value == '200'
		* def customerNo  = karate.xmlPath(response , "/WSUpdateResponse/additional-data-set/additional-data[./name/text()='CUSTOMER_NUMBER']/value")
		* print customerNo
		Then match response /WSUpdateResponse/additional-data-set/additional-data[./name/text()='CUSTOMER_NUMBER']/value == providerId
        Then status 200
		
       
