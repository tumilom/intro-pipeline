@customer_readEForm
Feature: customer_readEForm
    Background: 
		# For a given customer, get eForms cases/10060084870-RP/readEForm/11212-144615700, response: 
		# For a unit testing uncomment line below, update value
		# customerUserId must be registered first
		#* def customerNo = '20138028'
		#* def subcaseNo = '10060084870-RP'
		#* def oid = '11212-144615700'
		
    Scenario:  customer api readEForm
		* def path = '/cases/<path-subcaseNo>/readEForm/<path-oid>'			
        * replace path.path-subcaseNo = subcaseNo
		 * replace path.path-oid = oid
		
		Given url CUSTOMER_API_URL + path			
		* configure headers = GET_HTTP_HEADER
			And header userid = 'MYACC:' + customerNo		   			
		 
		When method get
		* print response			
		Then status 200
		