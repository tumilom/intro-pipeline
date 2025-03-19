@ignore
@cc_edit-payment-preferences
Feature: ccapi edit a payment preference

    Background: 		
		# For a unit testing uncomment line below, update value, remove @ignore		
		#* def customerNo = '20093047'
		#* def paymentPreferenceId = '7706-2191323'
		#* def etag = 'e49d18da585094619881bf0f9cfd5efeb180d359bf24d82b88551578a1a1fea5'
		
    Scenario:  ccapi add payment preference
		* def path = '/customers/<path-customerNo>/payment-preferences/<path-paymentPreferenceId>/edit'	
		* def body = read('classpath:app/api/reload/api-cc/posts/edit-payment-preferences.json')		
		* replace path.path-customerNo = customerNo
		* replace path.path-paymentPreferenceId = paymentPreferenceId
						
		Given url CONTACT_CENTRE_API_URL + path		
        * configure headers = JSONAPI_HTTP_HEADERS_CC	
		And header If-Match = etag	
		
		And request body
        When method post
        Then status 200