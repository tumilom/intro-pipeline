@ignore
@mya4b-readClaimParticipants-invalid-userid
Feature: group client API - participants
    Background: 
        # prerequistes: a acc45 case exists, employer must be an employer role in party case role of the case
					
		# ACCCU-1052 participants
		# ACCCU-1053 readParticipantDetails
		# ACCCU-1054 readParticipantContactDetails
		
    Scenario:      
		* def eosGCUserId = 'GC-CN135780D'			
														 		
		* def caseNo = 'SY00380'		
		
		* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(caseNo)' }
		* def eosCustomerNo  =  overviewResult.eosCustomerNo
		* def acc45CaseNo  =  overviewResult.eosCaseNo	
				
		* def getParticipantsResp = call read('classpath:app/api/reload/api-groupclient/participants.feature') { claimNumber: '#(acc45CaseNo)' , gcUserId: '#(eosGCUserId)' }
		* def eosParticipantId = getParticipantsResp.eosParticipantIds[2]
		* print eosParticipantId
		
		#Use an invalid userid after saving the participantId
		* def eosGCUserId = 'GC-CN135780E'
		* def caseNo = 'SY00380'
		
		* def getParticipantsDeResp = call read('classpath:app/api/scenarios/MyA4B/participants/readParticipantDetails-invalid-userid.feature') { claimNumber: '#(acc45CaseNo)' ,  participantId: '#(eosParticipantId)', gcUserId: '#(eosGCUserId)' }
		
		* def getParticipantsConResp = call read('classpath:app/api/scenarios/MyA4B/participants/readParticipantContactDetails-invalid-userid.feature') { claimNumber: '#(acc45CaseNo)' ,  participantId: '#(eosParticipantId)', gcUserId: '#(eosGCUserId)' }
		
		#Use an invalid userid to get the 401 response code for invalid userid
		* def eosGCUserId = 'GC-CN135780E'
		* def caseNo = 'SY00380'
		
		* def getParticipantsResp = call read('classpath:app/api/scenarios/MyA4B/participants/participants-invalid-userid.feature') { claimNumber: '#(acc45CaseNo)' , gcUserId: '#(eosGCUserId)' }
		