@ignore
@claimant-address-add-Australia
Feature:
    Background:
        * def configParam = 'CreateOrUpdateClaimantAddress'
		* def eosCustomerNo = '20103045'

    Scenario: Create claimant address for <eosCustomerNo>

        Given url WSC_CSS_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        * def payload = read('classpath:app/api/reload/services-css/posts/claimant-address/claimant-address-add-Australia.xml') 
        And request payload
        When method post
        * print response
        Then status 200