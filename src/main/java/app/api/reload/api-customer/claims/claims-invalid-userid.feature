@ignore
@customer_claims-invalid-userid
Feature: customer claims
    Background: 
		# For a given customer, get claims
		# For a unit testing uncomment line below, update customerNo  value,
		# customerUserId must be registered first
		* def customerNo =  '20147039'
		
    Scenario:  customer api payment-preferences
		* def path = '/claims'
				
       Given url CUSTOMER_API_URL + path	
	   * configure headers = GET_HTTP_HEADER
		And header userid = 'MYACC:' + customerNo		   
		 
		When method get
		* string responseStr = karate.pretty(response)
		* karate.write(responseStr, '../src/test/java/app/api/reload/api-customer/claims/claims-invalid-userid reponse 24.2.txt')
			* print response			
		Then status 200
		