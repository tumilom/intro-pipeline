@CreateOutcomeMeasure
Feature:
    Background:
	    #* def recoverPlanCaseNumber = '10060066387-RP'
		* def myACCCustomerNo = 'MYACC:' + CustomerNo
        #* def outcomeMeasureType = 'HCG TOOL'
		
		* def configParam = 'CreateOutcomeMeasure'

    Scenario: Create outcome measure

        Given url WSC_CSS_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        * def payload = read('classpath:app/api/reload/services-css/posts/CreateOutcomeMeasure-add.xml') 
        And request payload
        When method post
        * print response
        Then status 200