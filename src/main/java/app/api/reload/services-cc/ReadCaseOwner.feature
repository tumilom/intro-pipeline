#@ignore
@readCaseOwner
Feature: Read Case Owner
    Background: 
		# For a ACC45 number gets Case Owner details
		# For a unit testing uncomment lines below, update claimNumber value, remove @ignore
		#* def claimNumber = '10060082370'
		* def strUserid = 'OASIS'
		* def strCorrId = 'ANY'
		
    Scenario: Case Owner
        Given url WSC_CC_URL + 'ReadCaseOwner'
        * configure headers  = WSC_HTTP_HEADERS
		And param param_str_caseNumber = claimNumber
		And param PARAM_STR_USERID = strUserid
		And param PARAM_STR_CORRID = strCorrId
		
		When method get
		* print response
		Then status 200
		