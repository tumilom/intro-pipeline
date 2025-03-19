@update-claimant
Feature:
    Background:
        * def configParam = 'UpdateClaimant'
		* def eosCustomerNo = '20135028'

    Scenario: Create claimant address for <eosCustomerNo>

        Given url WSC_CSS_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        * def payload = read('classpath:app/api/reload/services-css/posts/update-claimant.xml') 
        And request payload
        When method post
        * print response
        Then status 200