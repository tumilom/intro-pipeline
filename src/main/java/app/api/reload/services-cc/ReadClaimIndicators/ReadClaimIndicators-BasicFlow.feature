@ignore
@ReadClaimIndicators-BasicFlow
Feature: Read Case Owner
    Background: 
		# For a ACC45 number gets Case Owner details
		# For a unit testing uncomment lines below, update claimNumber value, remove @ignore
		* def strCaseNumber = '10060087370'
		# def strIndicatorOids = '20134028'
		* def strUserid = 'OASIS'
		* def strCorrId = 'ANY'
		
    Scenario: Case Owner
        Given url WSC_CC_URL + 'ReadClaimIndicators'
        * configure headers  = WSC_HTTP_HEADERS
		And param PARAM_STR_CASENUMBER = strCaseNumber
		#And param PARAM_STR_INDICATOROIDS = strIndicatorOids
		And param PARAM_STR_USERID = strUserid
		And param PARAM_STR_CORRID = strCorrId
		
		When method get
	    * string responseStr = response
		* karate.write(responseStr, '../src/test/java/app/api/reload/services-cc/ReadClaimIndicators/ReadClaimIndicators-response-24.2.txt')
		* print response
		Then status 200
		
		