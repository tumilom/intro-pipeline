@ignore
@CreateOrUpdateCustomerContactDetailsFive
Feature:
    Background:
	    * def customerNo = '20106369'
		* def preferredContactMethod = 'Email'	
        * def userId =  'OASIS'
		* def configParam = 'CreateOrUpdateCustomerContactDetails'

    Scenario: CreateOrUpdateCustomerContactDetails - customer has contact details and this test is to update with existing contact details

        Given url WSC_CC_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        * def payload = read('classpath:app/api/reload/services-cc/posts/CreateOrUpdateCustomerContactDetails/CreateOrUpdateCustomerContactDetailsFive-request.xml')
		And request payload
	
        
        When method post
        * print response
        Then status 200
		