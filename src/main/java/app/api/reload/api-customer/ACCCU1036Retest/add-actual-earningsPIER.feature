@ignore
@customer_add-actual-earningsPIER
Feature: customer add an earnings at benefit level

    Background: 		
		# For a unit testing uncomment line below, update value	
		# customer UserId must be registered first
		#* def customerNo = '20103326'
		#* def benefitCaseNumber = 'WCE10060071468'
		#* def occupationId = '11614-78553732'
		
    Scenario:  add abatement = Post Incapacity Earnings Rate
		* def path = '/cases/<path-benefitCaseNumber>/occupations/<path-occupationId>/actual-earnings'	
		* def body = read('classpath:app/api/reload/api-customer/ACCCU1036Retest/add-actual-earningsPIER.json')				
		
		* replace path.path-benefitCaseNumber = benefitCaseNumber
		* replace path.path-occupationId = occupationId		
			
		* configure headers = GET_HTTP_HEADER        
		And header userid = 'MYACC:' +	customerNo		
		Given url CUSTOMER_API_URL + path			
		
		And request body
        When method post
        Then status 201