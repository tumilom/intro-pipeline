#@ignore
@capi_approvalOrders
Feature: capi approval-orders
    Background: 
		# For a given claim, get approval-orders 
		# For a unit testing uncomment line below, update claimNumber value, remove @ignore		
		#* def claimNumber = '10060066478'
		* def orderType = 'service'
		#* def customerNo = '20103045'
		
    Scenario: <claimNumber> approval-orders
		* def path = '/claims/<path-claimNumber>/approvalOrders'	
		* replace path.path-claimNumber = claimNumber
		
       
		Given url CUSTOMER_API_URL + path			
		* configure headers = GET_HTTP_HEADER
			And header userid = 'MYACC:' + customerNo		
		    And param orderType = orderType
	
		 
		When method get
		* print response
		* def approvalOrdeIds = karate.jsonPath(response, "$[*].approvalOrderId")
		* print "Approval Order IDs: " + approvalOrdeIds	
		* def firstApprovalOrdeId = approvalOrdeIds[0]
		* print "First Approval Order ID: " + firstApprovalOrdeId
		Then status 200
		