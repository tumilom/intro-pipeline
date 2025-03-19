@customer_updateTaxCodeRecord
Feature: customer update Tax Code Record

    Background: 		
		# For a unit testing uncomment line below, update value	
		# customerUserId must be registered first
		# taxCodeId -  I value of OLTaxTypeDetails
		# * def customerNo = '20100644'
		# * def taxCodeId = '2226652'	
		* def JavaApp = Java.type('app.App');
		* def effectiveDate = JavaApp.daysFromNow('1','yyyy-MM-dd')					
		
    Scenario:  
		* def path = '/<path-taxCodeId>/updateTaxCodeRecord'			
		* def body = read('classpath:app/api/reload/api-customer/posts/updateTaxCodeRecord.json')		
		
		* replace path.path-taxCodeId = taxCodeId		
		
		Given url CUSTOMER_API_URL + path		
		* configure headers = GET_HTTP_HEADER
        Given header Content-Type = 'application/json'		
		And header userid = 'MYACC:' +	customerNo		
		
		And request body
        When method post
		* print response
        Then status 200