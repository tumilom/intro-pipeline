@ignore
@css_ReadPostIncapacityEarningsDetails-basic-flow
Feature: Read post incapacity earnings details
    Background: 
		# For get post incapacity earnings for a claim
		# For a unit testing uncomment lines below, update the paramters casenumber, userid, paymentperiodOID values, remove @ignore
		* def STR_CASENUMBER = '10060074370'
		* def str_userid = 'yangs'
		* def str_paymentperiodoid = 'PE:07278:2116050709'
		
		
    Scenario: Case Owner
        Given url WSC_CSS_URL +'ReadPostIncapacityEarningsDetails'
        * configure headers  = WSC_HTTP_HEADERS
		And param PARAM_STR_CASENUMBER = STR_CASENUMBER
		And param param_str_userid = str_userid
		And param paymentPeriodOID = str_paymentperiodoid
				
			
		When method get
		* string responseStr = response
		* karate.write(responseStr, '../src/test/java/app/api/reload/services-css/ReadPostIncapacityEarningsDetails/ReadPostIncapacityEarningsDetails-basic-flow-response 24.2.txt')
		* print response
		Then status 200
	