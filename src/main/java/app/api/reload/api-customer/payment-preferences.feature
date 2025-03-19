@customer_payment-preferences
Feature: customer payment-preferences
    Background: 
		# For a given customer, get payment preferences
		# For a unit testing uncomment line below, update customerNo  value, remove @ignore
		# customerUserId must be registered first
		# * def customerNo = '20100644'
		
    Scenario:  customer api payment-preferences
		* def path = '/payment-preferences'				
        
		Given url CUSTOMER_API_URL + path			
		* configure headers = GET_HTTP_HEADER
			And header userid = 'MYACC:' + customerNo		   
		 
		When method get
		* print response			
		Then status 200
		