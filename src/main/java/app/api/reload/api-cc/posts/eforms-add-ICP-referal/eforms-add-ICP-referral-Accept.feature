@ignore
@cc_eforms-add-ICP-referral-Accept
Feature: ccapi add an eform

   Background: 		
		# For a unit testing uncomment line below, update value, remove @ignore		
		#* def claimNumber = '10060066384'
	
		
    Scenario:  ccapi add eforms
		* def path = '/cases/<path-claimNumber>/eforms'	
		* def body = read('classpath:app/api/reload/api-cc/posts/eforms-add-ICP-referal/eforms-add-ICP-referral-Accept.json')
		* replace path.path-claimNumber = claimNumber
		
		Given url CONTACT_CENTRE_API_URL + path		
        * configure headers = GET_HTTP_HEADER	
		And header userid = 'PS-AA6334'
		
		And request body
        When method post
		* print response
        Then status 201