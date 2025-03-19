@ignore
@CreateOrUpdateCustomerContactDetailsTen
Feature:
    Background:
	    * def customerNo = '20120413'
		* def preferredContactMethod = 'Post'	
        * def userId =  'OASIS'
		* def configParam = 'CreateOrUpdateCustomerContactDetails'

    Scenario: CreateOrUpdateCustomerContactDetails - Invalid area code

        Given url WSC_CC_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        * def payload = read('classpath:app/api/reload/services-cc/posts/CreateOrUpdateCustomerContactDetails/CreateOrUpdateCustomerContactDetailsTen-request.xml')
		And request payload
	
        
        When method post
        * print response
        Then status 200
		