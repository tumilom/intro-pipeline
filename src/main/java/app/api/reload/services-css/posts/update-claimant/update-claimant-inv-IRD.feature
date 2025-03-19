@ignore
@update-claimant-inv-IRD
Feature:
    Background:
        * def configParam = 'UpdateClaimant'
        * def eosCustomerNo = '20135028'

    Scenario: Create claimant address for <eosCustomerNo>

        Given url WSC_CSS_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        * def payload = read('classpath:app/api/reload/services-css/posts/update-claimant/update-claimant-inv-IRD.xml') 
        And request payload
        When method post
		* string responseStr = response
		* karate.write(responseStr, '../src/test/java/app/api/reload/services-css/posts/update-claimant/update-claimant-inv-IRD-response 24.2.txt')
        * print response
        Then status 200