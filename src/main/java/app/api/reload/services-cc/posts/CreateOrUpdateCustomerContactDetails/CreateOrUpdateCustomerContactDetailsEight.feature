@ignore
@CreateOrUpdateCustomerContactDetailsEight
Feature:
    Background:
	    * def customerNo = '20120413'
		* def preferredContactMethod = 'Email'	
        * def userId =  'OASIS'
		* def configParam = 'CreateOrUpdateCustomerContactDetails'

    Scenario: CreateOrUpdateCustomerContactDetails - customer has no contact details and to add the mobile number as well as home number and email

        Given url WSC_CC_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        * def payload = read('classpath:app/api/reload/services-cc/posts/CreateOrUpdateCustomerContactDetails/CreateOrUpdateCustomerContactDetailsEight-request.xml')
		And request payload
	
        
        When method post
        * print response
        Then status 200
		