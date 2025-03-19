@ignore
@cc_add-contacts-case
Feature: ccapi edit contact on case

    Background: 		
		# For a unit testing uncomment line below, update value, remove @ignore		
		
		#* def caseNo = '10060066370'
		
		* def JavaApp = Java.type('app.App');
		* def effectiveDate = JavaApp.daysFromNow('0','yyyy-MM-dd')+'T01:01:01Z'		
		
    Scenario:  ccapi edit contact on case
		* def path = '/cases/<path-caseNo>/contacts/<path-contact-oid>/edit'	
		* def contactNarrative = 'Edited by Karate'
		* def body = read('classpath:app/api/reload/api-cc/posts/add-contacts-case.json')		
		
		* replace path.path-caseNo = caseNo
		* replace path.path-contact-oid = contactOid
		
		Given url CONTACT_CENTRE_API_URL + path		
        * configure headers = JSONAPI_HTTP_HEADERS_CC	
		
		And request body
        When method post
        Then status 200
		
		