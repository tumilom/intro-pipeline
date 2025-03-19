@CreateInvoice
Feature:
    Background:
	    #* def customerNo = 'customer number of the claimant'
		#* def crCaseNumber = client reimbursement case number
		#* def paymentPreferenceId = 'I value of payment preference'
      
		* def configParam = 'CreateInvoice'

    Scenario: Create outcome measure

        Given url WSC_CSS_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        * def payload = read('classpath:app/api/reload/services-css/posts/CreateInvoice-add.xml') 
        And request payload
        When method post
        * print response
        Then status 200
		* def invoiceReferenceCreated  = karate.xmlPath(response , "/WSUpdateResponse/additional-data-set/additional-data[./name/text()='INVOICE_REFERENCE_NUMBER']/value")
		* print invoiceReferenceCreated