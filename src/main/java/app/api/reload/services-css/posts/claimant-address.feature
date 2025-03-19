@createClaimantAddress
Feature:
    Background:
        * def configParam = 'CreateOrUpdateClaimantAddress'
	
    Scenario: Create claimant address for <eosCustomerNo>

        Given url WSC_CSS_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        * def payload = read('classpath:app/api/reload/services-css/posts/claimant-address-add.xml') 
        And request payload
        When method post
        * print response
        Then status 200
         Then match response count(/WSUpdateResponse/oid-list/oid[   starts-with(text(),'PE:11539:')  ]) == 1
         Then match response count(/WSUpdateResponse/oid-list/oid[   starts-with(text(),'PE:11536:')  ]) == 1