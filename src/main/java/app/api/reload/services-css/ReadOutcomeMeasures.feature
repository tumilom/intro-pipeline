@ReadOutcomeMeasures
Feature: Read ReadOutcomeMeasures
    Background: 
		# For get claims for party
		# For a unit testing uncomment lines below, update claimNumber value, remove @ignore
		#* def recoverPlanCaseNumber = '10060075371'		
		#* def outcomeMeasureType = 'HCG TOOL'
		
		#* def myACCCustomerNo = 'yangs'	
		* def myACCCustomerNo = 'MYACC:' + CustomerNo

		
    Scenario: ReadOutcomeMeasures
        Given url WSC_CSS_URL + 'ReadOutcomeMeasures'
        * configure headers  = WSC_HTTP_HEADERS
		And param param_str_caseNumber = recoverPlanCaseNumber
		And param param_str_userid = myACCCustomerNo
		And param PARAM_STR_ASSMTTYPE = outcomeMeasureType
					
		When method get
		* print response
		Then status 200
		
