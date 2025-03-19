@css_CreateAbatementOccupation

Feature:
    Background:
		#* benefitCaseNo = 'WCE123'
		#* employerId = '123'		
	  
		* def configParam = 'CreateAbatementOccupation'

    Scenario: Create abatement Earnings

        Given url WSC_CSS_URL +  configParam
        * configure headers  = WSC_HTTP_HEADERS
		    * set WSC_HTTP_HEADERS.userid = gcUserId
		    * def payload = read('classpath:app/api/reload/services-css/posts/CreateAbatementOccupation-add.xml') 
        And request payload
        When method post
        * print response
        Then status 200

		
