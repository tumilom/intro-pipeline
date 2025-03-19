@ignore
@cc_contacts-email
Feature: ccapi contacts case email contacts
    Background: 
		# get a list of emailcontacts				
		* def contactMethod = 'e-mail'
    Scenario: 
		* def path = '/cases/<path-caseNo>/contacts'
		* replace path.path-caseNo = caseNo
		
        Given url CONTACT_CENTRE_API_URL + path		
        * configure headers = JSONAPI_HTTP_HEADERS_CC		
		And param methodOfContact.name = contactMethod
		 
		When method get
		* print response		
		Then status 200
	