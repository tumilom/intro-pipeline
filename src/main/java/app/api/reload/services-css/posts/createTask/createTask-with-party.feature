@ignore
@createTask-with-party
Feature:
    Background: 
        # attempt to create task via SOAP - work in progress
		# this folder is NOT picked up by karate - so it is fine to leave it here while broken 
    
    Scenario Outline: Create activity <taskType> on <caseNumber>
        * def path = '/services/ActivityServices'

        Given url WS_REST_URL + path
        * set WS_HTTP_HEADERS_REST.SOAPAction = 'urn:createTask'
		* set WS_HTTP_HEADERS_REST.Content-Type = 'text/xml; charset=UTF-8'
        * configure headers  = WS_HTTP_HEADERS_REST
        And request read('classpath:app/api/reload/services-css/posts/createTask/createTask-with-party.xml')
        When method post
        * print response
        Then status 200

        Examples:
        | caseNumber   | taskType						   | customerNo  |
        |              | Contact Party (Case Owner)        | 20141028    |
        
		
