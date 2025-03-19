@ignore
@mya4b-claim-summary-filterby-dates
Feature: Setup user to employer
    Background: 
        # prerequistes: a acc45 and an employer in EOS, and the employer must be in party case role of the case
    Scenario:      
	    * def employerNo = 'CN135780D'
		* def eosGCUserId = 'GC-CN135780D'				
													
		* def createGCUserRes = call read('classpath:app/api/reload/services-css/posts/createOrUpdateEmployerViewpointUser.feature') { employerId: '#(employerNo)', userIdToCreate: '#(eosGCUserId)' } 		
		 
		#* def caseNo = '10060066855'				
		
		#* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(caseNo)' }
		#* def eosCustomerNo  =  overviewResult.eosCustomerNo
		#* def acc45CaseNo  =  overviewResult.eosCaseNo	
		
		
		#* def rcdRsp = call read('classpath:app/api/reload/api-groupclient/claim-summaries.feature') { gcUserId: '#(eosGCUserId)'} 
		
		# Filter claim summaries by incurred dates
		* def eosDatesFromFilter = '2024-07-01'
		* def eosDatesToFilter = '2024-07-30'
		* def rcdFilterRsp = call read('classpath:app/api/scenarios/MyA4B/claim-summary/claim-summaries-filterby-incurreddate.feature') { datesFilterFrom: '#(eosDatesFromFilter)', datesFilterTo: '#(eosDatesToFilter)', gcUserId: '#(eosGCUserId)'} 
		
		# Filter claim summaries by event dates
		* def eosDatesFromFilter = '2024-08-01'
		* def eosDatesToFilter = '2024-08-30'
		* def rcdFilterRsp = call read('classpath:app/api/scenarios/MyA4B/claim-summary/claim-summaries-filterby-eventdate.feature') { datesFilterFrom: '#(eosDatesFromFilter)', datesFilterTo: '#(eosDatesToFilter)', gcUserId: '#(eosGCUserId)'} 