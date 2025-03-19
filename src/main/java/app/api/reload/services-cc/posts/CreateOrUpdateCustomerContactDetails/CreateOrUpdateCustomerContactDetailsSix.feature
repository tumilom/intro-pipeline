@ignore
@CreateOrUpdateCustomerContactDetailsSix
Feature:
    Background:
	    * def customerNo = '201063691'
		* def preferredContactMethod = 'Email'	
        * def userId =  'OASIS'
		* def configParam = 'CreateOrUpdateCustomerContactDetails'

    Scenario: CreateOrUpdateCustomerContactDetails - invalid customer number input

        Given url WSC_CC_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        * def payload = read('classpath:app/api/reload/services-cc/posts/CreateOrUpdateCustomerContactDetails/CreateOrUpdateCustomerContactDetailsSix-request.xml')
		And request payload
	
        
        When method post
        * print response
        Then status 200
		