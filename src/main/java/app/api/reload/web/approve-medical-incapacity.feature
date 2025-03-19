@acc18approve
Feature: Payments setup automation
 Background:

	* configure retry = {count:12, interval:2000}
	
	Scenario Outline: Approve Med Cert on ${RUNID}<seq>
	* def claimFormNumber = RUNID + '<seq>'	
	* print 'About to update ' +claimFormNumber 
    Given driver FRONTOFFICE_URL +'/home.jsp'
	* waitUntil("document.readyState == 'complete'")
	* waitForEnabled("a[aria-label='Claims']")
	* mouse().move("a[aria-label='Claims']").click()
	* waitForEnabled("input[id$=_caseNumber]").input(claimFormNumber)
	* waitForEnabled("input[value=Search]").click()
	* waitForEnabled("input[value=Close]")
	
	* def acsRes = call read('classpath:app/api/reload/web/webui-claim-steps.feature@approveClaimSteps')
	* def amiRes = call read('classpath:app/api/reload/web/webui-claim-steps.feature@approveMedicalIncapacity')
	
	Examples:
        | seq	| 
		| 02 	|         
        | 03 	|         
		| 04 	|         
		| 05 	|         
		| 06 	|         
		| 07 	|         
		| 08 	|         
		| 09 	|         