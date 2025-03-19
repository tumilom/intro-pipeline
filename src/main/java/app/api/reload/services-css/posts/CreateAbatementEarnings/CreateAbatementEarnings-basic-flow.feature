@ignore
@CreateAbatementEarnings-basic-flow

Feature:
    Background:
      
		* def configParam = 'CreateAbatementEarnings'

    Scenario: Create abatement Earnings

        Given url WSC_CSS_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        * def payload = read('classpath:app/api/reload/services-css/posts/CreateAbatementEarnings/CreateAbatementEarnings-basic-flow.xml') 
        And request payload
        When method post
        * print response
        Then status 200

		
