@update-pic-wpi
Feature: 
 Background:

	* configure retry = {count:2, interval:2000}
	* def JavaApp = Java.type('app.App');
	
	Scenario: 
		* def assessmentStatus = 'Approved'
		* def decisionDate = JavaApp.daysInPast('0','dd/MM/yyyy')
		* def assessmentDate = JavaApp.daysInPast('0','dd/MM/yyyy')
		* def wpiScoredence = '75'
		
		* def picCaseNo = 'PIC10060066414'
	
	Given driver FRONTOFFICE_URL +'/home.jsp'
	* waitUntil("document.readyState == 'complete'")
	
		* driver url = FRONTOFFICE_URL +'/home.jsp'	
		* def sfc1Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@searchForCase'){ caseNo : '#(picCaseNo)'}	
		* waitForEnabled("input[value=Close]")
		* def awpiRes = call read('classpath:app/api/reload/web/webui-claim-pic-steps.feature@approveWPI'){assessmentStatus : '#(assessmentStatus)',decisionDateVal : '#(decisionDate)', assessmentDateVal : '#(assessmentDate)',wpiScoredenceVal : '#(wpiScoredence)'}		