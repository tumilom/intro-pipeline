#@ignore
@ReadPartyIndicatorsv2-BasicFlow
Feature: Read Case Owner
    Background: 
		# For a ACC45 number gets Case Owner details
		# For a unit testing uncomment lines below, update claimNumber value, remove @ignore
		* def strCustomerNumber = '20128556'
		# def strIndicatorOids = '20134028'
		* def strUserid = 'OASIS'
		* def strCorrId = 'ANY'
		
    Scenario: Case Owner
        Given url WSC_CC_URL +'ReadPartyIndicatorsv1'
        * configure headers  = WSC_HTTP_HEADERS
		And param PARAM_STR_CUSTOMERNO = strCustomerNumber
		#And param PARAM_STR_INDICATOROIDS = strIndicatorOids
		And param PARAM_STR_USERID = strUserid
		And param PARAM_STR_CORRID = strCorrId
		
		When method get
	    * string responseStr = response
		* karate.write(responseStr, '../src/main/java/app/api/reload/services-cc/ReadPartyIndicatorsv2/ReadPartyIndicatorsv2-BasicFlow-response-24.7.txt')
		* print response
		Then status 200
		
		