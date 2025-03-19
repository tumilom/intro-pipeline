@ignore
@gc_readParticipantDetails
Feature: gcapi readParticipantDetails

    Background: 
		# For a given claim, get readParticipantDetails
		# For a unit testing uncomment line below, remove @ignore		
		# * def claimNumber = '10060066378'
		
    Scenario:
		* def path = '/cases/<path-caseNumber>/participants/<path-participantId>/readParticipantDetails'		
		* replace path.path-caseNumber = claimNumber
		* replace path.path-participantId = participantId
		
		Given url GC_API_URL + path			
		* configure headers = GET_HTTP_HEADER
			And header userid = gcUserId	
		 
		When method get
		* print response		
		
		Then status 200
		
