@employer-scenario1
Feature: Setup employer in EOS 
    Background: 
        # prerequistes: a ACC45 case created with claimant, the claimant must have a valid/unique IRD number
		# 
		# create an employer in EOS, update the employer business type to self employed
		# create an active wage base using the employer
		#
		# 
		# call CreateEformTask to create Tax Year Earnings Received eform and task
		
    Scenario: 
		# * def acc45Case = 'SY00001'
		#  * def eosCustomerNo = '20109028'
		* def employerId = 'SY0000002E'
		* def tradingName = 'Ambient Reno company'
		* def levyClientName = 'Ambient Reno company'		
		* def notValidForClaimRegIndicator  = false
		* def empReimbAgreementInd = true
		* def businessTypeName = 'Self Employed'
	
				
		* def employerResponse = call read('classpath:app/api/reload/services/posts/CreateOrUpdateEmployer.feature'){ employerId: '#(employerId)' ,tradingName: '#(tradingName)',levyClientName: '#(levyClientName)',notValidForClaimRegIndicator: '#(notValidForClaimRegIndicator)',empReimbAgreementInd: '#(empReimbAgreementInd)',businessTypeName: '#(businessTypeName)'}	
		