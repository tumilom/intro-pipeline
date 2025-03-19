@ignore
@CreateOrUpdateEmployer-invalid2
Feature:
    Background: 
        * def JavaApp = Java.type('app.App');
		* def dateNow = JavaApp.daysFromNow('0')
    Scenario: Update employer address with an unsupported address type.
        Given url WSC_JUNO_URL + 'CreateOrUpdateEmployer'
        * configure headers  = WSC_HTTP_HEADERS
 
		* def payload = read('classpath:app/api/reload/services/posts/update-employer-invalid2/CreateOrUpdateEmployer-invalid2-request.xml') 
        * print 'Updating employer <employerId> info'
       
	   And request payload
        When method post
		* string responseStr = response
		* karate.write(responseStr, '../src/test/java/app/api/reload/services/posts/update-employer-invalid2/CreateOrUpdateEmployer-invalid2-response 24.2.txt')
		* print response
        Then status 500