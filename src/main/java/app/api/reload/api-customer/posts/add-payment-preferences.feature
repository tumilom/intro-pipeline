@customer_add-payment-preferences
Feature: customer add a payment preference

    Background: 		
		# For a unit testing uncomment line below, update value, remove @ignore		
		# customerUserId must be registered first
		# * def customerNo = '20100644'
		
    Scenario:  ccapi add payment preference
		* def path = '/payment-preferences'	
		* def body = read('classpath:app/api/reload/api-customer/posts/add-payment-preferences.json')				
		
		Given url CUSTOMER_API_URL + path		
		   
		 * configure headers = GET_HTTP_HEADER
			And header userid = 'MYACC:' + customerNo
		
		And request body
        When method post
		* print response
        Then status 201