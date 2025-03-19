#@ignore
@update-combine-ia-entitlement-type
Feature: 
 Background:

	* configure retry = {count:2, interval:2000}
	* def JavaApp = Java.type('app.App');
	
	Scenario: 
		* def lumpSum = 'Yes'		
		* def flpPaid = 'Yes'
		* def wpiScore = '20.00'
		* def paidDate = '01/01/2020'
		* def applicationDate = '01/01/2020'
		
		* def picCaseNo = 'PIC10060066379'
	
	Given driver FRONTOFFICE_URL +'/home.jsp'
	* waitUntil("document.readyState == 'complete'")
	
		* driver url = FRONTOFFICE_URL +'/home.jsp'	
		* def sfc1Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@searchForCase'){ caseNo : '#(picCaseNo)'}	
		* waitForEnabled("input[value=Close]")
		* def awpiRes = call read('classpath:app/api/reload/web/webui-claim-pic-steps.feature@addCombinedIA'){lumpSumVal : '#(lumpSum)',flpPaidVal : '#(flpPaid)',paidDateVal:'#(paidDate)',applicationDateVal:'#(applicationDate)',lumpsumWpiVal:'#(wpiScore)'}		