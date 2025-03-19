@salesforce-scenario2-contacts
Feature: contact related endpoints
    Background: 
        # prerequistes: customer has a ACC45 claim 

    	# ACCCU-808 	GET - CC - Get Contacts for Customer
		# ACCCU-809 	POST -CC - Create Contact for Customer
		# ACCCU-810 	POST -CC - Creates a contact on the customer's case
		# ACCCU-801 	GET - CC - Returns an email contact for the case
	
	
	
	Scenario: 
        #* def caseNo = '10060066809'			
		#* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(caseNo)' }
		* def caseAlias = RUNID +'01'
		* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(caseAlias)' }
		* def eosCustomerNo  =  overviewResult.eosCustomerNo
		* def acc45CaseNo  =  overviewResult.eosCaseNo	
		
		# contacts: party and case level: add and get
		* def pcprsp1 = call read('classpath:app/api/reload/api-cc/posts/add-contacts-party.feature') { customerNo: '#(eosCustomerNo)'} 			
		* def pccrsp2 = call read('classpath:app/api/reload/api-cc/posts/add-contacts-case.feature') { caseNo: '#(acc45CaseNo)'} 	
		* def pccrsp3 = call read('classpath:app/api/reload/api-cc/posts/add-contacts-case.feature') { caseNo: '#(acc45CaseNo)'} 	
		
		* def rcprsp1 = call read('classpath:app/api/reload/api-cc/contacts-party.feature') { customerNo: '#(eosCustomerNo)'} 	
		* def rccrsp2 = call read('classpath:app/api/reload/api-cc/contacts-case.feature') { caseNo: '#(acc45CaseNo)'} 	
		* def contactOid = rccrsp2.allContactIds[0]
		* def rccrsp3 = call read('classpath:app/api/reload/api-cc/posts/edit-contacts-case.feature') { caseNo: '#(acc45CaseNo)',contactOid:'#(contactOid)'} 

		
		# get email contacts
		* def recrsp = call read('classpath:app/api/reload/api-cc/contacts-email.feature') { caseNo: '#(acc45CaseNo)'}