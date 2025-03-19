@registerCustomer
Feature: register Customer :creates an EOS user id for a given customer, expects an empty payload

    Background: 		
		# For a unit testing uncomment line below, update value, remove @ignore		
		# 
		#* def customerNo = '20106297'		
		* def userId = 'ANONYMOUS_USER'		
		
    Scenario:  customerapi register customer
		
		* def path = '/registerCustomer'	
		* def body = read('classpath:app/api/reload/api-customer/posts/registerCustomer.json')			
		
		Given url CUSTOMER_API_URL + path	
                
        * configure headers = GET_HTTP_HEADER
        And header userid = 'ANONYMOUS_USER'
        And header ExternalUserId = 'MYACC:' + customerNo
		
		And request body
        When method post		     
        Then status 200