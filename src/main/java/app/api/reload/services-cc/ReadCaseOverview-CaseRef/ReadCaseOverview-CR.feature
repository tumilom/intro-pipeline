@ignore
@ReadCaseOverview-CR-BasicFlow
Feature: Read Case Overview - Case Ref
    Background: 
		# For a ACC45 number gets Overview of ACC45 claim
		# For a unit testing uncomment line below, update caseRef value, remove @ignore
		# Other inputs for caseRef are ACC45 No=10060098912/C1427428260, Purchase Order No=11878656, ACC45 Case Alias=JB20001
		* def caseRef = '10060067872'
    
	Scenario: <caseRef> Case Overview
        Given url WSC_CC_URL + 'ReadCaseOverview'
        * configure headers  = WSC_HTTP_HEADERS
		And param CASE-REF = caseRef
		When method get
		* print response
		* string responseStr = response
		* karate.write(responseStr, '../src/test/java/app/api/reload/services-cc/ReadCaseOverview-CaseRef/ReadCaseOverview-CR-BasicFlow-response-24.2.txt')
		Then status 200
		* def eosCustomerNo  = karate.xmlPath(response , "/ReadCaseOverviewResponse/additional-data-set/additional-data[./name/text()='CLAIMANT-REFNO']/value")
		* print eosCustomerNo
		* def eosCaseNo  = karate.xmlPath(response , "/ReadCaseOverviewResponse/additional-data-set/additional-data[./name/text()='CASE-REFNO']/value")
		* print eosCaseNo
		* def caseRegComplete  = karate.xmlPath(response , "/ReadCaseOverviewResponse/additional-data-set/additional-data[./name/text()='IS-REGISTERED']/value")
		* print caseRegComplete
		* def poList  = karate.xmlPath(response , "/ReadCaseOverviewResponse/additional-data-set/additional-data[./name/text()='PO-REFNO-LIST']/value")
		* print poList
		