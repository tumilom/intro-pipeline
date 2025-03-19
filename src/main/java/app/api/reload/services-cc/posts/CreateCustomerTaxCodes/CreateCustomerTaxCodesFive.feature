@ignore
@CreateCustomerTaxCodesFive
Feature:
    Background:
        * def JavaApp = Java.type('app.App');

	    * def customerNo = '201204131'
		* def effectiveDate = JavaApp.daysFromNow('0','yyyy-MM-dd')	+'T00:00:00'
       
        * def userId =  'OASIS'
		* def configParam = 'CreateCustomerTaxCodes'

    Scenario: Adding invalid customer number

        Given url WSC_CC_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        * def payload = read('classpath:app/api/reload/services-cc/posts/CreateCustomerTaxCodes/CreateCustomerTaxCodesFive-request.xml') 
		And request payload
	
        
        When method post
        * print response
        Then status 200
		