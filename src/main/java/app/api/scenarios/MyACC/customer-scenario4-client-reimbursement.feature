@customer-scenario4-client-reimbursement
Feature: client reimbursement
    Background: 
        # prerequistes: customer has a ACC45 claim
		# create a Client Reimbursement subCase
		# retrieve the Client Reimbursement subCase number
		# get payment preference from the customer
		# create an invoice 
		# read the invoice 
		
    Scenario: 
		* def caseNo = RUNID + '07'	
		
		* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(caseNo)' }
		* def eosCustomerNo  =  overviewResult.eosCustomerNo
		* def acc45CaseNo  =  overviewResult.eosCaseNo		
		
		* def isRegistered = call read('classpath:app/api/reload/api-customer/isRegistered.feature') { customerNo: '#(eosCustomerNo)' }
	
		* def paymentPreference = call read('classpath:app/api/reload/api-customer/posts/add-payment-preferences.feature') { customerNo: '#(eosCustomerNo)' } 
    
	
		* def eosSubCaseCaseTypeName = 'Client Reimbursement'									
		* def addSubCaseResponse = call read('classpath:app/api/reload/services-css/posts/SubCase.feature') { parentCaseNumber: '#(acc45CaseNo)' , subCaseCaseTypeName: '#(eosSubCaseCaseTypeName)' } 
		* def getCaseResponse = call read('classpath:app/api/reload/api-customer/benefits.feature') { eosCaseNo: '#(acc45CaseNo)' , customerNo: '#(eosCustomerNo)' } 
		
		* def eoscrCaseNumber = getCaseResponse.crCaseNo[0]
		* print eoscrCaseNumber
		
		* def paymentPreferencesResponse = call read('classpath:app/api/reload/api-customer/payment-preferences.feature') { customerNo: '#(eosCustomerNo)' } 
		* def eosPaymentPreferenceOid =  karate.jsonPath(paymentPreferencesResponse, "$..id")
		* print eosPaymentPreferenceOid[0]
		* def pos = eosPaymentPreferenceOid[0].lastIndexOf('-')
	
		* def eosPaymentPreferenceId = eosPaymentPreferenceOid[0].substring(pos + 1, eosPaymentPreferenceOid[0].length)
		* print eosPaymentPreferenceId

		
		* def addInvoiceRespose = call read('classpath:app/api/reload/services-css/posts/CreateInvoice.feature') { customerNo: '#(eosCustomerNo)' , crCaseNumber: '#(eoscrCaseNumber)' ,  paymentPreferenceId: '#(eosPaymentPreferenceId)'} 
		
		* def eosInvoiceRefNo = addInvoiceRespose.invoiceReferenceCreated
		* def readInvoice = call read('classpath:app/api/reload/services-css/ReadInvoice.feature') { STR_REFERENCENUMB: '#(eosInvoiceRefNo)'} 
		