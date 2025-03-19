#@ignore
@readCaseOverview-Case-Ref-ClaimNo
Feature: Read Case Overview
    Background: 
		* configure retry = {count:40, interval:10000}
		# For a ACC45 number gets Overview of ACC45 claim
		# For a unit testing uncomment line below, update medFeesNo value, remove @ignore
		* def caseRef = '10060066557'
		
    Scenario: <medFeesNo> Case Overview
        Given url WSC_CC_URL + 'ReadCaseOverview'
        * configure headers  = WSC_HTTP_HEADERS
		And header wsConfigName =  'GET /fineos-services-cc/ReadCaseOverview'
		And param CASE-REF = caseRef
		And param userId = WSC_CC_USERID
		And retry until karate.xmlPath(response , "/ReadCaseOverviewResponse/additional-data-set/additional-data[./name/text()='IS-REGISTERED']/value") == 'true'
		When method get
		* print response
			* string responseStr = response
		* karate.write(responseStr, '../src/main/java/app/api/reload/services-cc/ReadCaseOverview-CaseRef/ReadCaseOverview-Case-Ref-response ClaimNo 24.7.txt')			
		Then status 200
		* def eosCustomerNo  = karate.xmlPath(response , "/ReadCaseOverviewResponse/additional-data-set/additional-data[./name/text()='CLAIMANT-REFNO']/value")
		* print "Eos Customer No:" + eosCustomerNo
		* def eosCaseNo  = karate.xmlPath(response , "/ReadCaseOverviewResponse/additional-data-set/additional-data[./name/text()='CASE-REFNO']/value")
		* print "Eos Case No:" + eosCaseNo
		* def caseRegComplete  = karate.xmlPath(response , "/ReadCaseOverviewResponse/additional-data-set/additional-data[./name/text()='IS-REGISTERED']/value")
		* print "Is Registration Complete: "+caseRegComplete
		* def poList  = karate.xmlPath(response , "/ReadCaseOverviewResponse/additional-data-set/additional-data[./name/text()='PO-REFNO-LIST']/value")
		* print "PO List: "+poList
		