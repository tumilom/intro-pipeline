@customer_removeTaxCodeRecord
Feature: customer remove Tax Code Record

    Background: 		
		# For a unit testing uncomment line below, update value	
		# customerUserId must be registered first
		# taxCodeId -  I value of OLTaxTypeDetails
		# * def customerNo = '20104042'
		# * def taxCodeId = '2227652'		
		
    Scenario:  
		* def path = '/<path-taxCodeId>/removeTaxCodeRecord'			
				
		* replace path.path-taxCodeId = taxCodeId		
		
		Given url CUSTOMER_API_URL + path		
		* configure headers = GET_HTTP_HEADER
        Given header Content-Type = 'application/json'		
		And header userid = 'MYACC:' +	customerNo		
				
        When method post
        Then status 200