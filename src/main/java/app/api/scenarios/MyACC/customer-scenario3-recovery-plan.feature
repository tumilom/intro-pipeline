@customer-scenario3-Recovery-Plan
Feature: Recover Plan - Outcome Measure and Consent Details
    Background: 
        # prerequistes:
		#
		# create outcome measure eform
		# get outcome measure
		# create Consent Details
		# get Consent Details
		
    Scenario: 
        * def caseNo = RUNID + '06'			
		
		* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(caseNo)' }
		* def eosCustomerNo  =  overviewResult.eosCustomerNo
		* def acc45CaseNo  =  overviewResult.eosCaseNo		
		
		* def isRegistered = call read('classpath:app/api/reload/api-customer/isRegistered.feature') { customerNo: '#(eosCustomerNo)' }
		
		* def pcscrsp = call read('classpath:app/api/reload/services-cc/posts/CreateClaimSubCase.feature') { parentCaseNumber: '#(acc45CaseNo)'} 		

		* def getCaseResponse = call read('classpath:app/api/reload/services-css/ReadClaim.feature') { str_claimnumber: '#(acc45CaseNo)' } 
		* def eosSubcaseNo = getCaseResponse.rpCaseNo
		
		# customer No
		* print eosCustomerNo
		# acc45 number
		* print acc45CaseNo
		# Recovery Plan ase number
		* print eosSubcaseNo		
		
				
		* def eosOutcomeMeasureType = 'HCG TOOL'
		* def addOutcomeMeasure = call read('classpath:app/api/reload/services-css/posts/CreateOutcomeMeasure.feature') {  CustomerNo: '#(eosCustomerNo)', recoverPlanCaseNumber: '#(eosSubcaseNo)' ,  outcomeMeasureType: '#(eosOutcomeMeasureType)'} 		
		* def readOutcomeMeasure = call read('classpath:app/api/reload/services-css/ReadOutcomeMeasures.feature') {CustomerNo: '#(eosCustomerNo)',recoverPlanCaseNumber: '#(eosSubcaseNo)' ,  outcomeMeasureType: '#(eosOutcomeMeasureType)'} 

		* def eosEFormTypeForAdd = 'Consent%20Details'
		
		* def addEform = call read('classpath:app/api/reload/api-customer/posts/add-eform.feature') { customerNo: '#(eosCustomerNo)' , subcaseNo: '#(eosSubcaseNo)', eFormType: '#(eosEFormTypeForAdd)'} 
		
		* def eosEFormTypeForGet = 'Consent Details'
		# get eform meta data
		* def getEForm = call read('classpath:app/api/reload/api-customer/eForms.feature') { customerNo: '#(eosCustomerNo)' , subcaseNo: '#(eosSubcaseNo)', eFormType: '#(eosEFormTypeForGet)'} 
		
		# get eform extra data
		* def eformI = getEForm.eformIvalue
		* def getEForm = call read('classpath:app/api/reload/api-customer/readEForm.feature') { customerNo: '#(eosCustomerNo)' , subcaseNo: '#(eosSubcaseNo)', oid: '#(eformI)'} 
		