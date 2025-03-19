@ICP-scenario-read-update-clinical-exit
Feature: Setup ICP Eforms
    Background: 
        # Creating ICP eforms Read Clinical Exit
    Scenario: Create Eform
		* def eosICPclaimNumber = '10060067490-ICP'
		
	    * def readeform = call read('classpath:app/api/reload/api-cc/posts/read-eforms-ICP.feature') { claimNumber: '#(eosICPclaimNumber)' }
		* def clinical = call read('classpath:app/api/reload/api-cc/posts/eforms-add-ICP-referal/eforms-add-ICP-referral-Clinical.feature') { claimNumber: '#(eosICPclaimNumber)' }
		* def exit = call read('classpath:app/api/reload/api-cc/posts/eforms-add-ICP-referal/eforms-add-ICP-referral-Exit.feature') { claimNumber: '#(eosICPclaimNumber)' }	
		#* def decline = call read('classpath:app/api/reload/api-cc/posts/eforms-add-ICP-referal/eforms-add-ICP-referral-Decline.feature') { claimNumber: '#(eosclaimNumber)' }	
		

	 

	