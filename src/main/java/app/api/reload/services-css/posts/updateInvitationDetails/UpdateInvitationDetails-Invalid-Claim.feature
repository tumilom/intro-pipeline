@ignore
@UpdateInvitationDetails-Invalid-Claim
Feature:
    Scenario: UpdateInvitationDetails <eosCustomerNo>
		
    Background:
        * def configParam = 'UpdateInvitationDetails'
		* def eosCustomerNo  =  '20103049'
		* def caseNo  =  '90060066415'
		* def inviteStatus = 'Invalid Status'

        Given url WSC_CSS_URL +  configParam
        * configure headers  = WSC_HTTP_HEADERS
        And param PARAM_STR_CUSTOMERNO = eosCustomerNo
		And param PARAM_STR_CASENUMBER = caseNo
		And param param_str_invite_status = inviteStatus
	
        * def payload = read('classpath:app/api/reload/services-css/posts/updateInvitationDetails/UpdateInvitationDetails-Invalid-Claim.xml') 
        And request payload
        When method post
		* string responseStr = response
		* karate.write(responseStr, '../src/test/java/app/api/reload/services-css/posts/updateInvitationDetails/UpdateInvitationDetails-Invalid-Claim 24.2.txt')
        * print response
        Then status 200
		
	
	
