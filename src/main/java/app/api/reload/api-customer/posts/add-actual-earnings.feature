@customer_add-actual-earnings
Feature: customer add an earnings at benefit level

    Background: 		
		# For a unit testing uncomment line below, update value	
		# customer UserId must be registered first
		#* def customerNo = '20117029'
		#* def benefitCaseNumber = 'WCE10060074371'
		#* def occupationId = '11614-78542858'
		
    Scenario:  ccapi add payment preference
		* def path = '/cases/<path-benefitCaseNumber>/occupations/<path-occupationId>/actual-earnings'	
		* def body = read('classpath:app/api/reload/api-customer/posts/add-actual-earnings.json')				
		
		* replace path.path-benefitCaseNumber = benefitCaseNumber
		* replace path.path-occupationId = occupationId		
			
		* configure headers = GET_HTTP_HEADER        
		And header userid = 'MYACC:' +	customerNo		
		Given url CUSTOMER_API_URL + path			
		
		And request body
        When method post
        Then status 201