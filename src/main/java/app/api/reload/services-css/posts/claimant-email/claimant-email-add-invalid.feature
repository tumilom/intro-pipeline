@ignore
@claimant-email-add-invalid
Feature:
    Background:
        * def configParam = 'CreateOrUpdateClaimantEmail'
		* def eosCustomerNo = '20135028'

    Scenario: Create claimant email for <eosCustomerNo>

        Given url WSC_CSS_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        
        * def payload = read('classpath:app/api/reload/services-css/posts/claimant-email/claimant-email-add-invalid.xml') 
        And request payload
        When method post
		* string responseStr = response
		* karate.write(responseStr, '../src/test/java/app/api/reload/services-css/posts/claimant-email/claimant-email-add-invalid 24.2.txt')
        * print response
        Then status 200