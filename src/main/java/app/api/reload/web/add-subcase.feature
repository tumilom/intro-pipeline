@acc45addSubcase
Feature: Payments setup automation - Add Subcase
 Background:

	
	* configure retry = {count:12, interval:2000}
	
	Scenario Outline: Add <subcaseType> subcase on ${RUNID}<seq>
	
	Given driver FRONTOFFICE_URL +'/home.jsp'
	* waitUntil("document.readyState == 'complete'")
	* waitForEnabled("a[aria-label='Claims']")
	* mouse().move("a[aria-label='Claims']").click()
	* def caseNumber = RUNID+'<seq>'
	* print caseNumber
	* waitForEnabled("input[id$=_caseNumber]").input(caseNumber)
	* waitForEnabled("input[value=Search]").click().delay(200)
	* waitForEnabled("input[value=Close]")
	
	* def asRes = call read('classpath:app/api/reload/web/webui-claim-steps.feature@addSubcase'){ subcaseType :<subcaseType>}
	
	Examples:
        | seq	| subcaseType 					  |
        | 02 	| Weekly Compensation Entitlement |
		| 03 	| Weekly Compensation Entitlement |
		| 04 	| Weekly Compensation Entitlement |
		| 05 	| Weekly Compensation Entitlement |
#		| 05 	| Hearing Loss 					  |
#		| 05 	| Treatment 					  |