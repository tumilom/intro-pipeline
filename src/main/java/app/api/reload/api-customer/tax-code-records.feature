@customer_tax-code-records
Feature: customer tax-code-records
    Background: 
		# For a given customer, get tax-code-records
		# For a unit testing uncomment line below, update customerNo  value,
		# customerUserId must be registered first
		# * def customerNo =  '20100644'
		
    Scenario:  customer api payment-preferences
		* def path = '/tax-code-records'
				
       Given url CUSTOMER_API_URL + path	
	   * configure headers = GET_HTTP_HEADER
		And header userid = 'MYACC:' + customerNo		   
		 
		When method get
		* print response			
		Then status 200
		