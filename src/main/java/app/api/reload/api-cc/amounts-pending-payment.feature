
@cc_amounts-pending-payment 
Feature: ccapi amounts-pending-payment 

    Background: 
		# For a given claim, get amounts-pending-payment , payments in tolallocationInstruction not in OLPaymentOutEvent
		# For a unit testing uncomment line below, remove @ignore		
		* def claimNumber = '10060066387'
				
    Scenario:
		* def path = '/claims/<path-claimNumber>/amounts-pending-payment'		
		* replace path.path-claimNumber = claimNumber		
		
		Given url CONTACT_CENTRE_API_URL + path			
		* configure headers = JSONAPI_HTTP_HEADERS_CC
			
		 
		When method get
		* print response
	#	* string responseStr = karate.pretty(response)
	#	* karate.write(responseStr, '../src/test/java/app/api/reload/api-groupclient/amounts-pending-payment/amounts-pending-payment-response 24.8.txt')
		
		Then status 200
	