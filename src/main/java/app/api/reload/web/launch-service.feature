@launch-service
Feature: launch EOS from external system
 Background:

	* configure retry = {count:60, interval:4000}
	
	Scenario Outline: launch EOS from external system, open EOS specific screen
	Given url FRONTOFFICE_URL + '/ping.do'
	Then retry until responseStatus == 200
	When method GET
	* def path = '/launchservice.jsp?type=<param-searchType>&id=<param-searchId>'
	* replace path.param-searchType = searchType
	* replace path.param-searchId = searchId
	
	* print path	
	
	Given driver FRONTOFFICE_URL + path
	* waitUntil("document.readyState == 'complete'")
	* def login01Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@loginAsOrdinaryUser')
	* waitUntil("document.readyState == 'complete'")
	* print "Page title: " + driver.title
	* switchPage('<jspRedirectTarget>')
	* print "Page title: " + driver.title
	Then match driver.title contains '<expectedTitle>'
	* def logout01Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@logout')

	Examples:
        | searchType| searchId | jspRedirectTarget | expectedTitle |
        | claim 	|10060066374| accdisplaycasepage.jsp | 10060066374 |
		| acc45 	| AB08116| accdisplaycasepage.jsp | ACC45 Claim |
		| facility 	| F0B080 | accpartydetailspage.jsp | Party Details |
		| provider 	| AA6334 | accpartydetailspage.jsp | Party Details | 
		| vendor 	| VAB908 | accpartydetailspage.jsp | Party Details |
		| purchaseorder | 11878656 | accapprovalgrouppage.jsp | Purchase Order Details |
		| claim 	|20060066374| launchpage.jsp | ACC EOS |	
		| person 	| 20093291 | accpartydetailspage.jsp | Party Details | 
		| employer 	| Y4846582E | accpartydetailspage.jsp | Party Details | 

	@warmUpFrontoffice
	Examples:
        | searchType| searchId | jspRedirectTarget | expectedTitle |
        | facility 	| FQA610 | accpartydetailspage.jsp | Party Details |
		| provider 	| A51670 | accpartydetailspage.jsp | Party Details | 
		| vendor 	| PAQ610 | accpartydetailspage.jsp | Party Details |
		