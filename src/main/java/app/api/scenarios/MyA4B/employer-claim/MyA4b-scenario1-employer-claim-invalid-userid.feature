@ignore
@mya4b-readDisabilityDetails-invalid-userid
Feature: Setup user to employer
    Background: 
        # prerequistes: an employer in EOS, run @era-fasttrackfromscratchSingleCase to have data setup, employer must be an employer role in party case role of the ACC45 claim and WCE case
		# ACCCU-807  readDisabilityDetails
		# ACCCU-871	 eforms
		# ACCCU-872  readEform
		# ACCCU-873  documents
		# ACCCU-874  diagnosisCodes
		# ACCCU-875  benefits		
		
    Scenario:      
	    * def employerNo = 'CN135780D'
		* def eosGCUserId = 'GC-U1323116E'			
														
		* def caseNo = 'SY00380'		
		
		* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(caseNo)' }
		* def eosCustomerNo  =  overviewResult.eosCustomerNo
		* def acc45CaseNo  =  overviewResult.eosCaseNo	
		
		* def rcdRsp = call read('classpath:app/api/scenarios/MyA4B/employer-claim/readDisabilityDetails-invalid.feature') { claimNumber: '#(acc45CaseNo)', gcUserId: '#(eosGCUserId)'} 
		
		#* def reformsRsp = call read('classpath:app/api/scenarios/MyA4B/employer-claim/eforms-invalid.feature') { claimNumber: #'#(acc45CaseNo)', gcUserId: '#(eosGCUserId)'} 
			
		#* def eformId = reformsRsp.eformId
		#* def reformsRsp = call read('classpath:app/api/scenarios/MyA4B/employer-claim/readEform-invalid.feature') { claimNumber: #'#(acc45CaseNo)', gcUserId: '#(eosGCUserId)', eformId: '#(eformId)'} 
		
		* def rdocRsp = call read('classpath:app/api/scenarios/MyA4B/employer-claim/documents-invalid.feature') { claimNumber: '#(acc45CaseNo)', gcUserId: '#(eosGCUserId)'} 
		
		* def rdcRsp = call read('classpath:app/api/scenarios/MyA4B/employer-claim/diagnosisCodes-invalid.feature') { claimNumber: '#(acc45CaseNo)', gcUserId: '#(eosGCUserId)'} 
		
		* def rbenRsp = call read('classpath:app/api/scenarios/MyA4B/employer-claim/benefits-invalid.feature') { claimNumber: '#(acc45CaseNo)', gcUserId: '#(eosGCUserId)'} 
	