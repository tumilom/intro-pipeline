@ignore
@customer_actual-earnings-case-level
Feature: customer actual-earnings
    Background: 
		# For a given customer, get benefit case actual earnings
		# For a unit testing uncomment line below, update   value
		# customerUserId must be registered first
		* def customerNo = '20106146'
		* def benefitCaseNumber = '10060068497'
		* def occupationId = '11614-78547269'
		 
		
    Scenario:  customer api actual-earnings
		* def path = '/cases/<path-benefitCaseNumber>/occupations/<path-occupationId>/actual-earnings'	

		* replace path.path-benefitCaseNumber = benefitCaseNumber	
		* replace path.path-occupationId = occupationId			
        
		Given url CUSTOMER_API_URL + path			
		* configure headers = GET_HTTP_HEADER
			And header userid = 'MYACC:' + customerNo		   
		 
		When method get
		* string responseStr = karate.pretty(response)
		* karate.write(responseStr, '../src/test/java/app/api/reload/api-customer/actual-earnings/actual-earnings-case-level-response 24.5.txt')
		* print response			
		Then status 200		