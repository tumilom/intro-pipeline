@CreateClaimSubCase
Feature:
    Background:
	   # * def parentCaseNumber = '10060066374'
		* def subCaseCaseTypeName = 'Recovery Plan'
      
		* def configParam = 'CreateClaimSubCase'

    Scenario: Create outcome measure

        Given url WSC_CC_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        * def payload = read('classpath:app/api/reload/services-cc/posts/CreateClaimSubCase-add.xml') 
        And request payload
        When method post
        * print response
        Then status 200
		* def caseNumberCreated  = karate.xmlPath(response , "/WSUpdateResponse/additional-data-set/additional-data[./name/text()='SUBCASE_CASENUMBER']/value")
		* print caseNumberCreated