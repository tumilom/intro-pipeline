@ignore
@PartyPeriods
Feature: PartyPeriods
    Background: 		
		# For a unit testing uncomment lines below, update values below, remove @ignore
		#* def strCustomerNumber = '20093028'		
		* def strUserid = 'OASIS'
		* def strCorrId = 'ANY'		
		
    Scenario: Case Owner
        Given url WSC_CC_URL + 'PartyPeriods'
        * configure headers  = WSC_HTTP_HEADERS
		And param PARAM_STR_CUSTOMERNO = strCustomerNumber		
	#	And param PARAM_STR_USERID = strUserid
		And param PARAM_STR_CORRID = strCorrId
		
		When method get
		* string responseStr = response
		
		* print response
		Then status 200
		
		
		
		