#@ignore
@ReadClaimStatusQueryClaim
Feature: ReadClaimStatus
    Background: 
		# For a unit testing uncomment lines below, update value, remove @ignore
		* def STR_NHINO = 'AAA1234'
		* def STR_CORRID = 123
		* def STR_CONTEXT = 'QUERYCLAIM'
		* def STR_USERID = 'PS-AA6334'
		* def STR_VENDORID = 'VAB908'
		* def STR_DATEOFBIRTH = '2005-10-10'
		
    Scenario: ReadClaimStatus
        Given url WSC_CC_URL + 'ReadClaimStatus'
        * configure headers  = WSC_HTTP_HEADERS
		And param PARAM_STR_NHINO = STR_NHINO
		And param PARAM_STR_CORRID = STR_CORRID
		And param PARAM_STR_CONTEXT = STR_CONTEXT
		And param PARAM_STR_USERID = STR_USERID
		And param PARAM_STR_VENDORID = STR_VENDORID
		And param PARAM_STR_DATEOFBIRTH = STR_DATEOFBIRTH
		
		
		When method get
		* print response
		Then status 200
		