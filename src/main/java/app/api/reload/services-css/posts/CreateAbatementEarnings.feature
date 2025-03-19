@css_CreateAbatementEarnings

Feature:
    Background:
      
		* def configParam = 'CreateAbatementEarnings'

    Scenario: Create abatement Earnings

        Given url WSC_CSS_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
		    * set WSC_HTTP_HEADERS.userid = gcUserId
        * def payload = read('classpath:app/api/reload/services-css/posts/CreateAbatementEarnings-add.xml') 
        And request payload
        When method post
        * print response
        Then status 200

		
