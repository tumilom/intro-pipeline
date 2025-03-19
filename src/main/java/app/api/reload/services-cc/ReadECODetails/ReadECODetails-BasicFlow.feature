#@ignore
@ReadECODetails-BasicFlow
Feature: ReadECODetails
    Background: 		
		# For a unit testing uncomment lines below, update values below, remove @ignore
		* def caseNumber = '10060066557'		
		* def strUserid = 'OASIS'
		* def strCorrId = 'ANY'		
		
    Scenario: Case Owner
        Given url WSC_CC_URL + 'ReadECODetails'
        * configure headers  = WSC_HTTP_HEADERS
		And param PARAM_STR_CASENUMBER = caseNumber	
		And param PARAM_STR_USERID = strUserid
		And param PARAM_STR_CORRID = strCorrId
		
		When method get
		* string responseStr = response
		* karate.write(responseStr, '../src/main/java/app/api/reload/services-cc/ReadECODetails/ReadECODetails-BasicFlow-response-24.7.txt')
		* print response
		Then status 200
		
		
		
		