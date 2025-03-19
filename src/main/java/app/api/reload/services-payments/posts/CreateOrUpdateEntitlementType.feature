#@ignore
@CreateOrUpdateEntitlementType
Feature: Setup CreateOrUpdateEntitlementType
    Background: 
		* def random_string =
			"""
			function(s) {
			var text = "";
			var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789";
			for (var i = 0; i < s; i++)
				text += possible.charAt(Math.floor(Math.random() * possible.length));
			return text;
			}
			"""
		* def CodeId = random_string(6)
	    * def Description = 'Karate testing'
	    * def JavaApp = Java.type('app.App');
		* def extCommissionDate = JavaApp.daysFromNow('-10')
		* def extDecommissionDate = JavaApp.daysFromNow('10')
	   
    Scenario: CreateOrUpdateEntitlementType
        Given url WSC_PAYMENTS_URL + 'CreateOrUpdateEntitlementType'
        * configure headers  = WSC_HTTP_HEADERS
		* def payload = read('classpath:app/api/reload/services-payments/posts/CreateOrUpdateEntitlementType-request.xml') 		
        
        And request payload
        When method post
		* print response		
		
        Then status 200
	