@ignore
@cc_paymentPreferences
Feature: ccapi payment-preferences
    Background: 
		# For a given customer, get payment preferences
		# For a unit testing uncomment line below, update customerNo  value, remove @ignore
		#* def customerNo = '20103034'		
		
    Scenario: <customerNo> payment-preferences
		* def path = '/customers/<path-customerNo>/payment-preferences'
		* replace path.path-customerNo = customerNo		
		
        Given url CONTACT_CENTRE_API_URL + path
		
        * configure headers = JSONAPI_HTTP_HEADERS_CC		
		 
		When method get
		* print response
		* def defaultPP = karate.jsonPath(response, "$.elements[0].default")
		* print defaultPP		
		Then status 200
		