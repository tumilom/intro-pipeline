@doc-scenario1-document.feature
Feature: get Documents
    Background: 
        # prerequistes: ACC45 claim and have  1 incomplete word doc
		# 
		
    Scenario: 

		* def caseNo = '10060066370'
		
		* def getDocuemntsRes = call read('classpath:app/api/reload/api-cc/documents.feature') { claimNumber: '#(caseNo)'} 
		* def eosExtVCFContentID = getDocuemntsRes.extVCFContentID[0]
		* def eosFileName = getDocuemntsRes.fileName[0]		
		* print eosFileName
		 
		* def docUpdateStatusRes = call read('classpath:app/api/reload/documents/update-document-status.feature') { documentContentId: '#(eosExtVCFContentID)',  filename: '#(eosFileName)'} 
		