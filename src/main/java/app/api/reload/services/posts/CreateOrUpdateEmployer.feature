@CreateOrUpdateEmployer
Feature:
    Background: 
        * def JavaApp = Java.type('app.App');
		* def dateNow = JavaApp.daysFromNow('0')
    Scenario: Update employer information
        Given url WSC_JUNO_URL + 'CreateOrUpdateEmployer'
        * configure headers  = WSC_HTTP_HEADERS
 
		* def payload = read('classpath:app/api/reload/services/posts/CreateOrUpdateEmployer-request.xml') 
        * print 'Updating employer <employerId> info'
       
	   And request payload
        When method post
		* print response
        Then status 200
		Then match response count(/WSUpdateResponse/oid-list/oid) == 1
		