@bootstrap
@search-mfp-party
Feature: Search party in external system
 Background:
	
	* configure retry = {count:50, interval:4000}
	* def JavaApp = Java.type('app.App');

	Scenario Outline: Search <searchType> <partyRef>
	Given url FRONTOFFICE_URL + '/ping.do'
	Then retry until responseStatus == 200
    When method GET
	
	* print JavaApp.waitBeforeDriverInit()
	Given driver FRONTOFFICE_URL +'/home.jsp'
	
	* def login01Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@loginAsOrdinaryUser')
	* waitForEnabled("{span}Tasks by Type")
	* waitForEnabled("a[aria-label='Open Party']")
	* mouse().move("a[aria-label='Open Party']").click()
	* waitForEnabled("{div}Provider/Vendor/Facility").click().delay(100)
	* waitUntil("document.readyState == 'complete'")
	* select('select[id$=_PVFSelect]','{}'+searchType).delay(100)
	* waitUntil("document.readyState == 'complete'")
	* waitForEnabled("input[id$=_ACCIdentifier]").input(partyRef)
	* waitForEnabled("input[value=Search]").click()
	* waitForEnabled("input[value=Close]")
	* print driver.title
	Then match driver.title contains '<expectedTitle>'
	
	Examples:
        | searchType| partyRef | expectedTitle |
        | Facility 	| F0B080 | Party Details |
		| Provider 	| A51778 | Party Details | 
		| Provider 	| 12BQNZ | Party Details | 
		| Vendor 	| VAB908 | Party Details |
		| Vendor 	| G0C106 | Party Details |
		| Vendor 	| SGATOSCN/CN | Party Details |
		
		