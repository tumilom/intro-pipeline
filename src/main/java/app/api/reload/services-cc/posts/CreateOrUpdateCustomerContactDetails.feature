@ignore
@CreateOrUpdateCustomerContactDetails
Feature:
    Background:
#	    * def customerNo = '20100350'
#		* def preferredContactMethod = 'Email'	
        * def userId =  'OASIS'
		* def configParam = 'CreateOrUpdateCustomerContactDetails'

    Scenario: CreateOrUpdateCustomerContactDetails

        Given url WSC_CC_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        * def payload = read('classpath:app/api/reload/services-cc/posts/CreateOrUpdateCustomerContactDetails-request.xml') 
		And request payload
	
        
        When method post
        * print response
        Then status 200
		