@ignore
@cc_add-contacts-party
Feature: ccapi add add-contacts-party

    Background: 		
		# For a unit testing uncomment line below, update value, remove @ignore		
		
		#* def caseNo = '10060066370'
		
		* def JavaApp = Java.type('app.App');
		* def effectiveDate = JavaApp.daysFromNow('0','yyyy-MM-dd')+'T01:01:01Z'		
		
    Scenario:  ccapi add add-contacts
		* def path = '/customers/<path-customerNo>/contacts'	
		* def body = read('classpath:app/api/reload/api-cc/posts/add-contacts-party.json')		
		
		* replace path.path-customerNo = customerNo
		
		Given url CONTACT_CENTRE_API_URL + path		
        * configure headers = JSONAPI_HTTP_HEADERS_CC	
		
		And request body
        When method post
        Then status 201
		
		