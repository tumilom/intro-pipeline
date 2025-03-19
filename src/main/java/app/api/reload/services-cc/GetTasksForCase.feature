#@ignore
@GetTasksForCase
Feature: GetTasksForCase
    Background: 
		# For a unit testing uncomment lines below, update value, remove @ignore
		#* def STR_CASENUMBER = '10060066418'
		* def STR_CORRID = 123		
		
    Scenario: 
        Given url WSC_CC_URL + 'GetTasksForCase'
        * configure headers  = WSC_HTTP_HEADERS
		And param PARAM_STR_CASENUMBER = STR_CASENUMBER
		And param PARAM_STR_CORRID = STR_CORRID		
		And param PARAM_STR_USERID = 'OASIS'

		When method get
		* print response
		Then status 200				