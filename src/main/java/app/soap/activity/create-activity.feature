
@createTask
Feature:
    Background: 
        # attempt to create task via SOAP - work in progres
		# this folder is NOT picked up by karate - so it is fine to leave it here while broken 
    
    Scenario Outline: Create activity <taskType> on <caseNumber>
        * def path = '/services/ActivityServices'

        Given url WS_REST_URL + path
        * set WS_HTTP_HEADERS_REST.SOAPAction = 'urn:createTask'
		* set WS_HTTP_HEADERS_REST.Content-Type = 'text/xml; charset=UTF-8'
        * configure headers  = WS_HTTP_HEADERS_REST
        And request read('create-activity-request.xml')
        When method post
        * print response
        Then status 200

        Examples:
        | caseNumber   | taskType								 |
        | 10060066950  | AUTO: You Have Mail Medical notes added |
        
		
