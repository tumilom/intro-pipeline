@ICP-scenario-decline
Feature: Setup ICP Eforms
    Background: 
        # Creating ICP eforms Decline
    Scenario: Create Eform
		* def eosclaimNumber = '10060098915'
		
		* def decline = call read('classpath:app/api/reload/api-cc/posts/eforms-add-ICP-referal/eforms-add-ICP-referral-Decline.feature') { claimNumber: '#(eosclaimNumber)' }	
		

	 

	