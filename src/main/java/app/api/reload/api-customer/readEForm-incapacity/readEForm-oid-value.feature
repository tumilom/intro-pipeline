@customer_readEForm-oid-value
Feature: customer_readEForm
    Background: 
		# For a given customer, get eForms cases/10060084870/readEForm/11212-144615700, response: 
		# For a unit testing uncomment line below, update value
		# customerUserId must be registered first
		* def customerNo = '20106297'
		* def subcaseNo = '10060068772'
		* def oid = '11212-0144596098'
		
    Scenario:  customer api readEForm
		* def path = '/cases/<path-subcaseNo>/eforms/<path-oid>'			
        * replace path.path-subcaseNo = subcaseNo
	    * replace path.path-oid = oid

		
		Given url CUSTOMER_API_URL + path			
		* configure headers = GET_HTTP_HEADER
			And header userid = 'MYACC:' + customerNo		   			
		 
		When method get
		* string responseStr = karate.pretty(response)
		* karate.write(responseStr, '../src/test/java/app/api/reload/api-customer/readEForm-medical-incapacity/readEForm-oid-value-basic-flow-response 24.5.txt')
		* print response			
		Then status 200
		