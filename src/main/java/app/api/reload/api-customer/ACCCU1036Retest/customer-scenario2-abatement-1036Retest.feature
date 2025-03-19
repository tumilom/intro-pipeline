@ignore
@customer-scenario2-abatement-1036Retest
Feature: Abatement: occupation, earnings and work pattern
    Background: 
        # prerequistes: customer has a ACC45 claim and a WCE case in the EOS
		# add occupation, 
		# get occupation created, 
		# add earnings
		# get earnings created
		# add work pattern
		# get work pattern
		
    Scenario: 
		* def caseNo = '10060073481'		
		
		* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(caseNo)' }
		* def eosCustomerNo  =  overviewResult.eosCustomerNo
		* def acc45CaseNo  =  overviewResult.eosCaseNo		
		
		* def isRegistered = call read('classpath:app/api/reload/api-customer/isRegistered.feature') { customerNo: '#(eosCustomerNo)' }	
		* def getCaseResponse = call read('classpath:app/api/reload/api-customer/benefits.feature') { eosCaseNo: '#(acc45CaseNo)' , customerNo: '#(eosCustomerNo)' } 
		
		* def eosBenefitCaseNumber = getCaseResponse.wceCaseNo[0]			
				
		#* def addOccupation = call read('classpath:app/api/reload/api-customer/posts/add-occupations.feature') { customerNo: '#(eosCustomerNo)',benefitCaseNumber:'#(eosBenefitCaseNumber)' }			
		
		* def occupationDetails = call read('classpath:app/api/reload/api-customer/occupations.feature') { customerNo: '#(eosCustomerNo)' , benefitCaseNumber: '#(eosBenefitCaseNumber)' } 
		
		* def eosOccupationIds = karate.jsonPath(occupationDetails, "$..id")
		* def size = karate.sizeOf(eosOccupationIds)
		* def eosOccupationId = eosOccupationIds[size - 1]
		* print eosOccupationId
		
		* def addEarnings = call read('classpath:app/api/reload/api-customer/ACCCU1036Retest/add-actual-earningsPIEA.feature') { customerNo: '#(eosCustomerNo)' , benefitCaseNumber: '#(eosBenefitCaseNumber)',  occupationId: '#(eosOccupationId)'  } 
		
		#* def addEarnings = call read('classpath:app/api/reload/api-customer/ACCCU1036Retest/add-actual-earningsPIEHPW.feature') { customerNo: '#(eosCustomerNo)' , benefitCaseNumber: '#(eosBenefitCaseNumber)',  occupationId: '#(eosOccupationId)'  } 
		
		#* def addEarnings = call read('classpath:app/api/reload/api-customer/ACCCU1036Retest/add-actual-earningsPIEHR.feature') { customerNo: '#(eosCustomerNo)' , benefitCaseNumber: '#(eosBenefitCaseNumber)',  occupationId: '#(eosOccupationId)'  } 
		
		#* def addEarnings = call read('classpath:app/api/reload/api-customer/ACCCU1036Retest/add-actual-earningsPIEP.feature') { customerNo: '#(eosCustomerNo)' , benefitCaseNumber: '#(eosBenefitCaseNumber)',  occupationId: '#(eosOccupationId)'  } 
		
		#* def addEarnings = call read('classpath:app/api/reload/api-customer/ACCCU1036Retest/add-actual-earningsPIER.feature') { customerNo: '#(eosCustomerNo)' , benefitCaseNumber: '#(eosBenefitCaseNumber)',  occupationId: '#(eosOccupationId)'  } 
	
		* def getEarnings = call read('classpath:app/api/reload/api-customer/actual-earnings.feature') { customerNo: '#(eosCustomerNo)' , benefitCaseNumber: '#(eosBenefitCaseNumber)',  occupationId: '#(eosOccupationId)'  } 
		
		