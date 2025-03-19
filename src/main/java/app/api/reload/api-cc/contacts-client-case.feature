@ignore
@cc_contacts-case
Feature: ccapi contacts case
    Background: 
		# get a list of contacts				
		
    Scenario: 
		* def path = '/customers/<path-customerNo>/cases/<path-caseNo>/contacts/11507-188833025/edit'
		* replace path.path-customerNo = customerNo
		* replace path.path-caseNo = caseNo
		
        Given url CONTACT_CENTRE_API_URL + path
		
        * configure headers = JSONAPI_HTTP_HEADERS_CC		
		 
		When method get
		* print response		
		Then status 200
		