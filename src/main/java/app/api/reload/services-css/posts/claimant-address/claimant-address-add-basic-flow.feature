@ignore
@claimant-address-add-basic-flow
Feature:
    Background:
        * def configParam = 'CreateOrUpdateClaimantAddress'
		* def eosCustomerNo = '20103051'

    Scenario: Create claimant address for <eosCustomerNo>

        Given url WSC_CSS_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        * def payload = read('classpath:app/api/reload/services-css/posts/claimant-address/claimant-address-add-basic-flow.xml') 
        And request payload
        When method post
        * print response
        Then status 200