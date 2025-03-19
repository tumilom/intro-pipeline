@mya4b-scenario4-participants
Feature: group client API - participants
    Background: 
        # prerequistes: a acc45 case exists, employer must be an employer role in party case role of the case
					
		# ACCCU-1052 participants
		# ACCCU-1053 readParticipantDetails
		# ACCCU-1054 readParticipantContactDetails
		
    Scenario:      
	    * def employerNo = 'U1323116E'
		* def eosGCUserId = 'GC-U1323116E'			
													
		* def createGCUserRes = call read('classpath:app/api/reload/services-css/posts/createOrUpdateEmployerViewpointUser.feature') { employerId: '#(employerNo)', userIdToCreate: '#(eosGCUserId)' } 		
		 		
		* def caseNo = 'SY00226'		
		
		* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(caseNo)' }
		* def eosCustomerNo  =  overviewResult.eosCustomerNo
		* def acc45CaseNo  =  overviewResult.eosCaseNo	
		
		* def getBenefitsResponse = call read('classpath:app/api/reload/api-groupclient/benefits.feature') { claimNumber: '#(acc45CaseNo)' , gcUserId: '#(eosGCUserId)' } 
		* def wceCaseNo = getBenefitsResponse.wceCaseNo[0]
		* print wceCaseNo
		
		* def getParticipantsResp = call read('classpath:app/api/reload/api-groupclient/participants.feature') { claimNumber: '#(acc45CaseNo)' , gcUserId: '#(eosGCUserId)' }
		* def eosParticipantId = getParticipantsResp.eosParticipantIds[0]
		* print eosParticipantId
		
		* def getParticipantsDeResp = call read('classpath:app/api/reload/api-groupclient/readParticipantDetails.feature') { claimNumber: '#(acc45CaseNo)' ,  participantId: '#(eosParticipantId)', gcUserId: '#(eosGCUserId)' }
		
		* def getParticipantsConResp = call read('classpath:app/api/reload/api-groupclient/readParticipantContactDetails.feature') { claimNumber: '#(acc45CaseNo)' ,  participantId: '#(eosParticipantId)', gcUserId: '#(eosGCUserId)' }
		
		# benefit case participants
		* def getParticipantsResp = call read('classpath:app/api/reload/api-groupclient/participants.feature') { claimNumber: '#(wceCaseNo)' , gcUserId: '#(eosGCUserId)' }