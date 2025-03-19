@salesforce-scenario1-party
Feature: contact related endpoints
    Background: 
        # prerequistes: a customer in EOS
		
		# ACCCU-824 	GET - WSC Get Party Indicators 
		# ACCCU-828 	GET - WSC Get Party Flags 
		# ACCCU-830 	GET - WSC Get Client Details - CRM 
		# ACCCU-832 	GET - WSC Get Customer Details 
		# ACCCU-833 	POST - WSC Party Periods 
		# ACCCU-835 	POST - WSC Update customer details 
		# ACCCU-837 	POST - WSC Update party periods 
		# ACCCU-785 	POST - Creates a payment preference

    Scenario: 
        #* def eosCustomerNo = '20103309'	
		* def caseAlias = RUNID +'02'
		* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(caseAlias)' }		
		* def eosCustomerNo  =  overviewResult.eosCustomerNo

		* def ppprResp = call read('classpath:app/api/reload/api-cc/posts/add-payment-preferences.feature') { customerNo: '#(eosCustomerNo)'}
				
		* def rpiResp = call read('classpath:app/api/reload/services-cc/ReadPartyIndicatorsv1.feature') { strCustomerNumber: '#(eosCustomerNo)'} 			
		* def rpfResp = call read('classpath:app/api/reload/services-cc/ReadPartyFlags.feature') { strCustomerNumber: '#(eosCustomerNo)'} 
		* def rcrmcdResp = call read('classpath:app/api/reload/services/ReadCRMClientDetailsv1.feature') { str_customerNo: '#(eosCustomerNo)'}
		* def rcdResp = call read('classpath:app/api/reload/services-cc/ReadCustomerDetails.feature') { strCustomerNumber: '#(eosCustomerNo)'}
	
		* def pppResp = call read('classpath:app/api/reload/services-cc/posts/add-PartyPeriods.feature') { strCustomerNumber: '#(eosCustomerNo)'}
		* def periodOid = pppResp.partyPeriodOid
		* def rppResp = call read('classpath:app/api/reload/services-cc/PartyPeriods.feature') { strCustomerNumber: '#(eosCustomerNo)'}
		* def puppResp = call read('classpath:app/api/reload/services-cc/posts/update-PartyPeriods.feature') { strCustomerNumber: '#(eosCustomerNo)',partyPeriodOid: '#(periodOid)'}
		
		* def rppResp = call read('classpath:app/api/reload/services-cc/posts/UpdateCustomerDetailsv1.feature') { strCustomerNumber: '#(eosCustomerNo)'}
		
		
		
	