@ignore
@update-managed-indicators-not-sensitive
Feature:
    Scenario: Update MYACC managed indicator for <eosCustomerNo>
		
    Background:
        * def configParam = 'UpdateMyAccManagedIndicatorStatus'
		* def myACCCustomerNo = 'MYACC:20103029'
		* def claimNo = '10060066371'



        Given url WSC_CSS_URL +  configParam
        * configure headers  = WSC_HTTP_HEADERS
        And param param_str_claimno = claimNo
		And param param_str_userid = myACCCustomerNo
        * def payload = read('classpath:app/api/reload/services-css/posts/updateManagedIndicators/update-managed-indicators-not-sensitive.xml') 
        And request payload
        When method post
		* string responseStr = response
		* karate.write(responseStr, '../src/test/java/app/api/reload/services-css/posts/updateManagedIndicators/update-managed-indicators-not-sensitive 24.2.txt')
        * print response
        Then status 200
		
	