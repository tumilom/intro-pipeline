@add-fatal-parties
Feature: add person record
 Background:
    
	* def JavaApp = Java.type('app.App');
	
	Scenario Outline: 
	* def dateOfBirth = JavaApp.daysInPast('<dateOfBirthOffSet>','dd/MM/yyyy')
	* print dateOfBirth
	
	Given driver FRONTOFFICE_URL +'/home.jsp'
	* waitUntil("document.readyState == 'complete'")
	
	* def sfc01Res = call read('classpath:app/api/reload/web/webui-party-steps.feature@searchForPerson'){firstNames :'<firstNames>' ,lastName :'<lastName>'}
	* def cspoRes = call read('classpath:app/api/reload/web/webui-party-steps.feature@addNewPerson'){firstNames :'<firstNames>' ,lastName :'<lastName>',dateOfBirthVal :'#(dateOfBirth)',irdNumberVal0 :'<irdNumberVal0>',irdNumberVal1 :'<irdNumberVal1>',irdNumberVal2 :'<irdNumberVal2>',genderVal :'<genderVal>',ethnicityVal :'<ethnicityVal>',addressLine1Val :'<addressLine1Val>',suburbVal :'<suburbVal>',cityVal :'<cityVal>',postCodeVal :'<postCodeVal>'}
	* print cspoRes

 Examples:
	    | read('add-fatal-parties.csv') | 
		
		