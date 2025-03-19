@mya4b-scenario2-claim-summaries
Feature: Setup user to employer
    Background: 
        # prerequistes: a acc45 and an employer in EOS, and the employer must be in party case role of the case
    Scenario:      
	   * def employerNo = 'A1323118E'
		* def eosGCUserId = 'GC-A1323118E'				
													
		#* def createGCUserRes = call read('classpath:app/api/reload/services-css/posts/createOrUpdateEmployerViewpointUser.feature') { employerId: '#(employerNo)', userIdToCreate: '#(eosGCUserId)' } 		
		 
		* def caseNo = '10060066392'				
		
		* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(caseNo)' }
		* def eosCustomerNo  =  overviewResult.eosCustomerNo
		* def acc45CaseNo  =  overviewResult.eosCaseNo	
		
		
		* def rcdRsp = call read('classpath:app/api/reload/api-groupclient/claim-summaries.feature') { gcUserId: '#(eosGCUserId)'} 
		
		* def eosFilterClaimType = '_Claim._extClaimTypePICBAorTIMentalInj._eq.true'
		* def rcdFilterRsp = call read('classpath:app/api/reload/api-groupclient/claim-summaries-filterby-extensions.feature') { extensionFilter: '#(eosFilterClaimType)', gcUserId: '#(eosGCUserId)'} 
		* def eosFilterERAFlag = '_Organisation._EXTREIMAGREEMENTIND._eq.true'
		* def rcdFilterERAFlagRsp = call read('classpath:app/api/reload/api-groupclient/claim-summaries-filterby-extensions.feature') { extensionFilter: '#(eosFilterERAFlag)', gcUserId: '#(eosGCUserId)'} 