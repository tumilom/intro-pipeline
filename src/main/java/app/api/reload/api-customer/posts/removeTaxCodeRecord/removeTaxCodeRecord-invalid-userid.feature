@ignore
@customer_removeTaxCodeRecord-invalid-userid
Feature: customer remove Tax Code Record

    Background: 		
		# For a unit testing uncomment line below, update value	
		# customerUserId must be registered first
		# taxCodeId -  I value of OLTaxTypeDetails
		* def customerNo = '20147039'
		* def taxCodeId = '2245154'		
		
    Scenario:  
		* def path = '/<path-taxCodeId>/removeTaxCodeRecord'			
				
		* replace path.path-taxCodeId = taxCodeId		
		
		Given url CUSTOMER_API_URL + path		
		* configure headers = GET_HTTP_HEADER
        Given header Content-Type = 'application/json'		
		And header userid = 'MYACC:' +	customerNo		
				
        When method post
		* string responseStr = karate.pretty(response)
		* karate.write(responseStr, '../src/test/java/app/api/reload/api-customer/posts/removeTaxCodeRecord/removeTaxCodeRecord invalid userid reponse 24.2.txt')
		* print response
        Then status 200