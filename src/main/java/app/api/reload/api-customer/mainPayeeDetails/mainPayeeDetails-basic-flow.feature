@ignore
@mainPayeeDetails-basic-flow
Feature:
	Background: 
		# uncomment 2 lines below & @ingore for unittesting
		* def eosCaseNo = '10060068517'
		* def eosBenefitCaseNo = 'WCE10060068519'
		* def customerNo = '20106156'
		
    Scenario: list of benetis
        * def path = '/claims/<path-eosCaseNo>/benefits/<path-eosBenefitCaseNo>/mainPayeeDetails'
		* replace path.path-eosCaseNo = eosCaseNo
		* replace path.path-eosBenefitCaseNo = eosBenefitCaseNo
		
        Given url CUSTOMER_API_URL + path
        * set JSONAPI_HTTP_HEADERS.userid = 'MYACC:' + customerNo
        * configure headers = JSONAPI_HTTP_HEADERS
		
        When method get
		* string responseStr = karate.pretty(response)
		* karate.write(responseStr, '../src/test/java/app/api/reload/api-customer/mainPayeeDetails/mainPayeeDetails-basic-flow-basic-flow-response 24.5.txt')
        * print response
		