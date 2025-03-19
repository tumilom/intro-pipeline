@createClaimantPhone
Feature:
    Background:
        * def configParam = 'CreateOrUpdateClaimantPhone'

    Scenario: Create claimant phone for <eosCustomerNo>

        Given url WSC_CSS_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        * def suffixVal = eosCustomerNo.substring(eosCustomerNo.length -5,eosCustomerNo.length)
        * def payload = read('classpath:app/api/reload/services-css/posts/claimant-phone-add.xml') 
        * replace payload.${eosCustomerNoSuffix} = suffixVal
        And request payload
        When method post
        * print response
        Then status 200
        #update is 2 OIDs Add is 3 OIDs
        Then match response count(/WSUpdateResponse/oid-list/oid[   starts-with(text(),'PE:11749:')  ]) == 1
        Then match response count(/WSUpdateResponse/oid-list/oid[   starts-with(text(),'PE:11537:')  ]) == 1
       