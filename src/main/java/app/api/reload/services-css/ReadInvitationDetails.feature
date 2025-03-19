@ReadInvitationDetails
Feature: Read Invitation Details
    Background: 
		# Read Invitation Details
		* def strUserid = 'YANGS'

		
		Scenario: Case Owner
		
		Given url WSC_CSS_URL + 'ReadInvitationDetails'
        * configure headers  = WSC_HTTP_HEADERS
		And param userid = strUserid
       
		When method get
		* print response
		Then status 200
		
	