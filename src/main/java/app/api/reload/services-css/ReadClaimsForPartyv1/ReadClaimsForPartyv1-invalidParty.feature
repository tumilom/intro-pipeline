@ignore
@ReadClaimsForPartyv1-invalidParty
Feature: Read Case Owner
    Background: 
		# For get claims for party
		# For a unit testing uncomment lines below, update claimNumber value, remove @ignore
		* def str_customerno = '!@#^$%'
		* def str_userid = 'yangs'
		* def COVER_STATUS = 'Accept'
		* def STR_STARTDATE = '2023-12-01'
		* def STR_ENDDATE = '2024-07-30'
		
    Scenario: Case Owner
        Given url WSC_CSS_URL + 'ReadClaimsForPartyv1'
        * configure headers  = WSC_HTTP_HEADERS
		And param param_str_customerno = str_customerno
		And param param_str_userid = str_userid
		And param PARAM_STR_COVER_STATUS = COVER_STATUS
		And param PARAM_STR_STARTDATE = STR_STARTDATE
		And param PARAM_STR_ENDDATE = STR_ENDDATE
			
		When method get
		* string responseStr = response
		* karate.write(responseStr, '../src/test/java/app/api/reload/services-css/ReadClaimsForPartyv1/ReadClaimsForPartyv1-invalidParty-response 24.2.txt')
		* print response
		Then status 200
				
