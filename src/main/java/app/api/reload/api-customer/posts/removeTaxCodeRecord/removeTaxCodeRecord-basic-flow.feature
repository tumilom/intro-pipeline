@ignore
@customer_removeTaxCodeRecord-basic-flow
Feature: customer remove Tax Code Record

    Background: 		
		# For a unit testing uncomment line below, update value	
		# customerUserId must be registered first
		# taxCodeId -  I value of OLTaxTypeDetails
		* def customerNo = '20147030'
		* def taxCodeId = '2245154'		
		
    Scenario:  
		* def path = '/<path-taxCodeId>/removeTaxCodeRecord'			
				
		* replace path.path-taxCodeId = taxCodeId		
		
		Given url CUSTOMER_API_URL + path		
		* configure headers = GET_HTTP_HEADER
        Given header Content-Type = 'application/json'		
		And header userid = 'MYACC:' +	customerNo		
				
        When method post
        Then status 200