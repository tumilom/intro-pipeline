@updateEmployerPP
Feature: Update employer Payment Preference
 Background:
	
	* configure retry = {count:12, interval:2000}
	* def JavaApp = Java.type('app.App');
	Scenario Outline: Update <partyRef> payment preference
	* def waitTime = JavaApp.waitFewSecsMaybe();
	* print waitTime
	Given driver FRONTOFFICE_URL +'/home.jsp'
	* def login01Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@loginAsOrdinaryUser')
	* waitUntil("document.readyState == 'complete'")
	* waitForEnabled("a[aria-label='Open Party']")
	* mouse().move("a[aria-label='Open Party']").click()
	* waitForEnabled("{div}Employer").click()	
	* waitForEnabled("input[id$=_Registration_Number]").input('<partyRef>')
	* waitForEnabled("input[value=Search]").click()
	* waitForEnabled("input[value=Close]")
	* waitForEnabled("td[id$=_More_Tabs_cell]").click()	
	* waitForEnabled("{a}Payment Preferences").click()	
	* waitForEnabled("input[value=Add]")
	* def listIsEmpty = exists("//label[normalize-space(text()) ='0-0 of 0']")
	* def params = {bankCode :'<bankCode>' ,bankBranch :'<bankBranch>',accountNo :'<accountNo>' ,suffix :'<suffix>'}	
	* if (listIsEmpty) karate.call(true, 'classpath:app/api/reload/web/webui-party-steps.feature@addBankAccount',  params	)
	* def logout01Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@logout')
	
	Examples:
        | partyRef 	 | bankCode | bankBranch | accountNo | suffix | 
        | B5154738E  | 02		| 0500 		 | 	0400000  |	   11 |
		| CN135780D  | 02		| 0500		 |	0400000  |	   12 |
		| R3715941E  | 02		| 0500		 |	0400000  |	   15 |
      
				