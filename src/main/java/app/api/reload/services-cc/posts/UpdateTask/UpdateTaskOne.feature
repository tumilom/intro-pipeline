#@ignore
@UpdateTaskOne
Feature:
    Background:
        * def taskOid =  'PE:11554:2551006'
        * def userId = 'YANGS'
		* def boeVersion = '1'
		* def actionType = 'CLOSE'
		* def configParam = 'UpdateTask'

    Scenario: Close a Task

        Given url WSC_CC_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        
        * def payload = read('classpath:app/api/reload/services-cc/posts/UpdateTask/UpdateTaskOne-request.xml') 
		And request payload
	
        
        When method post
        * print response
       
        Then status 200
		