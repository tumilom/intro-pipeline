@customer_addEForm
Feature:
Background: 		
		# For a unit testing uncomment line below, update value	
		# customer UserId must be registered first
		#* def customerNo = '20117029'
		#* def subcaseNo = '10060068873-RP'
		#* def eFormType = 'Consent%20Details'

    Scenario: Add consent eform
		* def path = '/cases/<path-subcaseNo>/addEForm/<path-eFormType>'
		* def body = read('classpath:app/api/reload/api-customer/posts/add-eform-consent.json')		
		
		* replace path.path-subcaseNo = subcaseNo	
		* replace path.path-eFormType = eFormType	
			
		* configure headers = GET_HTTP_HEADER        
		And header userid = 'MYACC:' +	customerNo		
		Given url CUSTOMER_API_URL + path			
		
		And request body
        When method post
        Then status 200