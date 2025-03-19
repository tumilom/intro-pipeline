@addPurchaseOrder
Feature: MFP Integration - Create Purchase Orders
 Background:

	* configure retry = {count:12, interval:2000}
	* def JavaApp = Java.type('app.App');
	* def dateNow = JavaApp.daysInPast('0','dd/MM/yyyy')
	
	Scenario Outline: Add Surgery purchase order to ${RUNID}<seq> 
	* def caseNumber = RUNID + '<seq>'
	* def waitTime = JavaApp.waitFewSecsMaybe();
	* print waitTime
	Given driver FRONTOFFICE_URL +'/home.jsp'
	* def login01Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@loginAsOrdinaryUser')
	* waitUntil("document.readyState == 'complete'")
	
	* def sfc01Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@searchForCase'){ caseNo : '#(caseNumber)'}
	* def cspoRes = call read('classpath:app/api/reload/web/webui-purchase-order-steps.feature@createSurgeryPO')
	* def logout01Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@logout')
		
	@addSurgeryPurchaseOrder		
	Examples:
        | seq	| 
        | 01 	| 
#		| 03 	| 
#		| 04 	| 
#		| 05 	| 
	
	
	Scenario Outline: Add ACC32 QE to ${RUNID}<seq> 
	* def caseNumber = RUNID + '<seq>'
	* def waitTime = JavaApp.waitFewSecsMaybe();
	* print waitTime
	Given driver FRONTOFFICE_URL +'/home.jsp'
	* def login01Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@loginAsOrdinaryUser')
	* waitUntil("document.readyState == 'complete'")
	
	* def sfc02Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@searchForCase'){ caseNo : '#(caseNumber)'}
	* def acc32Res = call read('classpath:app/api/reload/web/webui-purchase-order-steps.feature@createACC32')
	* def logout01Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@logout')

	@addTreatmentExtensionPurchaseOrder
	Examples:
        | seq	| 
        | 02	| 
#		| 03 	| 
#		| 04 	| 
#		| 05 	| 

	Scenario Outline: Add General QE to ${RUNID}<seq> 
	* def caseNumber = RUNID + '<seq>'
	* def waitTime = JavaApp.waitFewSecsMaybe();
	* print waitTime	
	Given driver FRONTOFFICE_URL +'/home.jsp'
	* def login01Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@loginAsOrdinaryUser')
	* waitUntil("document.readyState == 'complete'")
	
	* def sfc02Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@searchForCase'){ caseNo : '#(caseNumber)'}
	* def generalRes = call read('classpath:app/api/reload/web/webui-purchase-order-steps.feature@createGeneral')
	* def logout01Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@logout')

	@addGeneralPurchaseOrder
	Examples:
        | seq	| 
        | 03 	| 
#		| 03 	| 
#		| 04 	| 
#		| 05 	| 
