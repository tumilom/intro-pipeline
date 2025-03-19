@ignore
@CreateOutcomeMeasure-add-basic-flow
Feature:
    Background:
	
		* def recoverPlanCaseNumber = '10060066478-RP'
		* def myACCCustomerNo = 'MYACC:20103045'
		* def outcomeMeasureType = 'HCG TOOL'	
		* def configParam = 'CreateOutcomeMeasure'

        Scenario: Create outcome measure
	
        Given url WSC_CSS_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        And param param_str_caseNumber = recoverPlanCaseNumber
		And param param_str_userid = myACCCustomerNo
		And param PARAM_STR_ASSMTTYPE = outcomeMeasureType
        * def payload = read('classpath:app/api/reload/services-css/posts/createOutcomeMeasure/CreateOutcomeMeasure-add-basic-flow.xml') 
        And request payload
        When method post
        * print response
        Then status 200
		
	