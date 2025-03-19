@ignore
@createProcessInstance-invalid
Feature:
    Background: 
        # Create a process instance

    
    Scenario Outline: Create process instance <processType> on <caseNumber> and <customerNo>
        * def path = '/services/ActivityServices'

        Given url WS_REST_URL + path
        * set WS_HTTP_HEADERS_REST.SOAPAction = 'urn:createProcessInstance'
		* set WS_HTTP_HEADERS_REST.Content-Type = 'text/xml; charset=UTF-8'
        * configure headers  = WS_HTTP_HEADERS_REST
        And request read('classpath:app/api/reload/services-css/posts/createProcessInstance/createProcessInstance-invalid.xml')
        When method post
		* string responseStr = response
		* karate.write(responseStr, '../src/test/java/app/api/reload/services-css/posts/createProcessInstance/createProcessInstance-invalid-response 24.2.txt')
		* print response
		Then status 500

        Examples:
        |customerNo	|caseNumber  | taskType									|
        |20103053	|10060068371 | MyACC Communication Entitlement Request 	|
        
		
