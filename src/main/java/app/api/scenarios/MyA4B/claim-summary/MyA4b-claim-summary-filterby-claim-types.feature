@ignore
@mya4b-claim-summary-filterby-claim-types
Feature: Setup user to employer
    Background: 
        # prerequistes: a acc45 and an employer in EOS, and the employer must be in party case role of the case
    Scenario:      
	    * def employerNo = 'CN135780D'
		* def eosGCUserId = 'GC-CN135780D'				
													
		* def createGCUserRes = call read('classpath:app/api/reload/services-css/posts/createOrUpdateEmployerViewpointUser.feature') { employerId: '#(employerNo)', userIdToCreate: '#(eosGCUserId)' } 		
				
		# Filter claim summaries by claim types
		* def eosFilterClaimType = '_Claim._extClaimTypeGradualProcess._eq.true'
		* def rcdFilterRsp = call read('classpath:app/api/scenarios/MyA4B/claim-summary/claim-summaries-filterby-claim-types.feature') { extensionFilter: '#(eosFilterClaimType)', gcUserId: '#(eosGCUserId)'} 
		
		* def eosFilterClaimType = '_Claim._extClaimTypeFatal._eq.true'
		* def rcdFilterRsp = call read('classpath:app/api/scenarios/MyA4B/claim-summary/claim-summaries-filterby-claim-types.feature') { extensionFilter: '#(eosFilterClaimType)', gcUserId: '#(eosGCUserId)'} 
		
		* def eosFilterClaimType = '_Claim._extClaimTypeMBI._eq.true'
		* def rcdFilterRsp = call read('classpath:app/api/scenarios/MyA4B/claim-summary/claim-summaries-filterby-claim-types.feature') { extensionFilter: '#(eosFilterClaimType)', gcUserId: '#(eosGCUserId)'} 