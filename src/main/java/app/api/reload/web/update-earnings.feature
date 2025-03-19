@acc45earnings
Feature: Payments setup automation - Setup Earnings
 Background:
						
	* def JavaApp = Java.type('app.App');
	
	* configure retry = {count:12, interval:2000}
	
	Scenario Outline: Setup Earnings on ${RUNID}<seq>

    Given driver FRONTOFFICE_URL +'/home.jsp'
	
	* waitUntil("document.readyState == 'complete'")
	* waitForEnabled("a[aria-label='Claims']")
	* mouse().move("a[aria-label='Claims']").click()
	* def claimFormNumber = RUNID + '<seq>'	
	* waitForEnabled("input[id$=_caseNumber]").input(claimFormNumber)
	* waitForEnabled("input[value=Search]").click()
	* def effectiveDateVal = JavaApp.daysFromNow('<doaOffset>','dd/MM/yyyy')
	* print effectiveDateVal
	
	* def acpRes = call read('classpath:app/api/reload/web/webui-claim-steps.feature@addCollectionPoint'){effectiveDateval:'#(effectiveDateval)'}
	* def amiRes = call read('classpath:app/api/reload/web/webui-claim-steps.feature@setupEarnings'){ employerNumber:<employerNumber>, earnings01Amount:<shortTerm>, earnings02Amount:<longTerm>,employmentType:'Permanent',earnings01Type:'Short Term Earnings',earnings02Type:'Long Term Earnings'}
	
	Examples:
        | seq	| employerNumber | shortTerm | longTerm | doaOffset |
        | 02 	| U1323116E	     | 457 		 |  78091   | -21 |
    	| 03 	| U1323116E	     | 427 		 |  78191   | -21 |
		| 04 	| U1323116E	     | 477 		 |  78291   | -21 |
		| 05 	| U1323116E	     | 437 		 |  78391   | -21 |