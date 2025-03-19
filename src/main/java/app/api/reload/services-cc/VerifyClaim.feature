@VerifyClaim
Feature: Check if case exists
    Background: 
		# For a ACC45 number gets Overview of ACC45 claim
		# For a unit testing uncomment line below, update medFeesNo value, remove @ignore
		#* def medFeesNo = 'MT00132'
    Scenario: <medFeesNo> Case Overview
        Given url WSC_CC_URL +'ReadCaseOverview'
        * configure headers  = WSC_HTTP_HEADERS
		And header wsConfigName =  'GET /fineos-services-cc/ReadCaseOverview'
		And param MED-FEES-NO = medFeesNo
		And param userId = WSC_CC_USERID
		When method get
		* print response
		Then status 200
		#* print "Med Fees No:" + medFeesNo
		
		* def requestedCaseRefNo  = karate.xmlPath(response , "/ReadCaseOverviewResponse/additional-data-set/additional-data[./name/text()='REQ-CASE-REFNO']/value")
		* print "Requested Case Ref: " + requestedCaseRefNo
		* def eosCustomerNo  = karate.xmlPath(response , "/ReadCaseOverviewResponse/additional-data-set/additional-data[./name/text()='CLAIMANT-REFNO']/value")
		* print "Eos Customer No: " + eosCustomerNo
		* def eosCustomerLastName  = karate.xmlPath(response , "/ReadCaseOverviewResponse/additional-data-set/additional-data[./name/text()='CLAIMANT-LAST-NAME']/value")
		* print "Eos Customer LastName: " + eosCustomerLastName
		* def eosCustomerFirstName  = karate.xmlPath(response , "/ReadCaseOverviewResponse/additional-data-set/additional-data[./name/text()='CLAIMANT-FIRST-NAME']/value")
		* print "Eos Customer FirstName: " + eosCustomerFirstName
		* def eosCustomerDOB  = karate.xmlPath(response , "/ReadCaseOverviewResponse/additional-data-set/additional-data[./name/text()='CLAIMANT-DOB']/value")
		* print "Eos Customer DOB: " + eosCustomerDOB
		* def eosCaseNo  = karate.xmlPath(response , "/ReadCaseOverviewResponse/additional-data-set/additional-data[./name/text()='CASE-REFNO']/value")
		* print "Eos Case No: " + eosCaseNo
		* def caseRegComplete  = karate.xmlPath(response , "/ReadCaseOverviewResponse/additional-data-set/additional-data[./name/text()='IS-REGISTERED']/value")
		* print "Is Registration Complete: "+caseRegComplete
		* def errorMessage  = ""+karate.xmlPath(response , "/ReadCaseOverviewResponse/additional-data-set/additional-data[./name/text()='ERROR-DESCRIPTION']/value")
		* print "Error Description: "+errorMessage
		* def claimExists  = karate.xmlPath(response , "not(boolean(/ReadCaseOverviewResponse/additional-data-set/additional-data[./name/text()='ERROR-CODE']/value[./text() ='5']))")
		* print "Claim Exists: "+claimExists

		