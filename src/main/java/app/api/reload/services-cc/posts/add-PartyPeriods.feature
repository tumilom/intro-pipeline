@ignore
@add-PartyPeriods
Feature: Setup addPartyPeriods
    Background: 
      # * strCustomerNumber = '20096038'				
	   
    Scenario: addPartyPeriods
        Given url WSC_CC_URL + 'PartyPeriods'
        * configure headers  = WSC_HTTP_HEADERS
		* def payload = read('classpath:app/api/reload/services-cc/posts/add-PartyPeriods-request.xml') 			
       
        And request payload
        When method post
		* print response
		* def partyPeriodOid  = karate.xmlPath(response , "/WSUpdateResponse/oid-list/oid/text()")
		* print partyPeriodOid		
		
        Then status 200
		
       
