@ignore
@createClaimantPhone-add-invalid
Feature:
    Background:
        * def configParam = 'CreateOrUpdateClaimantPhone'
		* def eosCustomerNo = '99903028'
    Scenario: Create claimant phone for <eosCustomerNo>

        Given url WSC_CSS_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        		
        * def payload = read('classpath:app/api/reload/services-css/posts/claimant-phone/claimant-phone-add-invalid.xml') 
        And request payload
        When method post
		* string responseStr = response
		* karate.write(responseStr, '../src/test/java/app/api/reload/services-css/posts/claimant-phone/createClaimantPhone-add-invalid 24.2.txt')
        * print response
        Then status 200