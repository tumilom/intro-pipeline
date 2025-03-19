@ignore
@claimant-address-add-inv-addtype
Feature:
    Background:
        * def configParam = 'CreateOrUpdateClaimantAddress'
		* def eosCustomerNo = '20103051'

    Scenario: Create claimant address for <eosCustomerNo>

        Given url WSC_CSS_URL +  configParam
        * configure headers  = WSC_HTTP_HEADERS
        * def payload = read('classpath:app/api/reload/services-css/posts/claimant-address/claimant-address-add-inv-addtype.xml') 
        And request payload
        When method post
		* string responseStr = response
		* karate.write(responseStr, '../src/test/java/app/api/reload/services-css/posts/claimant-address/claimant-address-add-inv-addtype-response 24.2.txt')
        * print response
        Then status 200