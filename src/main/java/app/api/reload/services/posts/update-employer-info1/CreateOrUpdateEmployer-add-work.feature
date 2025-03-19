@ignore
@CreateOrUpdateEmployer-add-work
Feature:
    Background: 
        * def JavaApp = Java.type('app.App');
		* def dateNow = JavaApp.daysFromNow('0')
    Scenario: Update employer business address and point of contacts for work phone, e-mail and fax. Update the employer name.
        Given url WSC_JUNO_URL + 'CreateOrUpdateEmployer'
        * configure headers  = WSC_HTTP_HEADERS
 
		* def payload = read('classpath:app/api/reload/services/posts/update-employer-info1/CreateOrUpdateEmployer-add-work-request.xml') 
        * print 'Updating employer <employerId> info'
       
	   And request payload
        When method post
		* print response
        Then status 200
		Then match response count(/WSUpdateResponse/oid-list/oid) == 1
		