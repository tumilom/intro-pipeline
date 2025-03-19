@ignore
@CreateOrUpdateCustomerContactDetailsOne
Feature:
    Background:
	    * def customerNo = '20106369'
		* def preferredContactMethod = 'Email'	
        * def userId =  'OASIS'
		* def configParam = 'CreateOrUpdateCustomerContactDetails'

    Scenario: CreateOrUpdateCustomerContactDetails - customer has no contact details and this test is to create the email and phone 

        Given url WSC_CC_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        * def payload = read('classpath:app/api/reload/services-cc/posts/CreateOrUpdateCustomerContactDetails/CreateOrUpdateCustomerContactDetailsOne-request.xml')
		And request payload
	
        
        When method post
        * print response
        Then status 200
		