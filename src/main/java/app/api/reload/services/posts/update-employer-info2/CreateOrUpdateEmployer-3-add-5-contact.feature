@ignore
@CreateOrUpdateEmployer-3-add-5-contact
Feature:
    Background: 
        * def JavaApp = Java.type('app.App');
		* def dateNow = JavaApp.daysFromNow('0')
    Scenario: Update employer alternate, business & claim reporting address and mobile, work, email, fax, alt phone & alt work. Add Point of contact record.
        Given url WSC_JUNO_URL + 'CreateOrUpdateEmployer'
        * configure headers  = WSC_HTTP_HEADERS
 
		* def payload = read('classpath:app/api/reload/services/posts/update-employer-info2/CreateOrUpdateEmployer-3-add-5-contact-request.xml') 
        * print 'Updating employer <employerId> info'
       
	   And request payload
        When method post
		* print response
        Then status 200
		Then match response count(/WSUpdateResponse/oid-list/oid) == 1
		