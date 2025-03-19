@ignore
@cc_add-activities
Feature: ccapi add add-activities

    Background: 		
		# For a unit testing uncomment line below, update value, remove @ignore		
		
		#* def caseNo = '10060066370'
		
		* def JavaApp = Java.type('app.App');
		* def targetDate = JavaApp.daysFromNow('2','yyyy-MM-dd')+'T01:01:01Z'		
		
    Scenario:  ccapi add add-activities
		* def path = '/cases/<path-caseNo>/activities'	
		* def body = read('classpath:app/api/reload/api-cc/posts/add-activities.json')		
		
		* replace path.path-caseNo = caseNo
		
		Given url CONTACT_CENTRE_API_URL + path		
        * configure headers = JSONAPI_HTTP_HEADERS_CC	
		
		And request body
        When method post
		* print response
		* def actOid = karate.jsonPath(response, "$.id")
		* print actOid
        Then status 201
		