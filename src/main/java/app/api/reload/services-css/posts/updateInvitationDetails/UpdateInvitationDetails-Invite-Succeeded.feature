@ignore
@UpdateInvitationDetails-Invite-Succeeded
Feature:
    Scenario: UpdateInvitationDetails <eosCustomerNo>
		
    Background:
        * def configParam = 'UpdateInvitationDetails'
		* def eosCustomerNo  =  '20112029'
		* def caseNo  =  '10060071871'
		* def inviteStatus = 'Invite Succeeded'

        Given url WSC_CSS_URL +  configParam
        * configure headers  = WSC_HTTP_HEADERS
        And param PARAM_STR_CUSTOMERNO = eosCustomerNo
		And param PARAM_STR_CASENUMBER = caseNo
		And param param_str_invite_status = inviteStatus
	
        * def payload = read('classpath:app/api/reload/services-css/posts/updateInvitationDetails/UpdateInvitationDetails-Invite-Succeeded.xml') 
        And request payload
        When method post
        * print response
        Then status 200
		
	
	
