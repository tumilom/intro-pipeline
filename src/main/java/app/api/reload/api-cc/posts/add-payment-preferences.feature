@ignore
@cc_add-payment-preferences
Feature: ccapi add a payment preference

    Background: 		
		# For a unit testing uncomment line below, update value, remove @ignore		
		#* def customerNo = '20100644'		
		
    Scenario:  ccapi add payment preference
		* def path = '/customers/<path-customerNo>/payment-preferences'	
		* def body = read('classpath:app/api/reload/api-cc/posts/add-payment-preferences.json')		
		* replace path.path-customerNo = customerNo
		
		Given url CONTACT_CENTRE_API_URL + path		
        * configure headers = JSONAPI_HTTP_HEADERS_CC	
		
		And request body
        When method post
        Then status 201