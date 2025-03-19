@ignore
@gc_employer-disbursed-payments
Feature: gcapi disbursed-payments

    Background: 
		# For a given claim, get employer disbursed-payments, ERA employers payments ie,  setup as employer of collection point earnings and ERA employer with payments in payment history

		# For a unit testing uncomment line below, remove @ignore		
				
		
    Scenario:
		* def path = '/claims/disbursed-payments'		
				
		Given url GC_API_URL + path			
		* configure headers = GET_HTTP_HEADER
			And header userid = gcUserId	
		 
		When method get
		* print response
		#* string responseStr = karate.pretty(response)
		#* karate.write(responseStr, '../src/test/java/app/api/reload/api-groupclient/disbursed-payments/employer-disbursed-payments-response 24.5.txt')
		* def peiIds = karate.jsonPath(response, "$.elements[*].id")
		* print peiIds		
		Then status 200
		