@ignore
@update-managed-indicators-opt-in
Feature:
    Scenario: Update MYACC managed indicator for <eosCustomerNo>
		
    Background:
        * def configParam = 'UpdateMyAccManagedIndicatorStatus'
		* def myACCCustomerNo = 'MYACC:20103045'
		* def claimNo = '10060066478'



        Given url WSC_CSS_URL +  configParam
        * configure headers  = WSC_HTTP_HEADERS
        And param param_str_claimno = claimNo
		And param param_str_userid = myACCCustomerNo
        * def payload = read('classpath:app/api/reload/services-css/posts/updateManagedIndicators/update-managed-indicators-opt-in.xml') 
        And request payload
        When method post
        * print response
        Then status 200
		
	