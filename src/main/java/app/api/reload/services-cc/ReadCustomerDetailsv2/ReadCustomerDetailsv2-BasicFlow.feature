#@ignore
@ReadCustomerDetailsv2-BasicFlow
Feature: ReadCustomerDetails
    Background: 		
		# For a unit testing uncomment lines below, update values below, remove @ignore
		* def customerNo = '20127450'		
		* def strUserid = 'OASIS'
		* def strCorrId = 'ANY'		
		
    Scenario: Case Owner
        Given url WSC_CC_URL + 'ReadCustomerDetailsv1'
        * configure headers  = WSC_HTTP_HEADERS
		And param PARAM_STR_CUSTOMERNO = customerNo		
		And param PARAM_STR_USERID = strUserid
		And param PARAM_STR_CORRID = strCorrId
		
		When method get
		* string responseStr = response
		* karate.write(responseStr, '../src/main/java/app/api/reload/services-cc/ReadCustomerDetailsv2/ReadCustomerDetailsv2-response-24.7.txt')
		* print response
		Then status 200
		
		
		
		