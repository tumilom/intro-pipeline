@ReadInvoice
Feature: Read Incoice
    Background: 
		# For get claims for party
		# For a unit testing uncomment lines below, update value
		#* def STR_REFERENCENUMB = '10060075371'
		#* def str_userid = 'yangs'
		
		
    Scenario: Case Owner
        Given url WSC_CSS_URL  + 'ReadInvoice'
        * configure headers  = WSC_HTTP_HEADERS
		And param PARAM_STR_REFERENCENUMB = STR_REFERENCENUMB
		
			
		When method get
		* print response
		Then status 200
		
