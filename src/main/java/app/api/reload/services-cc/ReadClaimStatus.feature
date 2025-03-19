#@ignore
@ReadClaimStatus
Feature: ReadClaimStatus
    Background: 
		# For a unit testing uncomment lines below, update value, remove @ignore
		#* def STR_CASENUMBER = '10060066418'
		* def STR_CORRID = 123
		* def STR_CONTEXT = 'ICP'
		* def STR_USERID = 'PS-AA6334'
		* def STR_VENDORID = 'VAB908'
		* def STR_DATEOFBIRTH = '1970-01-01'
		
    Scenario: ReadClaimStatus
        Given url WSC_CC_URL + 'ReadClaimStatus'
        * configure headers  = WSC_HTTP_HEADERS
		And param PARAM_STR_CASENUMBER = STR_CASENUMBER
		And param PARAM_STR_CORRID = STR_CORRID
		And param PARAM_STR_CONTEXT = STR_CONTEXT
		And param PARAM_STR_USERID = STR_USERID
		And param PARAM_STR_VENDORID = STR_VENDORID
		And param PARAM_STR_DATEOFBIRTH = STR_DATEOFBIRTH
		
		
		When method get
		* print response
		Then status 200		
		
		