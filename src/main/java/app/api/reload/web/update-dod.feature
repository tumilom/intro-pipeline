@update-dod
Feature: add person record
 Background:

	* configure retry = {count:2, interval:2000}
	* def JavaApp = Java.type('app.App');
	
	Scenario: 
	* def dateOfDeath = JavaApp.daysInPast('3','dd/MM/yyyy')
	* print dateOfDeath
	* def customerNo = '20093184'
	
	Given driver FRONTOFFICE_URL +'/home.jsp'
	* waitUntil("document.readyState == 'complete'")
	
	* def spbcRes = call read('classpath:app/api/reload/web/webui-party-steps.feature@searchPersonByCustomerNo'){customerNoVal :'#(customerNo)'}
	* def udpRes = call read('classpath:app/api/reload/web/webui-party-steps.feature@updateDeceasedPerson'){dateOfDeathVal :'#(dateOfDeath)' }