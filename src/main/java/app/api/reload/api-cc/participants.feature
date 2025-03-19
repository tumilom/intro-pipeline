@ignore
@cc_participants
Feature: ccapi participants
    Background: 
		# For a claim, get a list of participants
		# For a unit testing uncomment line below, update claimNumber value, remove @ignore		
		#* def claimNumber = '10060066376'
		
    Scenario: <customerNo> <claimNumber> get a list of participants of a claim
		* def path = '/cases/<path-claimNumber>/participants'
		* replace path.path-claimNumber = claimNumber
		
        Given url CONTACT_CENTRE_API_URL + path
		
        * configure headers = JSONAPI_HTTP_HEADERS_CC		
		 
		When method get
		* print response
		* def roleName = karate.jsonPath(response, "$.elements[0].roleName")
		* print roleName		
		Then status 200
		