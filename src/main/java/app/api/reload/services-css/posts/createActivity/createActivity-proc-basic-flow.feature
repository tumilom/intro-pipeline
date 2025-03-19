@ignore
@createActivity-proc-basic-flow
Feature:
    Background: 
        # Create an Activity via SOAP

    
    Scenario Outline: Create activity <procType> on <caseNumber> and <customerNo>
        * def path = '/services/ActivityServices'

        Given url WS_REST_URL + path
        * set WS_HTTP_HEADERS_REST.SOAPAction = 'urn:createActivity'
		* set WS_HTTP_HEADERS_REST.Content-Type = 'text/xml; charset=UTF-8'
        * configure headers  = WS_HTTP_HEADERS_REST
        And request read('classpath:app/api/reload/services-css/posts/createActivity/createActivity-proc-basic-flow.xml')
        When method post
		* string responseStr = karate.pretty(response)
		* karate.write(responseStr, '../src/test/java/app/api/reload/services-css/posts/createActivity/createActivity-proc-basic-flow-response 24.2.txt')
		* print response
		Then status 200

        Examples:
        |customerNo	|caseNumber  | taskType / processType	|
		|20103053	|10060068371 | PRC APP: Appeal Process 	|
        
		
