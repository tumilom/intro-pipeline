@ignore
@ReadClaimStatus-invalid-MI
Feature: ReadClaimStatus
    Background: 
		# For a unit testing uncomment lines below, update value, remove @ignore
		* def STR_CASENUMBER = '10060097872'
		* def STR_CORRID = 123
		* def STR_CONTEXT = 'ICP'
		* def STR_VENDORID = 'VAB908'
		* def STR_PROVIDERID = 'PS-AA6334'
		* def STR_DATEOFBIRTH = '2019-05-25'
		
    Scenario: ReadClaimStatus
        Given url WSC_CC_URL + 'ReadClaimStatus'
        * configure headers  = WSC_HTTP_HEADERS
		
		And param PARAM_STR_CASENUMBER = STR_CASENUMBER
		And param PARAM_STR_CORRID = STR_CORRID
		And param PARAM_STR_CONTEXT = STR_CONTEXT
		And param PARAM_STR_VENDORID = STR_VENDORID
		And param PARAM_STR_USERID = STR_PROVIDERID
		And param PARAM_STR_DATEOFBIRTH = STR_DATEOFBIRTH
		
		
		When method get
		* string responseStr = response
		* karate.write(responseStr, '../src/test/java/app/api/reload/services-cc/ReadClaimStatus/ReadClaimStatus-invalid-MI-response-24.2.txt')
		* print response
		Then status 200
		

		