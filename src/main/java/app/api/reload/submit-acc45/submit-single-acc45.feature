
Feature:
    Background: 
        * def configParam = 'UploadXmlDocument'
		* def xmlStart = read('classpath:app/api/reload/submit-acc45/acc45-envelope-prefix.txt') + '<![CDATA['
		* def xmlStop = ']]>' + read('classpath:app/api/reload/submit-acc45/acc45-envelope-suffix.txt') 
		* def JavaApp = Java.type('app.App');
		* def creationDate = JavaApp.daysFromNow('-1')
		#* def declarationDate =  JavaApp.daysInPast('<lodgementOffset>','yyyy-MM-dd') +'T00:00:00'
		#* def lodgementDate = JavaApp.daysInPast('<lodgementOffset>')
		#* def accidentDate = JavaApp.daysInPast('<lodgementOffset>','yyyy-MM-dd')
		#* def dobDate = JavaApp.daysInPast('<dobOffset>','yyyy-MM-dd')
		#* def altWorkDate = JavaApp.daysFromNow('7')
		#* def incapacityPeriod = '180'
		#* def returnToWorkDate = JavaApp.daysFromNow(incapacityPeriod,'yyyy-MM-dd')+'T00:00:00'
		#* def fullIncapacityStartDate = JavaApp.daysInPast('<lodgementOffset>','yyyy-MM-dd') +'T00:00:00'		
		#* def claimFormNumber = RUNID + '<seq>'
		#* def claimantLastName =  claimFormNumber + lastname
    
    Scenario: Submit ACC45 
		
		* print 'About to register '+ claimFormNumber +' claim'
		
        Given url WSC_PS_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        And header userid = UPLOADXMLDOC_USERID
		* xmlstring acc45msg = read('classpath:app/api/reload/submit-acc45/Acc45'+defType+'-request.xml')
		* def payload = xmlStart + acc45msg.replaceAll('xmlns=""','') + xmlStop
		And request payload
        When method post
        * print response
        Then status 200
		Then match response count(/WSUpdateResponse/oid-list/oid) == 4
		Then match response /WSUpdateResponse/additional-data-set/additional-data[./name/text()='SERVICE_RESPONSE_CODE']/value == '200'
