@ignore
@ReadCaseOverview-CI-BasicFlow
Feature: Read Case Overview - Case Id
    Background: 
		# For a ACC45 number gets Overview of ACC45 claim
		# For a unit testing uncomment line below, update caseId value, remove @ignore
		# Other input for caseId is the entity id (normally present on 8 digit ACC45 case nos)
		* def caseId = '9134847'
    
	Scenario: <caseId> Case Overview
        Given url WSC_CC_URL + 'ReadCaseOverview'
        * configure headers  = WSC_HTTP_HEADERS
		And param CASE-ID = caseId
		When method get
		* print response
		* string responseStr = response
		* karate.write(responseStr, '../src/test/java/app/api/reload/services-cc/ReadCaseOverview-CaseId/ReadCaseOverview-CI-BasicFlow-response-24.2.txt')
		Then status 200
		* def eosCustomerNo  = karate.xmlPath(response , "/ReadCaseOverviewResponse/additional-data-set/additional-data[./name/text()='CLAIMANT-REFNO']/value")
		* print eosCustomerNo
		* def eosCaseNo  = karate.xmlPath(response , "/ReadCaseOverviewResponse/additional-data-set/additional-data[./name/text()='CASE-REFNO']/value")
		* print eosCaseNo
		* def caseRegComplete  = karate.xmlPath(response , "/ReadCaseOverviewResponse/additional-data-set/additional-data[./name/text()='IS-REGISTERED']/value")
		* print caseRegComplete
		* def poList  = karate.xmlPath(response , "/ReadCaseOverviewResponse/additional-data-set/additional-data[./name/text()='PO-REFNO-LIST']/value")
		* print poList
		