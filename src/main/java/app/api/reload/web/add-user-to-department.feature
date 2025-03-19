@bootstrap	
Feature: Setup users in departments
 Background:

	
	* configure retry = {count:50, interval:4000}
	* def JavaApp = Java.type('app.App');
	
	Scenario Outline: Add <username> to <departmentname>
	Given url FRONTOFFICE_URL +'/ping.do'
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
	
	* waitForEnabled("{div}Search").click().delay(200)
	* value("input[type=Text][id$=_departmentName]",'<departmentname>')
	* waitForEnabled("input[type=Submit][value=Search]").click().delay(1000)
	* waitForEnabled("input[type=Submit][value=Edit]").click().delay(1000)
	* waitForEnabled("input[type=Submit][value='New Search']")
	* waitForEnabled("input[type=Text][id$=_userID]").input('<username>')
	* waitForEnabled("input[type=Submit][value='Search']").click()
	* waitForEnabled("input[type=Submit][value='Search']").click()
	* waitForEnabled("input[type=checkbox][id^=LinkedUsersWidget][id$=_Checkbox_RowId_0_CHECKBOX]").click()
	* delay(3000)
	* waitForEnabled("input[type=checkbox][id^=LinkedUsersWidget][id$=_userToDeptMemberCheckbox_CHECKBOX]").click()
	* delay(3000)
	* waitForEnabled("input[type=Submit][id^=LinkedUsersWidget][id$=_linkPrivHolderBtn]").click()
	* delay(3000)
	* waitUntil("document.readyState == 'complete'")
	* waitForEnabled("input[type=Submit][value='OK']").click()
	* delay(3000)
	* def logout01Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@logout')
		
	Examples:
        | username				| departmentname		  |
        | OASIS 				| SELF_SERVICE_USER_GROUP |
		| OASIS 				| Registration Centre - Sensitive Engagement |
		| SVC_APIM_EOS_PS_TST 	| SELF_SERVICE_USER_GROUP |
		