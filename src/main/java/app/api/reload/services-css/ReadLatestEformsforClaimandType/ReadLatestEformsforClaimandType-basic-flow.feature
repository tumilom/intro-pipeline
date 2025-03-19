#@ignore
@ReadLatestEformsforClaimAndType-basic-flow
Feature: Read ReadOutcomeMeasures
    Background: 
		# For get claims for party
		# For a unit testing uncomment lines below, update claimNumber value, remove @ignore
	    * def claimNumber = '10060080023'
		* def myACCCustomerNo = 'MYACC:20129438'
		* def eformtypes = 'Approved Incapacity,Initial Interview Script,Medical Incapacity'
		
    Scenario: ReadOutcomeMeasures
        Given url WSC_CSS_URL +'ReadLatestEformsForClaimAndType'
        * configure headers  = WSC_HTTP_HEADERS
		And param PARAM_STR_CLAIMNUMBER = claimNumber
		And param PARAM_STR_EFORMTYPES = eformtypes
					
		When method get
		* string responseStr = response
		* karate.write(responseStr, '../src/main/java/app/api/reload/services-css/ReadLatestEformsforClaimandType/ReadLatestEformsforClaimandType-basic-flow-response 24.7.txt')
		* print response
		Then status 200
		
