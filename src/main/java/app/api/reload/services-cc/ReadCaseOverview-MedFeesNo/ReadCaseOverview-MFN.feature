@ignore
@ReadCaseOverview-MFN-BasicFlow
Feature: Read Case Overview - Med Fees No (using case alias value)
    Background: 
		# For a ACC45 number gets Overview of ACC45 claim
		# For a unit testing uncomment line below, update medFeesNo value, remove @ignore
		# Other inputs for medFeesNo are ACC45 No=10060098912/C1427428260, Purchase Order No=11878656, ACC45 Case Alias=JB20001
		* def medFeesNo = '11878656'
    
	Scenario: <medFeesNo> Case Overview
        Given url WSC_CC_URL + 'ReadCaseOverview'
        * configure headers  = WSC_HTTP_HEADERS
		And param MED-FEES-NO = medFeesNo
		When method get
		* print response
		* string responseStr = response
		* karate.write(responseStr, '../src/test/java/app/api/reload/services-cc/ReadCaseOverview-MedFeesNo/ReadCaseOverview-MFN-BasicFlow-response-24.2.txt')
		Then status 200
		* def eosCustomerNo  = karate.xmlPath(response , "/ReadCaseOverviewResponse/additional-data-set/additional-data[./name/text()='CLAIMANT-REFNO']/value")
		* print eosCustomerNo
		* def eosCaseNo  = karate.xmlPath(response , "/ReadCaseOverviewResponse/additional-data-set/additional-data[./name/text()='CASE-REFNO']/value")
		* print eosCaseNo
		* def caseRegComplete  = karate.xmlPath(response , "/ReadCaseOverviewResponse/additional-data-set/additional-data[./name/text()='IS-REGISTERED']/value")
		* print caseRegComplete
		* def poList  = karate.xmlPath(response , "/ReadCaseOverviewResponse/additional-data-set/additional-data[./name/text()='PO-REFNO-LIST']/value")
		* print poList
		