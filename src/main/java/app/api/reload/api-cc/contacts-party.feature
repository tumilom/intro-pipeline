@ignore
@cc_contacts-party
Feature: ccapi contacts
    Background: 
		# For a claim, get a list of contacts
		
    Scenario: 
		* def path = '/customers/<path-customerNo>/contacts'
		* replace path.path-customerNo = customerNo
		
        Given url CONTACT_CENTRE_API_URL + path
		
        * configure headers = JSONAPI_HTTP_HEADERS_CC		
		 
		When method get
		* print response
		
		Then status 200
		