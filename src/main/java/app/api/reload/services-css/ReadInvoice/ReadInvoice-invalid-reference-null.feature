@ignore
@ReadInvoice-invalid-reference-null
Feature: Read Invoice
    Background: 
		# For get claims for party
		# For a unit testing uncomment lines below, update value
		* def STR_REFERENCENUMB = 
		* def str_userid = 'yangs'
		
		
    Scenario: Case Owner
        Given url WSC_CSS_URL + 'ReadInvoice'
        * configure headers  = WSC_HTTP_HEADERS
		
		And param PARAM_STR_REFERENCENUMB = STR_REFERENCENUMB
		
			
		When method get
		* string responseStr = response
		* karate.write(responseStr, '../src/test/java/app/api/reload/services-css/ReadInvoiceReadInvoice-invalid-reference-null.txt')
		* print response
		Then status 200
		
