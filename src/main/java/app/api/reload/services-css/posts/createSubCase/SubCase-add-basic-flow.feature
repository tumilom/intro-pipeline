@ignore
@SubCase-add-basic-flow
Feature:
    Background:
	    * def parentCaseNumber = '10060080877'
		* def subCaseCaseTypeName = 'Client Reimbursement'
      
		* def configParam = 'SubCase'

    Scenario: Create outcome measure

        Given url WSC_CSS_URL +  configParam
        * configure headers  = WSC_HTTP_HEADERS
        * def payload = read('classpath:app/api/reload/services-css/posts/createSubCase/SubCase-add-basic-flow.xml') 
        And request payload
        When method post
        * print response
        Then status 200
		* def caseNumberCreated  = karate.xmlPath(response , "/WSUpdateResponse/additional-data-set/additional-data[./name/text()='SUBCASE_CASENUMBER']/value")
		* print caseNumberCreated