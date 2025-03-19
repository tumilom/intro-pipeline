@ignore
@UpdateInvitationDetails-Invite-Failed
Feature:
    Scenario: UpdateInvitationDetails <eosCustomerNo>
		
    Background:
        * def configParam = 'UpdateInvitationDetails'
		* def eosCustomerNo  =  '20103048'
		* def caseNo  =  '10060066414'
		* def inviteStatus = 'Invite Failed'

        Given url WSC_CSS_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        And param PARAM_STR_CUSTOMERNO = eosCustomerNo
		And param PARAM_STR_CASENUMBER = caseNo
		And param param_str_invite_status = inviteStatus
	
        * def payload = read('classpath:app/api/reload/services-css/posts/updateInvitationDetails/UpdateInvitationDetails-Invite-Failed.xml') 
        And request payload
        When method post
        * print response
        Then status 200
		
	
	
