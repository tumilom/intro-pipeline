@ignore
@CreateOrUpdateCustomerContactDetailsFour
Feature:
    Background:
	    * def customerNo = '20123364'
		* def preferredContactMethod = 'Email'	
        * def userId =  'OASIS'
		* def configParam = 'CreateOrUpdateCustomerContactDetails'

    Scenario: CreateOrUpdateCustomerContactDetails - phone number exceeds the max length (customer has contact details and this test is to update both email and phone but phone number exceeds the max of 9)

        Given url WSC_CC_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        * def payload = read('classpath:app/api/reload/services-cc/posts/CreateOrUpdateCustomerContactDetails/CreateOrUpdateCustomerContactDetailsFour-request.xml')
		And request payload
	
        
        When method post
        * print response
        Then status 200
		