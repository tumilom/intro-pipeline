@customer_eForms
Feature: customer_eForms
    Background: 
		# For a given customer, get eForms
		# For a unit testing uncomment line below, update value
		# customerUserId must be registered first
		#* def customerNo = '20138028'
		#* def subcaseNo = '10060084870-RP'
		#* def eFormType = 'Consent Details'
		
    Scenario:  customer api payment-preferences
		* def path = '/cases/<path-subcaseNo>/eForms'			
        * replace path.path-subcaseNo = subcaseNo
		
		Given url CUSTOMER_API_URL + path			
		* configure headers = GET_HTTP_HEADER
			And header userid = 'MYACC:' + customerNo		   
			And param eFormTypes = eFormType	   
		 
		When method get
		* def ocExtraDataOids = karate.jsonPath(response, "$[*].eformTypeId")
		* print ocExtraDataOids	
		
		* def eformOid = ocExtraDataOids[0]		
		* def pos = eformOid.lastIndexOf('-')
		
		# trim off leading zeros in I value
		
		* def eformIvalue = parseInt(eformOid.substring(pos + 1 , eformOid.length))
		* print eformIvalue
		* def CValue = parseInt(eformOid.substring(3 , pos))
		* def eformCandI = CValue + '-' + eformIvalue
		* print eformCandI
		
		* print response			
		Then status 200