@ignore
@cc_add-eforms
Feature: ccapi add an eform

    Background: 		
		# For a unit testing uncomment line below, update value, remove @ignore		
		#* def claimNumber = '10060075373'
		
    Scenario:  ccapi add eforms
		* def path = '/cases/<path-claimNumber>/eforms'	
		* def body = read('classpath:app/api/reload/api-cc/posts/eforms-add-ICP-referal.json')
		* replace path.path-claimNumber = claimNumber
		
		Given url CONTACT_CENTRE_API_URL + path		
        * configure headers = JSONAPI_HTTP_HEADERS_CC		
		
		And request body
        When method post
        Then status 201