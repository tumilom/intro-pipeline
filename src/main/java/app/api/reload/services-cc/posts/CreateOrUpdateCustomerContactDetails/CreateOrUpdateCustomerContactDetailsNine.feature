@ignore
@CreateOrUpdateCustomerContactDetailsNine
Feature:
    Background:
	    * def customerNo = '20120440'
		* def preferredContactMethod = 'Email'	
        * def userId =  'OASIS'
		* def configParam = 'CreateOrUpdateCustomerContactDetails'

    Scenario: CreateOrUpdateCustomerContactDetails - Invalid area code

        Given url WSC_CC_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        * def payload = read('classpath:app/api/reload/services-cc/posts/CreateOrUpdateCustomerContactDetails/CreateOrUpdateCustomerContactDetailsNine-request.xml')
		And request payload
	
        
        When method post
        * print response
        Then status 200
		