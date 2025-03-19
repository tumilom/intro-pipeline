@updateClaimant
Feature: Setup Claimants for Payments
    Background: 
        # Updating IRD numbers before setting up WCEs
    Scenario Outline: Update Claimant on ${RUNID}<seq>
        * def claimFormNumber = RUNID + '<seq>'
		* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(claimFormNumber)' }
		* def eosCustomerNo  =  overviewResult.eosCustomerNo
		* print 'About to update ' +claimFormNumber +'/' + overviewResult.eosCaseNo + ' claimaint information'
		
		* def irdResult = call read('classpath:app/api/reload/services-css/posts/UpdateClaimant-IRD.feature') { customerNo: '#(eosCustomerNo)', irdNo: '<irdNo>' }
		* def regResult = call read('classpath:app/api/reload/api-customer/isRegistered.feature') { customerNo: '#(eosCustomerNo)' }
        * def addressResult = call read('classpath:app/api/reload/services-css/posts/claimant-address.feature') { eosCustomerNo: '#(eosCustomerNo)', verificationStatus:'Unverified' }
		* def addressResult = call read('classpath:app/api/reload/services-cc/posts/CreateUpdateCustomerAddressDetails/customer-address.feature') { eosCustomerNo: '#(eosCustomerNo)', verificationStatus:'Verified' }
        * def emailResult = call read('classpath:app/api/reload/services-css/posts/claimant-email.feature') { eosCustomerNo: '#(eosCustomerNo)' }
        * def phoneResult = call read('classpath:app/api/reload/services-css/posts/claimant-phone.feature') { eosCustomerNo: '#(eosCustomerNo)' }
		* def ppResult = call read('classpath:app/api/reload/api-customer/posts/add-payment-preferences.feature') { customerNo: '#(eosCustomerNo)' }
	    * def taxResult = call read('classpath:app/api/reload/api-customer/posts/addTaxCodeRecord.feature') { customerNo: '#(eosCustomerNo)',taxType: '<taxType>'  }
	
	
	 Examples:
	    | read('claimant-data.csv') | 
        

	