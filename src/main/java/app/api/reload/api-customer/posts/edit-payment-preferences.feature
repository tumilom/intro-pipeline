@customer_edit-payment-preferences
Feature: customer api edit a payment preference

    Background: 		
		# For a unit testing uncomment line below, update value, remove @ignore		
		# * def customerNo = '20100644'
		# * def paymentPreferenceId = '7706-2185323'
		# * def etag = '8c494f086dfe899f36242ba8a5741c5fe5050beac76f86d4d47fe2ea5f3861e4'
		 
    Scenario:  customer edit payment preference
		* def path = '/payment-preferences/<path-paymentPreferenceId>/edit'	
		* def body = read(''classpath:app/api/reload/api-customer/posts/edit-payment-preferences.json')		
		
		* replace path.path-paymentPreferenceId = paymentPreferenceId
						
		Given url CUSTOMER_API_URL + path		
		
		* configure headers = GET_HTTP_HEADER        
		And header userid =  'MYACC:' +	customerNo				
		And header If-Match = etag	
		
		And request body
        When method post
        Then status 200