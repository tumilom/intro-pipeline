#@ignore
@UpdateTaskFour
Feature:
    Background:
        * def taskOid =  'PE:11554:255103060'
        * def userId = 'YANGS'
		* def boeVersion = '0'
		* def actionType = 'OFFHOLD'
		* def configParam = 'UpdateTask'

    Scenario: Take a Task off hold

        Given url WSC_CC_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        
        * def payload = read('classpath:app/api/reload/services-cc/posts/UpdateTask/UpdateTaskFour-request.xml') 
		And request payload
	
        
        When method post
        * print response
       
        Then status 200
		