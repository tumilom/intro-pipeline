@ignore
@ReadInvitationDetails-basic-flow
Feature: Read Invitation Details
    Background: 
		# Read Invitation Details
		* def strUserid = 'YANGS'

		
		Scenario: Case Owner
		
		Given url WSC_CSS_URL +'ReadInvitationDetails'
        * configure headers  = WSC_HTTP_HEADERS
		And param userid = strUserid
       
		When method get
		* string responseStr = response
		* karate.write(responseStr, '../src/test/java/app/api/reload/services-css/ReadInvitationDetails/ReadInvitationDetails-basic-flow-response 24.2.txt')
		* print response
		Then status 200
		
	