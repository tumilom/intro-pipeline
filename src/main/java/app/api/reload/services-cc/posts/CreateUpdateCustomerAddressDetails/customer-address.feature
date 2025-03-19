@createClaimantAddress
Feature:
    Background:
        * def configParam = 'CreateUpdateCustomerAddressDetails'
	
    Scenario: Update customer address for <eosCustomerNo>

        Given url WSC_CC_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        * def payload = read('classpath:app/api/reload/services-cc/posts/CreateUpdateCustomerAddressDetails/CreateUpdateCustomerAddressDetails-request.xml') 
        And request payload
        When method post
        * print response
        Then status 200
        Then match response count(/WSUpdateResponse/oid-list/oid[   starts-with(text(),'PE:11539:')  ]) == 1