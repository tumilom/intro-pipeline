@ignore
@capi_approvalOrders-HL
Feature: capi approval-orders
    Background: 
		# For a given claim, get approval-orders 
		# For a unit testing uncomment line below, update claimNumber value, remove @ignore		
		* def claimNumber = '10060069873'
		* def orderType = 'service'
		* def customerNo = '20094671'
		* configure logPrettyResponse = true
		
    Scenario: <claimNumber> approval-orders
		* def path = '/claims/<path-claimNumber>/approvalOrders'	
		* replace path.path-claimNumber = claimNumber
		
       
		Given url CUSTOMER_API_URL + path			
		* configure headers = GET_HTTP_HEADER
			And header userid = 'MYACC:' + customerNo		
		    And param orderType = orderType
	
		 
		When method get
		* string responseStr = karate.pretty(response)
		* karate.write(responseStr, '../src/test/java/app/api/reload/api-customer/approvalOrder/approval-orders-HL-response 24.2.txt')
		* print response
		Then status 200
		
		