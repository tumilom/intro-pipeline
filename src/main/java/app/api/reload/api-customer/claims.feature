@customer_claims
Feature: customer claims
    Background: 
		# For a given customer, get claims
		# For a unit testing uncomment line below, update customerNo  value,
		# customerUserId must be registered first
		# * def customerNo =  '20104042'
		
    Scenario:  customer api payment-preferences
		* def path = '/claims'
				
       Given url CUSTOMER_API_URL + path	
	   * configure headers = GET_HTTP_HEADER
		And header userid = 'MYACC:' + customerNo		   
		 
		When method get
		* print response			
		Then status 200
		