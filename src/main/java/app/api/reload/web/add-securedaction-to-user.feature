@bootstrap
	
Feature: Setup users Secured Actions
 Background:
	
	* configure retry = {count:50, interval:4000}
	* def JavaApp = Java.type('app.App');
	
	Scenario Outline: Add all SA with <actionnamefragment> fragment to <username>
	Given url FRONTOFFICE_URL + '/ping.do'
	Then retry until responseStatus == 200
	When method GET
	
	* def waitTime = JavaApp.waitFewSecsMaybe();
	* print waitTime
	Given driver FRONTOFFICE_URL +'/home.jsp'
	* def login01Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@loginAsOrdinaryUser')
	* waitForEnabled("{span}Tasks by Type")
	
	* waitForEnabled("a[aria-label='Config Studio']")
	* mouse().move("a[aria-label='Config Studio']").click()
	
	* waitForEnabled("{span}Company Structure")
	* mouse().move("{span}Company Structure").click()
	
	* waitForEnabled("{div}Users").click().delay(200)
	* waitForEnabled("input[type=Text][id$=_userID]").input('<username>')
	* waitForEnabled("input[type=Submit][value=Search]").click()
	* waitForEnabled("input[type=Submit][value=Edit]").click()			
	* waitForEnabled("input[type=Submit][id^=LinkedSecuredActionsWidget][id$=_unlinkPrivHolderBtn]").focus()
	* waitForEnabled("a[id^=LinkedSecuredActionsWidget][id$=_availableSecuredActionsListview-Name-filter]").click().delay(200)
	* waitForEnabled("input[id^=LinkedSecuredActionsWidget][id$=_availableSecuredActionsListview_Name_textFilter]").input('<actionnamefragment>')
	* delay(3000)
	* waitForEnabled("input[id^=LinkedSecuredActionsWidget][id$=_availableSecuredActionsListview_cmdFilter]").click().delay(1000)
	* waitForEnabled("input[id^=LinkedSecuredActionsWidget][id$=_availableSecuredActionsListview_MasterMultiSelectCB_CHECKBOX]").click()
 	* waitForEnabled("input[type=Submit][id^=LinkedSecuredActionsWidget][id$=_linkPrivHolderBtn]").click()
	* delay(2000)

	* waitUntil("document.readyState == 'complete'")
	* waitForEnabled("input[type=Submit][value='OK']").click()
	* delay(1000)
	* def logout01Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@logout')

	Examples:
        | username	| actionnamefragment  					|
        | OASIS 	| ACC_ADDEDITREMOVE_RECOVERYGOAL 		|
		| OASIS 	| ACC_EDIT_RECOVERYSTATUS 				|
		| OASIS 	| ACC_OPEN_SENSITIVE_CLAIM 				|
		

		