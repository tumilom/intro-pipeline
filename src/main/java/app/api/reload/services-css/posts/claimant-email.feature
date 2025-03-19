@createClaimantEmail
Feature:
    Background:
        * def configParam = 'CreateOrUpdateClaimantEmail'

    Scenario: Create claimant email for <eosCustomerNo>

        Given url WSC_CSS_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        * def email =  'karatePerson' + eosCustomerNo +'.email@icloud.com'
        * def payload = read('classpath:app/api/reload/services-css/posts/claimant-email-add.xml') 
        And request payload
        When method post
        * print response
        Then status 200
        #update is 2 OIDs Add is 3 OIDs
        Then match response count(/WSUpdateResponse/oid-list/oid[   starts-with(text(),'PE:11749:')  ]) == 1
        Then match response count(/WSUpdateResponse/oid-list/oid[   starts-with(text(),'PE:11514:')  ]) == 1
        