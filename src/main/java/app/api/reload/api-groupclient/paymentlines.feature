#@ignore
@gc_paymentLines
Feature: gcapi paymentLines endpoint NOT USED by ACC

    Background: can only get the paymentlines for main claimant
		# For a given claim, get paymentLines
		# For a unit testing uncomment line below, remove @ignore		
		 #* def claimNumber = '10060066392'		
		 # * def peiId = '7326-22993698'
		#* def gcUserId = 'GC-A1323118E'
		
    Scenario:
		* def path = '/claims/<path-claimNumber>/payments/<path-paymentId>/paymentLines'		
		* replace path.path-claimNumber = claimNumber
		* replace path.path-paymentId = 'PE-' + peiId
		* print path
		Given url GC_API_URL + path			
		* configure headers = GET_HTTP_HEADER
			And header userid = gcUserId	
		 
		When method get
		* print response
		
		Then status 200
		