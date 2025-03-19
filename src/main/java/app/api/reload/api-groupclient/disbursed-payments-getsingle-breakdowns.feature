@ignore
@gc_disbursed-payments-getsingle-breakdowns
Feature: gcapi disbursed-payments-getsingle-breakdowns

    Background: 
		# For a given claim, get single disbursed-payments breakdown, ERA employers payments ie,  setup as employer of collection point earnings and ERA employer with payments in payment history

		# For a unit testing uncomment line below, remove @ignore		
		# * def claimNumber = '10060066378'
		
		
    Scenario:
		* def path = '/claims/<path-claimNumber>/disbursed-payments/<path-peiId>/breakdowns'		
		* replace path.path-claimNumber = claimNumber
		* replace path.path-peiId = peiId		
		
		Given url GC_API_URL + path			
		* configure headers = GET_HTTP_HEADER
			And header userid = gcUserId	
		 
		When method get
		* print response
		#* string responseStr = karate.pretty(response)
		#* karate.write(responseStr, '../src/test/java/app/api/reload/api-groupclient/disbursed-payments/disbursed-payments-getsingle-breakdowns-response 24.5.txt')
		* def paymentLineIds = karate.jsonPath(response, "$.elements[*].id")
		* print paymentLineIds	
		Then status 200
		