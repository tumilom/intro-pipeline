@customer_addTaxCodeRecord
Feature: customer addTaxCodeRecord

    Background: 		
		# For a unit testing uncomment line below, update value
		# customerUserId must be registered first
		# * def customerNo = '20098879'
		
		* def JavaApp = Java.type('app.App');
		* def effectiveDate = JavaApp.daysFromNow('0','yyyy-MM-dd')			
		
    Scenario:  
		* def path = '/addTaxCodeRecord'	
		* def body = read('classpath:app/api/reload/api-customer/posts/addTaxCodeRecord.json')				
		
		Given url CUSTOMER_API_URL + path		
		* configure headers = GET_HTTP_HEADER        
		And header userid =  'MYACC:' +	customerNo				
		
		And request body
        When method post
		* print response
		 Then status 200
		
		* def taxTypeDetailsId = karate.jsonPath(response, "$.taxTypeDetailsId")	
		* print taxTypeDetailsId
       