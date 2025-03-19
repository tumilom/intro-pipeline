@ignore
@update-PartyPeriods
Feature: Setup update PartyPeriods
    Background: 
      # * strCustomerNumber = '20096038'				
	  # * partyPeriodOid = 'PE:11663:0000293544'	
	   
    Scenario: Update PartyPeriods
        Given url WSC_CC_URL + 'PartyPeriods'
        * configure headers  = WSC_HTTP_HEADERS
		* def payload = read('classpath:app/api/reload/services-cc/posts/update-PartyPeriods-request.xml') 		
       
        And request payload
        When method post
		* print response
        Then status 200
		
       
