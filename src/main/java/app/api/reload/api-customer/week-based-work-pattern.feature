@customer_week-based-work-pattern
Feature: customer week-based-work-pattern
    Background: 
		# For a given customer, get week-based-work-pattern
		# For a unit testing uncomment line below, update value
		# customerUserId must be registered first
		# * def customerNo = '20103046'
		# * def benefitCaseNumber = 'WCE10060066398'
		# * def occupationId = '11614-78542860'
		 
		
    Scenario:  customer api week-based-work-pattern
		* def path = '/cases/<path-benefitCaseNumber>/occupations/<path-occupationId>/week-based-work-pattern'	

		* replace path.path-benefitCaseNumber = benefitCaseNumber	
		* replace path.path-occupationId = occupationId			
        
		Given url CUSTOMER_API_URL + path			
		* configure headers = GET_HTTP_HEADER
			And header userid = 'MYACC:' + customerNo		   
		 
		When method get
		* print response			
		Then status 403