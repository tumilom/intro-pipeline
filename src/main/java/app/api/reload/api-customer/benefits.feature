@ignore
@benefitlist
Feature:
	Background: 
		# uncomment 2 lines below & @ignore for unittesting
		#* def eosCaseNo = '10060066409'
		#* def customerNo = '20103060'
		
    Scenario: list of benetis
        * def path = '/claims/<eosCaseNo>/benefits'
		* replace path.eosCaseNo = eosCaseNo
		
        Given url CUSTOMER_API_URL + path
        * set JSONAPI_HTTP_HEADERS.userid = 'MYACC:' + customerNo
        * configure headers = JSONAPI_HTTP_HEADERS
        When method get
        * print response
		* def allCaseIds = karate.jsonPath(response, "$[*].benefitId")
		* print "All Case IDs: " +allCaseIds		
		
		* def wceCaseNo = karate.jsonPath(response, "$[?(@.benefitId =~ /WCE.*/i )].benefitId")
		* print "WCE Case No: " + wceCaseNo
				
		* def crCaseNo = karate.jsonPath(response, "$[?(@.benefitId =~ /CR.*/i )].benefitId")
		* print "CR Case No: " + crCaseNo
		
		* def cssCaseNo = karate.jsonPath(response, "$[?(@.benefitId =~ /CSS.*/i )].benefitId")
		* print "CSS Case No: " + cssCaseNo

		* def fwcCaseNos = karate.jsonPath(response, "$[?(@.benefitId =~ /FWC.*/i )].benefitId")
		* print "FWC Case Nos: " + fwcCaseNos

		* def fccCaseNo = karate.jsonPath(response, "$[?(@.benefitId =~ /FCC.*/i )].benefitId")
		* print "FCC Case No: " + fccCaseNo

		* def picCaseNo = karate.jsonPath(response, "$[?(@.benefitId =~ /PIC.*/i )].benefitId")
		* print "PIC Case No: " + picCaseNo

		
