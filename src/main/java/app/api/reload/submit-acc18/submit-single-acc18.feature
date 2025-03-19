Feature:
    Background: 
        * def configParam = 'UploadXmlDocument'
		* def xmlStart = read('classpath:app/api/reload/submit-acc18/acc18-envelope-prefix.txt') + '<![CDATA['
		* def xmlStop = ']]>' + read('classpath:app/api/reload/submit-acc18/acc18-envelope-suffix.txt') 
		* def JavaApp = Java.type('app.App');
		#* def dateNow = JavaApp.daysFromNow('0')
		#* def declarationDate =  JavaApp.daysFromNow('-4')
		
    Scenario: Submit ACC18 
		* print 'About to register med cert for ' + acc45ClaimNumber +' claim'

        Given url WSC_PS_URL
        * configure headers  = WSC_HTTP_HEADERS
        And param config = configParam		
		* xmlstring acc18msg = read('classpath:app/api/reload/submit-acc18/UploadXmlDocument-'+defType+'-request.xml')
		* def payload = xmlStart + acc18msg.replaceAll('xmlns=""','') + xmlStop
		And request payload
        When method post
		* print response
        Then status 200
		Then match response count(/WSUpdateResponse/oid-list/oid) == 5
		Then match response /WSUpdateResponse/additional-data-set/additional-data[./name/text()='SERVICE_RESPONSE_CODE']/value == '200'

       