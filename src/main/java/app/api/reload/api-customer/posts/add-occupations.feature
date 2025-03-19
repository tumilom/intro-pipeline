@customer_add-occupations
Feature: customer add an occupations at benefit level

    Background: 		
		# For a unit testing uncomment line below, update value	
		# customer UserId must be registered first
		#* def customerNo = '20117029'
		#* def benefitCaseNumber = 'WCE10060074371'
		
    Scenario:  ccapi add payment preference
		* def path = '/cases/<path-benefitCaseNumber>/occupations'	
		* def body = read('classpath:app/api/reload/api-customer/posts/add-occupations.json')				
		
		* replace path.path-benefitCaseNumber = benefitCaseNumber
		
			
		* configure headers = GET_HTTP_HEADER        
		And header userid = 'MYACC:' +	customerNo		
		Given url CUSTOMER_API_URL + path			
		
		And request body
        When method post
        Then status 201