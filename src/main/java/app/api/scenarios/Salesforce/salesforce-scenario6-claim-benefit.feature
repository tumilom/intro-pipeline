@salesforce-scenario6-claim-benefit
Feature: claim related endpoints
    Background: 
        # prerequistes: customer has a ACC45 claim , run @fasttrackfromscratchSingleCase to create the necessary data
		# ACCCU-823 	GET - Get Case Occupations 	
		# ACCCU-820 	GET - Get Actual Earnings 
		# ACCCU-821 	GET - Get Claim Certification Periods 
		# ACCCU-822 	GET - Get Claim Payments 	
		# ACCCU-805 	GET - Sub Cases
		# ACCCU-800		GET - Returns a customer for the case - ACCCU-789
		# ACCCU-806		GET - documents
		# ACCCU-807		GET - medical code
		
    Scenario: 
        #* def caseNo = 'SY00199'
		 #caseid from fast track single case is 51 see fast-track-data-singlecase.csv
		* def caseAlias = RUNID +'51'
		* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(caseAlias)' }						
		
		#* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(caseNo)' }
		* def eosCustomerNo  =  overviewResult.eosCustomerNo
		* def acc45CaseNo  =  overviewResult.eosCaseNo	
		
		* def roccRsp = call read('classpath:app/api/reload/api-cc/occupations.feature') { claimNumber: '#(acc45CaseNo)'} 
		* def occOid = roccRsp.occOid
		* print occOid
		
		* def raeRsp = call read('classpath:app/api/reload/api-cc/actual-earnings.feature') { claimNumber: '#(acc45CaseNo)', occupationId: '#(occOid)'} 
		
		* def rcpRsp = call read('classpath:app/api/reload/api-cc/certification-periods.feature') { claimNumber: '#(acc45CaseNo)'} 
		
		* def rpaymentsRsp = call read('classpath:app/api/reload/api-cc/claim-payments.feature') { claimNumber: '#(acc45CaseNo)'} 
		
		* def rcustomerRsp = call read('classpath:app/api/reload/api-cc/customer-identifier.feature') { claimNumber: '#(acc45CaseNo)'} 
		
		* def rsubcasesRsp = call read('classpath:app/api/reload/api-cc/sub-cases.feature') { claimNumber: '#(acc45CaseNo)'} 
		
		* def rparticipantsRsp = call read('classpath:app/api/reload/api-cc/participants.feature') { claimNumber: '#(acc45CaseNo)'} 
		
		* def rdocRsp = call read('classpath:app/api/reload/api-cc/documents.feature') { claimNumber: '#(acc45CaseNo)'} 
		
		* def rmedCodeRsp = call read('classpath:app/api/reload/api-cc/medical-codes.feature') { claimNumber: '#(acc45CaseNo)'} 