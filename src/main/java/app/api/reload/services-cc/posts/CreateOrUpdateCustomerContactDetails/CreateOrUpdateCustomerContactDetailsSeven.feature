@ignore
@CreateOrUpdateCustomerContactDetailsSeven
Feature:
    Background:
	    * def customerNo = '20106369'
		* def preferredContactMethod = 'Email'	
        * def userId =  'OASIS'
		* def configParam = 'CreateOrUpdateCustomerContactDetails'

    Scenario: CreateOrUpdateCustomerContactDetails - invalid instance name (Invalid Verification Status)

        Given url WSC_CC_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        * def payload = read('classpath:app/api/reload/services-cc/posts/CreateOrUpdateCustomerContactDetails/CreateOrUpdateCustomerContactDetailsSeven-request.xml')
		And request payload
	
        
        When method post
        * print response
        Then status 200
		