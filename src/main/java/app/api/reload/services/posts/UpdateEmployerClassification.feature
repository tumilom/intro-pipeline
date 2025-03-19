@UpdateEmployerClassification
Feature:
    Background: 
        * def JavaApp = Java.type('app.App');
		* def dateNow = JavaApp.daysFromNow('0')
    Scenario: Update employer <employerId> information    
   
    Given url WSC_JUNO_URL + 'UpdateEmployerClassification'
        * configure headers  = WSC_HTTP_HEADERS
        * print 'Updating employer <employerId> classification units'
        And request read('classpath:app/api/reload/services/posts/UpdateClassificationUnit-request.xml')
        When method post
		* print response
        Then status 200
		Then match response count(/WSUpdateResponse/oid-list/oid) == 1
		#Then match response /WSUpdateResponse/additional-data-set/additional-data/value == ['<employerId>','?']