@ignore
@paymentLines-basic-flow
Feature:
	Background: 
		# uncomment 2 lines below & @ingore for unittesting
		* def eosCaseNo = '10060068497'
		* def peiOid = 'PE-07326-0022994892'
		* def customerNo = '20106146'
		
    Scenario: list of benetis
        * def path = '/claims/<path-eosCaseNo>/payments/<path-peiOid>/paymentLines'
		* replace path.path-eosCaseNo = eosCaseNo
		* replace path.path-peiOid = peiOid
		
        Given url CUSTOMER_API_URL + path
        * set JSONAPI_HTTP_HEADERS.userid = 'MYACC:' + customerNo
        * configure headers = JSONAPI_HTTP_HEADERS
		
        When method get
			* string responseStr = karate.pretty(response)
		* karate.write(responseStr, '../src/test/java/app/api/reload/api-customer/paymentLines/paymentLines-basic-flow-basic-flow-response 24.5.txt')
        * print response
		