
@cc_amounts-pending-paymentS4 
Feature: ccapi amounts-pending-payment 

    Background: 
		# For a given claim, get amounts-pending-payment , payments in tolallocationInstruction not in OLPaymentOutEvent
		# For a unit testing uncomment line below, remove @ignore		
		* def claimNumber = '10060066387'
				
    Scenario:payeeid given
		* def path = '/claims/<path-claimNumber>/amounts-pending-payment?sort=periodStartDate'
		* replace path.path-claimNumber = claimNumber		
		
		Given url CONTACT_CENTRE_API_URL + path			
		* configure headers = JSONAPI_HTTP_HEADERS_CC
			
		 
		When method get
		* print response
	#	* string responseStr = karate.pretty(response)
	#	* karate.write(responseStr, '../src/main/java/app/api/reload/api-cc/amounts-pending-payment/amounts-pending-payment-responseS1 24.8.txt')
		
		Then status 200
	