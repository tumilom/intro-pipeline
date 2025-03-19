@ignore
@ReadOutcomeMeasures-Psychosocial-Tool
Feature: Read ReadOutcomeMeasures
    Background: 
		# For get claims for party
		# For a unit testing uncomment lines below, update claimNumber value, remove @ignore
	    * def recoverPlanCaseNumber = '10060066478-RP'
		* def myACCCustomerNo = 'MYACC:20103045'
		* def outcomeMeasureType = 'Psychosocial Tool'

		
    Scenario: ReadOutcomeMeasures
        Given url WSC_CSS_URL +'ReadOutcomeMeasures'
        * configure headers  = WSC_HTTP_HEADERS
		And param param_str_caseNumber = recoverPlanCaseNumber
		And param param_str_userid = myACCCustomerNo
		And param PARAM_STR_ASSMTTYPE = outcomeMeasureType
					
		When method get
		* string responseStr = response
		* karate.write(responseStr, '../src/test/java/app/api/reload/services-css/ReadOutcomeMeasures/ReadOutcomeMeasures-Psychosocial Tool-response 24.2.txt')
		* print response
		Then status 200
		
