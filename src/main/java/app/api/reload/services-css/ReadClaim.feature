@ignore
@ReadClaim
Feature: Read Claim
    Background: 
		# For get claims for party
		# For a unit testing uncomment lines below, update claimNumber value, remove @ignore
		#* def str_claimnumber = '10060066389'
		* def str_userid = 'yangs'

		
    Scenario: Read Claim
        Given url WSC_CSS_URL +'ReadClaim'
        * configure headers  = WSC_HTTP_HEADERS
		And header wsConfigName =  'GET /fineos-services-css/ReadClaim' 
		And param param_str_claimnumber = str_claimnumber
		And param param_str_userid = str_userid

			
		When method get
		* print response
		Then status 200		
		
		* def allSubCaseNos  = karate.xmlPath(response , "/ReadClaimResponse/OLClaim/claimCase/OCCase/childCases/OCCase/CaseNumber")
		* print "All Subcases: " + allSubCaseNos		
		
		
		* def rpSubCaseNoToCheck = str_claimnumber + '-RP'
		* def rpCaseNo  = karate.xmlPath(response , "/ReadClaimResponse/OLClaim/claimCase/OCCase/childCases/OCCase/CaseNumber[text()='" + rpSubCaseNoToCheck + "']")
		* print "PR CaseNo: "+rpCaseNo
		
		* def accidentDate  = karate.xmlPath(response , "/ReadClaimResponse/OLClaim/EventDate/text()")
		* print "Accident Date: " +accidentDate
		
		* def depChildCustomerNo  = karate.xmlPath(response , "//OCPartyCaseRole[./definedRole/OCCaseTypeRole/RoleName/text()='Dependant - Child']/partyWithRole/OCPerson/CustomerNo/text()")
		* print "Dependant - Child: " + depChildCustomerNo
		* def depSpouseCustomerNo  = karate.xmlPath(response ,  "//OCPartyCaseRole[./definedRole/OCCaseTypeRole/RoleName/text()='Dependant - Spouse']/partyWithRole/OCPerson/CustomerNo/text()")
		* print "Dependant - Spouse: " + depSpouseCustomerNo
		* def depOtherCustomerNo  = karate.xmlPath(response ,  "//OCPartyCaseRole[./definedRole/OCCaseTypeRole/RoleName/text()='Dependant - Other']/partyWithRole/OCPerson/CustomerNo/text()")
		* print "Dependant - Other: " + depOtherCustomerNo
		
		
		
		
		
		

		