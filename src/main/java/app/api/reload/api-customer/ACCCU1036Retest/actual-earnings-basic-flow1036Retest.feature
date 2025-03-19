@ignore
@customer_actual-earnings-basic-flow1036Retest
Feature: customer actual-earnings
    Background: 
		# For a given customer, get benefit case actual earnings
		# For a unit testing uncomment line below, update   value
		# customerUserId must be registered first
		* def customerNo = '20103326'
		* def benefitCaseNumber = 'WCE10060071468'
		* def occupationId = '11614-78553732'
		 
		
    Scenario:  customer api actual-earnings
		* def path = '/cases/<path-benefitCaseNumber>/occupations/<path-occupationId>/actual-earnings'	

		* replace path.path-benefitCaseNumber = benefitCaseNumber	
		* replace path.path-occupationId = occupationId			
        
		Given url CUSTOMER_API_URL + path			
		* configure headers = GET_HTTP_HEADER
			And header userid = 'MYACC:' + customerNo		   
		 
		When method get
		* string responseStr = karate.pretty(response)
		* karate.write(responseStr, '../src/test/java/app/api/reload/api-customer/ACCCU1036Retest/actual-earnings-basic-flow1036Retest-response 24.5.txt')
		* print response			
		Then status 200		