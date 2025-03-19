@customer_readEForm-approved-incapacity
Feature: customer_readEForm
    Background: 
		# For a given customer, get eForms cases/10060084870-RP/readEForm/11212-144615700, response: 
		# For a unit testing uncomment line below, update value
		# customerUserId must be registered first
		* def customerNo = '20106297'
		* def subcaseNo = '10060068772'
		* def str_eFormType = 'Approved Incapacity Abatement'

		
    Scenario:  customer api readEForm
		* def path = '/cases/<path-subcaseNo>/eForms'			
        * replace path.path-subcaseNo = subcaseNo

		
		Given url CUSTOMER_API_URL + path			
		* configure headers = GET_HTTP_HEADER
			And header userid = 'MYACC:' + customerNo		   			
			And param eFormTypes = str_eFormType
		 
		When method get
		* string responseStr = karate.pretty(response)
		* karate.write(responseStr, '../src/test/java/app/api/reload/api-customer/readEForm-medical-incapacity/readEForm-approved-incapacity-basic-flow-response 24.5.txt')
		* print response			
		Then status 200
		