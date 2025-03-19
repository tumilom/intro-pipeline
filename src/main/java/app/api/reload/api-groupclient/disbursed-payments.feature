@ignore
@gc_disbursed-payments
Feature: gcapi disbursed-payments

    Background: 
		# For a given claim, get disbursed-payments, ERA employers payments ie,  setup as employer of collection point earnings and ERA employer with payments in payment history

		# For a unit testing uncomment line below, remove @ignore		
		# * def claimNumber = '10060066378'
		
		
    Scenario:
		* def path = '/claims/<path-claimNumber>/disbursed-payments'		
		* replace path.path-claimNumber = claimNumber		
		
		Given url GC_API_URL + path			
		* configure headers = GET_HTTP_HEADER
			And header userid = gcUserId	
		 
		When method get
		* print response
		#* string responseStr = karate.pretty(response)
		#* karate.write(responseStr, '../src/test/java/app/api/reload/api-groupclient/disbursed-payments/disbursed-payments-response 24.5.txt')
		* def peiIds = karate.jsonPath(response, "$.elements[*].id")
		* print peiIds		
		Then status 200
		