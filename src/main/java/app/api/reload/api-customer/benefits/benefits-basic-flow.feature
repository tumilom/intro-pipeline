@ignore
@benefitlist-basic-flow
Feature:
	Background: 
		# uncomment 2 lines below & @ignore for unittesting
		* def eosCaseNo = '10060066372'
		* def customerNo = '20103030'
		
    Scenario: list of benetis
        * def path = '/claims/<eosCaseNo>/benefits'
		* replace path.eosCaseNo = eosCaseNo
		
        Given url CUSTOMER_API_URL + path
        * set JSONAPI_HTTP_HEADERS.userid = 'MYACC:' + customerNo
        * configure headers = JSONAPI_HTTP_HEADERS
        When method get
		* string responseStr = karate.pretty(response)
		* karate.write(responseStr, '../src/test/java/app/api/reload/api-customer/benefits/benefits-basic-flow-response 24.2.txt')
        * print response
		* def allCaseIds = karate.jsonPath(response, "$[*].benefitId")
		* print allCaseIds		
		
		* def wceCaseNo = karate.jsonPath(response, "$[?(@.benefitId =~ /WCE.*/i )].benefitId")
		* print wceCaseNo
				
		* def crCaseNo = karate.jsonPath(response, "$[?(@.benefitId =~ /CR.*/i )].benefitId")
		* print crCaseNo
		
		* def cssCaseNo = karate.jsonPath(response, "$[?(@.benefitId =~ /CSS.*/i )].benefitId")
		* print cssCaseNo
		
