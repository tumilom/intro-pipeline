@ignore
@ReadCRMClientDetailsv1
Feature: ReadCRMClientDetailsv1
    Background: 		
		# For a unit testing uncomment lines below, update values below, remove @ignore
		* def caseNumber = '20093028'		
		* def strUserid = 'OASIS'
		* def strCorrId = 'ANY'		
		
    Scenario: Case Owner
        Given url WSC_CC_URL + 'ReadCRMClientDetailsv1'
        * configure headers  = WSC_HTTP_HEADERS
		And param PARAM_STR_CASENUMBER = caseNumber	
		And param PARAM_STR_USERID = strUserid
		And param PARAM_STR_CORRID = strCorrId
		
		When method get
		* string responseStr = response
		* karate.write(responseStr, '../src/test/java/app/api/reload/services/ReadCRMClientDetailsv1/ReadCRMClientDetailsv1-response-24.2.txt')
		* print response
		Then status 200
		
		
		
		