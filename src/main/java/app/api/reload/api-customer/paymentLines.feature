@ignore
@paymentLines
Feature:
	Background: 
		# uncomment 2 lines below & @ingore for unittesting
		#* def eosCaseNo = '10060066372'
		#* def peiOid = 'WCENumber'
		#* def customerNo = '20103035'
		
    Scenario: list of benetis
        * def path = '/claims/<path-eosCaseNo>/payments/<path-peiOid>/paymentLines'
		* replace path.path-eosCaseNo = eosCaseNo
		* replace path.path-peiOid = peiOid
		
        Given url CUSTOMER_API_URL + path
        * set JSONAPI_HTTP_HEADERS.userid = 'MYACC:' + customerNo
        * configure headers = JSONAPI_HTTP_HEADERS
		
        When method get
        * print response
		