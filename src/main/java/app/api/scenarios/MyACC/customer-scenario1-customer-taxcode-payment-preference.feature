@customer-scenario1-customer-taxcode-payment-preference
Feature: Setup customer for Payments
    Background: 
        # prerequistes: a customer in EOS has no tax code
		# API calls:
		#	register the customer in EOS
		# 	add tax code - with tax code M
		#	get tax code
		#  	update tax code - update tax code to M SL
		#	add payment preference x
		#
		#	use a different customer, add then remove tax code
		
    Scenario:      
	    #* def eosCustomerNo = '20129438'
		* def taxType = 'M'
		* def irdNo   = '123123123'

		* def caseAlias = RUNID +'05'
		* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(caseAlias)' }
		* def eosCustomerNo  =  overviewResult.eosCustomerNo
		* def acc45CaseNo  =  overviewResult.eosCaseNo	

		
		* def isRegistered = call read('classpath:app/api/reload/api-customer/isRegistered.feature') { customerNo: '#(eosCustomerNo)' }		
		
		* def addTaxCodeRes = call read('classpath:app/api/reload/api-customer/posts/addTaxCodeRecord.feature') { customerNo: '#(eosCustomerNo)', taxType: '#(taxType)' } 		
		* def taxTypeDetailsId = addTaxCodeRes.taxTypeDetailsId
			
		* def getTaxCodeRes = call read('classpath:app/api/reload/api-customer/tax-code-records.feature') { customerNo: '#(eosCustomerNo)' } 		
		
		#* def taxTypeToUpdate = 'M SL'
		#* def updateTaxCodeRes = call read('classpath:app/api/reload/api-customer/posts/updateTaxCodeRecord.feature') { customerNo: '#(eosCustomerNo)', taxType: '#(taxTypeToUpdate)',taxCodeId: '#(addTaxCodeRes.taxTypeDetailsId)' } 
		
		* def paymentPreference = call read('classpath:app/api/reload/api-customer/posts/add-payment-preferences.feature') { customerNo: '#(eosCustomerNo)' } 
		* def irdResult = call read('classpath:app/api/reload/services-css/posts/UpdateClaimant-IRD.feature') { customerNo: '#(eosCustomerNo)', irdNo: '#(irdNo)' }
		
		
		##REMOVE taxCode
		* def eosCustomerNoForTaxCodeRemoval = '20102453'
		* def taxType2 = 'M'
		
		* def isRegistered2 = call read('classpath:app/api/reload/api-customer/isRegistered.feature') { customerNo: '#(eosCustomerNoForTaxCodeRemoval)' }		
		
		* def addTaxCodeForRemoveRes = call read('classpath:app/api/reload/api-customer/posts/addTaxCodeRecord.feature') { customerNo: '#(eosCustomerNoForTaxCodeRemoval)', taxType: '#(taxType2)' } 		
		* def taxTypeDetailsIdToRemove = addTaxCodeForRemoveRes.taxTypeDetailsId
		
		* def removeRes = call read('classpath:app/api/reload/api-customer/posts/removeTaxCodeRecord.feature') { customerNo: '#(eosCustomerNoForTaxCodeRemoval)', taxCodeId: '#(taxTypeDetailsIdToRemove)' } 		
	