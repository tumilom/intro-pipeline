@ignore
@CreateOrUpdateEmployer-invalid1
Feature:
    Background: 
        * def JavaApp = Java.type('app.App');
		* def dateNow = JavaApp.daysFromNow('0')
    Scenario: Update employer business, alternate, claim reporting and home. More than 3 address update is not allowed.
        Given url WSC_JUNO_URL + 'CreateOrUpdateEmployer'
        * configure headers  = WSC_HTTP_HEADERS
 
		* def payload = read('classpath:app/api/reload/services/posts/update-employer-invalid1/CreateOrUpdateEmployer-invalid1-request.xml') 
        * print 'Updating employer <employerId> info'
       
	   And request payload
        When method post
		* string responseStr = response
		* karate.write(responseStr, '../src/test/java/app/api/reload/services/posts/update-employer-invalid1/CreateOrUpdateEmployer-invalid1-response 24.2.txt')
		* print response
        Then status 500