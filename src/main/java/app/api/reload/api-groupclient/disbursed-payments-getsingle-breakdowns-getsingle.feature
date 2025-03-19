@ignore
@gc_disbursed-payments-getsingle-breakdowns-getsingle
Feature: gcapi disbursed-payments-getsingle-breakdowns-getsingle

    Background: 
		# For a given claim, get payment lines of breakdwown, ERA employers payments ie,  setup as employer of collection point earnings and ERA employer with payments in payment history

		# For a unit testing uncomment line below, remove @ignore		
		# * def claimNumber = '10060066378'
		
		
    Scenario:
		* def path = '/claims/<path-claimNumber>/disbursed-payments/<path-peiId>/breakdowns/<path-paymentLineId>'		
		* replace path.path-claimNumber = claimNumber
		* replace path.path-peiId = peiId	
		* replace path.path-paymentLineId = paymentLineId		
		
		Given url GC_API_URL + path			
		* configure headers = GET_HTTP_HEADER
			And header userid = gcUserId	
		 
		When method get
		* print response
		#* string responseStr = karate.pretty(response)
		#* karate.write(responseStr, '../src/test/java/app/api/reload/api-groupclient/disbursed-payments/disbursed-payments-getsingle-breakdowns-getsingle-response 24.5.txt')
		
		Then status 200
		