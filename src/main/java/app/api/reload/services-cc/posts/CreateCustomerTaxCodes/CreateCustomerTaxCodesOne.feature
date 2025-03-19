@ignore
@CreateCustomerTaxCodesOne
Feature:
    Background:
        * def JavaApp = Java.type('app.App');

	    * def customerNo = '20120413'
		* def effectiveDate = JavaApp.daysFromNow('0','yyyy-MM-dd')	+'T00:00:00'
       
        * def userId =  'OASIS'
		* def configParam = 'CreateCustomerTaxCodes'

    Scenario: CreateCustomerTaxCodes

        Given url WSC_CC_URL +  configParam
        * configure headers  = WSC_HTTP_HEADERS
        * def payload = read('classpath:app/api/reload/services-cc/posts/CreateCustomerTaxCodes/CreateCustomerTaxCodesOne-request.xml') 
		And request payload
	
        
        When method post
        * print response
        Then status 200
		