@ignore
@mya4b-scenario3-abatement-basic-flow
Feature: Setup user to employer
    Background: 
        # prerequistes: an employer in EOS, run @era-fasttrackfromscratchSingleCase to have data setup, employer must be an employer role in party case role of the ACC45 claim and WCE case
		
		# ACCCU-875  benefits
		# ACCCU-618	 occupations and actual-earnings
		# ACCCU-1021 CreateAbatementOccupation
		# ACCCU-1039 CreateAbatementEarnings
		
    Scenario:      
	    * def employerNo = 'CN135780D'
		* def eosGCUserId = 'GC-CN135780D'			
													
		* def createGCUserRes = call read('classpath:app/api/reload/services-css/posts/createOrUpdateEmployerViewpointUser.feature') { employerId: '#(employerNo)', userIdToCreate: '#(eosGCUserId)' } 		
		 		
		* def caseNo = 'SY00312'		
		
		* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(caseNo)' }
		* def eosCustomerNo  =  overviewResult.eosCustomerNo
		* def acc45CaseNo  =  overviewResult.eosCaseNo	
		
		* def getBenefitsResponse = call read('classpath:app/api/reload/api-groupclient/benefits.feature') { claimNumber: '#(acc45CaseNo)' , gcUserId: '#(eosGCUserId)' } 
		* def wceCaseNo = getBenefitsResponse.wceCaseNo[0]
		* print wceCaseNo
		
		* def pcoccRsp = call read('classpath:app/api/reload/services-css/posts/CreateAbatementOccupation.feature') { benefitCaseNo: '#(wceCaseNo)',employerId: '#(employerNo)',gcUserId: '#(eosGCUserId)'} 		
				
		* def roccRsp = call read('classpath:app/api/reload/api-groupclient/occupations.feature') { benefitCaseNo: '#(wceCaseNo)',gcUserId: '#(eosGCUserId)'} 
		* def occOid = roccRsp.occOid
		* print occOid
		* def pos = occOid.lastIndexOf('-')	
		* def occIvalue = occOid.substring(pos + 1,occOid.length)
		* print occIvalue
		
		* def paearningsRsp = call read('classpath:app/api/reload/services-css/posts/createAbateOccEarnings/CreateAbatementEarningsMulti.feature') { benefitCaseNo: '#(wceCaseNo)',occupationIValue: '#(occIvalue)',gcUserId: '#(eosGCUserId)'} 		
				
		* def raeRsp = call read('classpath:app/api/reload/api-groupclient/actual-earnings.feature') { benefitCaseNo: '#(wceCaseNo)', gcUserId: '#(eosGCUserId)',occupationId: '#(occOid)'} 