@ignore
@gc_participants
Feature: gcapi participants

    Background: 
		# For a given claim, get participants
		# For a unit testing uncomment line below, remove @ignore		
		# * def claimNumber = '10060066378'
		
    Scenario:
		* def path = '/cases/<path-caseNumber>/participants'		
		* replace path.path-caseNumber = claimNumber
		
		Given url GC_API_URL + path			
		* configure headers = GET_HTTP_HEADER
			And header userid = gcUserId	
		 
		When method get
		* print response
		* def eosParticipantIds = karate.jsonPath(response, "$[*].participantId")
		* print eosParticipantIds
		
		Then status 200
		