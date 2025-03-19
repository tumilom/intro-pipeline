@ignore
@css_ReadEarningsCalculationDetails-invalid-payperiod
Feature: Read earnings calculation details having an invalid payment period in the parameter
    Background: 
		# For get earnings calculation details
		# For a unit testing uncomment lines below, update the paramters casenumber, userid, paymentperiodOID values, remove @ignore
		* def STR_CLAIMNUMBER = '10060074370'
		* def str_userid = 'yangs'
		* def str_paymentperiodoid = 'PE:07278:211605071'
		
		
    Scenario: Case Owner
        Given url WSC_CSS_URL + 'ReadEarningsCalculationDetails'
        * configure headers  = WSC_HTTP_HEADERS
		And param PARAM_STR_CLAIMNUMBER = STR_CLAIMNUMBER
		And param param_str_userid = str_userid
		And param paymentPeriodOID = str_paymentperiodoid
				
			
		When method get
		* string responseStr = response
		* karate.write(responseStr, '../src/test/java/app/api/reload/services-css/ReadEarningsCalculationDetails/ReadEarningsCalculationDetails-invalid-payperiod-response 24.2.txt')
		* print response
		Then status 200
	