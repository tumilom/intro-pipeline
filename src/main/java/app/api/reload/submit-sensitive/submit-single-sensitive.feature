Feature:
    Background: 
        * def configParam = 'UploadXmlDocument'
		* def xmlStart = read('classpath:app/api/reload/submit-sensitive/acc-sensitive-envelope-prefix.txt') + '<![CDATA['
		* def xmlStop = ']]>' + read('classpath:app/api/reload/submit-sensitive/acc-sensitive-envelope-suffix.txt') 
		* def JavaApp = Java.type('app.App');
		#* def dateNow = JavaApp.daysFromNow('0')
		#* def declarationDate =  JavaApp.daysFromNow('-4')
		
    Scenario: Submit Sensitive Engagement Form 
		* print 'About to submit Engagement Form for ' + acc45ClaimNumber +' claim'

        Given url WSC_PS_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        
		* xmlstring accMsg = read('classpath:app/api/reload/submit-sensitive/UploadXmlDocument-sensitive-request.xml')
		* def payload = xmlStart + accMsg.replaceAll('xmlns=""','') + xmlStop
		And request payload
        When method post
		* print response
        Then status 200
		Then match response count(/WSUpdateResponse/oid-list/oid) == 4
		Then match response /WSUpdateResponse/additional-data-set/additional-data[./name/text()='SERVICE_RESPONSE_CODE']/value == '200'

       