#@ignore
@ReadOccupationDetails
Feature: ReadOccupationDetails
    Background: 		
		# For a unit testing uncomment lines below, update values below, remove @ignore
		#* def caseNumber = '20093028'		
		* def strUserid = 'OASIS'
		* def strCorrId = 'ANY'		
		
    Scenario: Case Owner
        Given url WSC_CC_URL + 'ReadOccupationDetails'
        * configure headers  = WSC_HTTP_HEADERS
		And param PARAM_STR_CASENUMBER = caseNumber	
		And param PARAM_STR_USERID = strUserid
		And param PARAM_STR_CORRID = strCorrId
		
		When method get
		* print response
		Then status 200
		
		
		
		