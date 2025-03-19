@ignore
@mainPayeeDetails
Feature:
	Background: 
		# uncomment 2 lines below & @ingore for unittesting
		#* def eosCaseNo = '10060066372'
		#* def eosBenefitCaseNo = 'WCENumber'
		#* def customerNo = '20103035'
		
    Scenario: list of benetis
        * def path = '/claims/<path-eosCaseNo>/benefits/<path-eosBenefitCaseNo>/mainPayeeDetails'
		* replace path.path-eosCaseNo = eosCaseNo
		* replace path.path-eosBenefitCaseNo = eosBenefitCaseNo
		
        Given url CUSTOMER_API_URL + path
        * set JSONAPI_HTTP_HEADERS.userid = 'MYACC:' + customerNo
        * configure headers = JSONAPI_HTTP_HEADERS
		
        When method get
        * print response
		