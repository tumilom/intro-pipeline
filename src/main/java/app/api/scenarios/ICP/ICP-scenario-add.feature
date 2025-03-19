@ICP-scenario-add
Feature: Setup ICP Eforms
    Background: 
        # Creating ICP eforms Accept 
    Scenario: Create Eform

        * def caseAlias = RUNID +'03'
		* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(caseAlias)' }		
		* def accept = call read('classpath:app/api/reload/api-cc/posts/eforms-add-ICP-referal/eforms-add-ICP-referral-Accept.feature') { claimNumber: '#(overviewResult.eosCaseNo)' }

	

	 

	