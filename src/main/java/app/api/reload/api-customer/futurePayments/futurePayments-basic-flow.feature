@ignore
@futurePayments-basic-flow
Feature:
	Background: 
		# uncomment 2 lines below & @ingore for unittesting
		* def eosCaseNo = '10060068497'
		* def customerNo = '20106146'
		
    Scenario: list of benetis
        * def path = '/claims/<path-eosCaseNo>/futurePayments'
		* replace path.path-eosCaseNo = eosCaseNo
		
        Given url CUSTOMER_API_URL + path
        * set JSONAPI_HTTP_HEADERS.userid = 'MYACC:' + customerNo
        * configure headers = JSONAPI_HTTP_HEADERS
		
        When method get
		* string responseStr = karate.pretty(response)
		* karate.write(responseStr, '../src/test/java/app/api/reload/api-customer/futurePayments/futurePayments-basic-flow-basic-flow-response 24.5.txt')
        * print response		