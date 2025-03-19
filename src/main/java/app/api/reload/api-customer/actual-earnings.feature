@customer_actual-earnings
Feature: customer actual-earnings
    Background: 
		# For a given customer, get benefit case actual earnings
		# For a unit testing uncomment line below, update   value
		# customerUserId must be registered first
		# * def customerNo = '20103046'
		# * def benefitCaseNumber = 'WCE10060066398'
		# * def occupationId = '11614-78542860'
		 
		
    Scenario:  customer api actual-earnings
		* def path = '/cases/<path-benefitCaseNumber>/occupations/<path-occupationId>/actual-earnings'	

		* replace path.path-benefitCaseNumber = benefitCaseNumber	
		* replace path.path-occupationId = occupationId			
        
		Given url CUSTOMER_API_URL + path			
		* configure headers = GET_HTTP_HEADER
			And header userid = 'MYACC:' + customerNo		   
		 
		When method get
		* print response			
		Then status 200		