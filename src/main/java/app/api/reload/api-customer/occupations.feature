@customer_occupations
Feature: customer occupations
    Background: 
		# For a given customer, get occupations
		# For a unit testing uncomment line below, update customerNo  value
		# customerUserId must be registered first
		# * def customerNo = '20100644'
		#* def benefitCaseNumber = 'WCE10060074371'
		
    Scenario:  customer api payment-preferences
		* def path = '/cases/<path-benefitCaseNumber>/occupations'			
        * replace path.path-benefitCaseNumber = benefitCaseNumber
		
		Given url CUSTOMER_API_URL + path			
		* configure headers = GET_HTTP_HEADER
			And header userid = 'MYACC:' + customerNo		   
		 
		When method get
		* print response			
		Then status 200
		