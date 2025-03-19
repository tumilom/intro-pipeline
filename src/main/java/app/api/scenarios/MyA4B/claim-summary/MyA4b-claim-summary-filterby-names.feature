@ignore
@mya4b-claim-summary-filterby-names
Feature: Setup user to employer
    Background: 
        # prerequistes: a acc45 and an employer in EOS, and the employer must be in party case role of the case
    Scenario:      
	    * def employerNo = 'CN135780D'
		* def eosGCUserId = 'GC-CN135780D'				
													
		* def createGCUserRes = call read('classpath:app/api/reload/services-css/posts/createOrUpdateEmployerViewpointUser.feature') { employerId: '#(employerNo)', userIdToCreate: '#(eosGCUserId)' } 		
		
		# Filter claim summaries by first and last names
		* def eosFilterFirstName = '_Person._firstNames._eq.Themote'
		* def eosFilterLastName = '_Person._lastName._eq.Sy00380bb'
		* def rcdFilterRsp = call read('classpath:app/api/scenarios/MyA4B/claim-summary/claim-summaries-filterby-names.feature') { firstNameFilter: '#(eosFilterFirstName)', lastNameFilter: '#(eosFilterLastName)', gcUserId: '#(eosGCUserId)'} 