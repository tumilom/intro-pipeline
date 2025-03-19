#@ignore
@ReadClaimStatus-query-claim
Feature: ReadClaimStatus
    Background: 
		# For a unit testing uncomment lines below, update value, remove @ignore
		#* def STR_CASENUMBER = '10060079646'
		* def STR_CORRID = 123
		* def STR_CONTEXT = 'QUERYCLAIM'
		* def STR_VENDORID = 'AA210'
		* def STR_PROVIDERID = 'PS-AA6334'
		* def STR_DATEOFBIRTH = '2000-08-10'
		* def STR_NHINO = 'AAA1999'
		
    Scenario: ReadClaimStatus
        Given url WSC_CC_URL + 'ReadClaimStatus'
        * configure headers  = WSC_HTTP_HEADERS
		
		#And param PARAM_STR_CASENUMBER = STR_CASENUMBER
		And param PARAM_STR_CORRID = STR_CORRID
		And param PARAM_STR_CONTEXT = STR_CONTEXT
		And param PARAM_STR_VENDORID = STR_VENDORID
		And param PARAM_STR_USERID = STR_PROVIDERID
		And param PARAM_STR_DATEOFBIRTH = STR_DATEOFBIRTH
		And param PARAM_STR_NHINO = STR_NHINO
		
		
		When method get
	    * string responseStr = response
		* karate.write(responseStr, '../src/main/java/app/api/reload/services-cc/ReadClaimStatus-QueryClaim/ReadClaimStatus-query-claim response-24.7.txt')
		* print response
		Then status 200
		

		