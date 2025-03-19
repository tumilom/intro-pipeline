@ignore
@claimant-phone-add-international
Feature:
    Background:
        * def configParam = 'CreateOrUpdateClaimantPhone'
		* def eosCustomerNo = '20135028'
    Scenario: Create claimant phone for <eosCustomerNo>

        Given url WSC_CSS_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        		
        * def payload = read('classpath:app/api/reload/services-css/posts/claimant-phone/claimant-phone-add-international.xml') 
        And request payload
        When method post
        * print response
        Then status 200