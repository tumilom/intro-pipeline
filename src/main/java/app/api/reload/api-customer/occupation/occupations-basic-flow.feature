@ignore
@customer_occupations-basic-flow
Feature: customer occupations
    Background: 
		# For a given customer, get occupations
		# For a unit testing uncomment line below, update customerNo  value
		# customerUserId must be registered first
		* def customerNo = '20106146'
		* def benefitCaseNumber = 'WCE10060068498'
		
    Scenario:  customer api payment-preferences
		* def path = '/cases/<path-benefitCaseNumber>/occupations'			
        * replace path.path-benefitCaseNumber = benefitCaseNumber
		
		Given url CUSTOMER_API_URL + path			
		* configure headers = GET_HTTP_HEADER
			And header userid = 'MYACC:' + customerNo		   
		 
		When method get
		* string responseStr = karate.pretty(response)
		* karate.write(responseStr, '../src/test/java/app/api/reload/api-customer/occupation/occupations-basic-flow-response 24.5.txt')
		* print response			
		Then status 200
		