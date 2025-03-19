@ignore
@cc_read-eforms-ICP
Feature: ccapi add an eform

    Background: 		
		# For a unit testing uncomment line below, update value, remove @ignore		
		#* def claimNumber = '10060098897-ICP'
		* configure logPrettyResponse = true
		
    Scenario:  ccapi read eforms
		* def path = '/cases/<path-claimNumber>/eforms'	
		* replace path.path-claimNumber = claimNumber
		
		Given url CONTACT_CENTRE_API_URL + path		
        * configure headers = GET_HTTP_HEADER	
		And header userid = 'PS-AA6334'			
		
		When method get
		* string responseStr = karate.pretty(response)
		* karate.write(responseStr, '../src/test/java/app/api/reload/api-cc/posts/read-eforms-ICP-response 24.2.txt')
		* print response
		Then status 200