
@createPerson, @wip
Feature:
    Background: 
        # attempt to create person via SOAP - work in progres
		# this folder is NOT picked up by karate - so it is fine to leave it here while broken 
    
    Scenario Outline: Create person
        * def path = '/PartyServices'

        Given url WS_REST_URL + path
        
        * configure headers  = WS_HTTP_HEADERS_REST
        And request read('.xml')
        When method post
        * print response
        Then status 200

        Examples:
        | partyTemplate | classExtensions |
        
		
