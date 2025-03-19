#@ignore
@ReadCRMClientDetailsv1
Feature: ReadCRMClientDetailsv1
    Background: 		
		# For a unit testing uncomment lines below, update values below, remove @ignore
		#* def str_customerNo = '20103041'
		* def strUserid = 'OASIS'
		* def strCorrId = 'ANY'		
		
    Scenario: ReadCRMClientDetailsv1
        Given url WSC_CC_URL + 'ReadCRMClientDetailsv1'
        * configure headers  = WSC_HTTP_HEADERS
		And param PARAM_STR_CUSTOMERNO = str_customerNo
		And param PARAM_STR_USERID = strUserid
		And param PARAM_STR_CORRID = strCorrId
		
		When method get
		* string responseStr = response
		#* karate.write(responseStr, '../src/test/java/app/api/reload/services-cc/ReadCRMClientDetailsv1/ReadCRMClientDetailsv1-BasicFlow-response-24.2.txt')
		* print response
		Then status 200
		
		
		
		