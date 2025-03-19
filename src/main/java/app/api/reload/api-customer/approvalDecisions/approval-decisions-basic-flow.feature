@ignore
@capi_approvalDecisions-basic-flow
Feature: capi approval-decisions
    Background: 
		# For a given claim, get approval-decisions 
		# For a unit testing uncomment line below, update claimNumber value, remove @ignore		
		* def claimNumber = '10060066478'
		* def orderType = 'service'
		* def customerNo = '20103045'
		* def approvalOrderId = 'PE:07832:0013339607'
		
    Scenario: <claimNumber> approval-decisions
		* def path = '/claims/<path-claimNumber>/approvalOrders/<path-approvalOrderId>/decisions'		
		* replace path.path-claimNumber = claimNumber
		* replace path.path-approvalOrderId = approvalOrderId
		
        Given url CUSTOMER_API_URL + path			
		* configure headers = GET_HTTP_HEADER
			And header userid = 'MYACC:' + customerNo		
		    And param orderType = orderType
	
		 
		When method get
		* string responseStr = karate.pretty(response)
		* karate.write(responseStr, '../src/test/java/app/api/reload/api-customer/approvalDecisions/approval-decisions-basic-flow-response 24.2.txt')
		* print response
		Then status 200