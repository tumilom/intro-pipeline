@ignore
@ReadClaimStatus-query-claim-casenumber
Feature: ReadClaimStatus
    Background: 
		# For a unit testing uncomment lines below, update value, remove @ignore
		* def STR_CASENUMBER = '10060075870'
		* def STR_CORRID = 123
		* def STR_CONTEXT = 'QUERYCLAIM'
		* def STR_VENDORID = 'VAB908'
		* def STR_PROVIDERID = 'PS-AA6334'
		
		
    Scenario: ReadClaimStatus
        Given url WSC_CC_URL + 'ReadClaimStatus'
        * configure headers  = WSC_HTTP_HEADERS
		
		And param PARAM_STR_CASENUMBER = STR_CASENUMBER
		And param PARAM_STR_CORRID = STR_CORRID
		And param PARAM_STR_CONTEXT = STR_CONTEXT
		And param PARAM_STR_VENDORID = STR_VENDORID
		And param PARAM_STR_USERID = STR_PROVIDERID

		
		When method get
		* print response
		Then status 200
		

		