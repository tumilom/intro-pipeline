@ignore
@mya4b-readClaimsEform-invalid-userid
Feature: Setup user to employer
    Background: 
        # prerequistes: an employer in EOS, run @era-fasttrackfromscratchSingleCase to have data setup, employer must be an employer role in party case role of the ACC45 claim and WCE case
		# ACCCU-871	 eforms
		# ACCCU-872  readEform
		
    Scenario:      
	    * def employerNo = 'CN135780D'
		* def eosGCUserId = 'GC-CN135780D'			
														
		* def caseNo = 'SY00380'		
		
		* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(caseNo)' }
		* def eosCustomerNo  =  overviewResult.eosCustomerNo
		* def acc45CaseNo  =  overviewResult.eosCaseNo	
	
		* def reformsRsp = call read('classpath:app/api/reload/api-groupclient/eforms.feature') { claimNumber: '#(acc45CaseNo)', gcUserId: '#(eosGCUserId)'} 

		* def employerNo = 'CN135780D'
		* def eosGCUserId = 'GC-NC135780E'
		
		* def eformId = reformsRsp.eformId
		* def reformsRsp = call read('classpath:app/api/scenarios/MyA4B/employer-claim/readEform-invalid.feature') { claimNumber: '#(acc45CaseNo)', gcUserId: '#(eosGCUserId)', eformId: '#(eformId)'} 	
		
		* def reformsRsp = call read('classpath:app/api/scenarios/MyA4B/employer-claim/eforms-invalid.feature') { claimNumber: '#(acc45CaseNo)', gcUserId: '#(eosGCUserId)'}
		