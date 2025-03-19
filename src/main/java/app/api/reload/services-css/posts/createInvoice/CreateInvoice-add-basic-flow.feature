@ignore
@CreateInvoice-add-basic-flow
Feature:
    Background:
	    * def customerNo = '20129036'
		* def crCaseNumber = 'CR10060086871'
		* def paymentPreferenceId = '2201823'
      
		* def configParam = 'CreateInvoice'

    Scenario: Create outcome measure

        Given url WSC_CSS_URL +  configParam
        * configure headers  = WSC_HTTP_HEADERS
        * def payload = read('classpath:app/api/reload/services-css/posts/createInvoice/CreateInvoice-add-basic-flow.xml') 
        And request payload
        When method post
        * print response
        Then status 200
		* def invoiceReferenceCreated  = karate.xmlPath(response , "/WSUpdateResponse/additional-data-set/additional-data[./name/text()='INVOICE_REFERENCE_NUMBER']/value")
		* print invoiceReferenceCreated