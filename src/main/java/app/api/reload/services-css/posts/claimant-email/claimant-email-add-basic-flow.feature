@ignore
@claimant-email-add-basic-flow
Feature:
    Background:
        * def configParam = 'CreateOrUpdateClaimantEmail'
		* def eosCustomerNo = '20135028'

    Scenario: Create claimant email for <eosCustomerNo>

        Given url WSC_CSS_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        
        * def payload = read('classpath:app/api/reload/services-css/posts/claimant-email/claimant-email-add-basic-flow.xml') 
        And request payload
        When method post
        * print response
        Then status 200