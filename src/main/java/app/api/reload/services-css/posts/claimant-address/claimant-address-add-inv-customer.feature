@ignore
@claimant-address-add-inv-customer
Feature:
    Background:
        * def configParam = 'CreateOrUpdateClaimantAddress'
		* def eosCustomerNo = '99903045'

    Scenario: Create claimant address for <eosCustomerNo>

        Given url WSC_CSS_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        * def payload = read('classpath:app/api/reload/services-css/posts/claimant-address/claimant-address-add-inv-customer.xml') 
        And request payload
        When method post
		* string responseStr = response
		* karate.write(responseStr, '../src/test/java/app/api/reload/services-css/posts/claimant-address/claimant-address-add-inv-customer-response 24.2.txt')
        * print response
        Then status 200