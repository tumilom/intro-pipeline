@ignore
@gc_employer-disbursed-payments-getsingle-breakdowns-getsingle
Feature: gcapi disbursed-payments-getsingle-breakdowns-getsingle

    Background: 
		# For a given claim, get payment lines of breakdwown, ERA employers payments ie,  setup as employer of collection point earnings and ERA employer with payments in payment history

		# For a unit testing uncomment line below, remove @ignore				
		
    Scenario:
		* def path = '/claims/disbursed-payments/<path-peiId>/breakdowns/<path-paymentLineId>'				
		* replace path.path-peiId = peiId	
		* replace path.path-paymentLineId = paymentLineId		
		
		Given url GC_API_URL + path			
		* configure headers = GET_HTTP_HEADER
			And header userid = gcUserId	
		 
		When method get
		* print response
	#	* string responseStr = karate.pretty(response)
	#	* karate.write(responseStr, '../src/test/java/app/api/reload/api-groupclient/disbursed-payments/employer-disbursed-payments-getsingle-breakdowns-getsingle-response 24.5.txt')
		
		Then status 200
		