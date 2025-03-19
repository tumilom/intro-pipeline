@customer-scenario2-abatement
Feature: Abatement: occupation, earnings and work pattern
    Background: 
        # prerequistes: customer has a ACC45 claim and a WCE case in the EOS, run @nofasttrackfromscratchSingleCase
		# add occupation, 
		# get occupation created, 
		# add earnings
		# get earnings created
		# add work pattern
		# get work pattern
		
    Scenario: 				
		* def caseNo = RUNID +'71'

		* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(caseNo)' }
		* def eosCustomerNo  =  overviewResult.eosCustomerNo
		* def acc45CaseNo  =  overviewResult.eosCaseNo		
		
		* def isRegistered = call read('classpath:app/api/reload/api-customer/isRegistered.feature') { customerNo: '#(eosCustomerNo)' }	
		* def getCaseResponse = call read('classpath:app/api/reload/api-customer/benefits.feature') { eosCaseNo: '#(acc45CaseNo)' , customerNo: '#(eosCustomerNo)' } 
		
		* def eosBenefitCaseNumber = getCaseResponse.wceCaseNo[0]			
				
		* def addOccupation = call read('classpath:app/api/reload/api-customer/posts/add-occupations.feature') { customerNo: '#(eosCustomerNo)',benefitCaseNumber:'#(eosBenefitCaseNumber)' }			
		
		* def occupationDetails = call read('classpath:app/api/reload/api-customer/occupations.feature') { customerNo: '#(eosCustomerNo)' , benefitCaseNumber: '#(eosBenefitCaseNumber)' } 
		
		* def eosOccupationIds = karate.jsonPath(occupationDetails, "$..id")
		* def size = karate.sizeOf(eosOccupationIds)
		* def eosOccupationId = eosOccupationIds[size - 1]
		* print eosOccupationId
		
		* def addEarnings = call read('classpath:app/api/reload/api-customer/posts/add-actual-earnings.feature') { customerNo: '#(eosCustomerNo)' , benefitCaseNumber: '#(eosBenefitCaseNumber)',  occupationId: '#(eosOccupationId)'  } 
		
		* def getEarnings = call read('classpath:app/api/reload/api-customer/actual-earnings.feature') { customerNo: '#(eosCustomerNo)' , benefitCaseNumber: '#(eosBenefitCaseNumber)',  occupationId: '#(eosOccupationId)'  } 
		#* def workPatternType = '8864006'
		* def workPatternType =  '8864006'
		* def addWorkPattern = call read('classpath:app/api/reload/api-customer/posts/add-week-based-work-pattern.feature') { customerNo: '#(eosCustomerNo)' , benefitCaseNumber: '#(eosBenefitCaseNumber)',  occupationId: '#(eosOccupationId)', workPatternType: '#(workPatternType)' } 
		
		* def getWorkPattern = call read('classpath:app/api/reload/api-customer/week-based-work-pattern.feature') { customerNo: '#(eosCustomerNo)' , benefitCaseNumber: '#(eosBenefitCaseNumber)',  occupationId: '#(eosOccupationId)'  } 
		