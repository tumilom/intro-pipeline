#@ignore
@UpdateTaskTwo
Feature:
    Background:
        * def taskOid =  'PE:11554:255103003'
        * def userId = 'YANGS'
		* def boeVersion = '0'
		* def actionType = 'CANCEL'
		* def configParam = 'UpdateTask'

    Scenario: Cancel a Task

        Given url WSC_CC_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        
        * def payload = read('classpath:app/api/reload/services-cc/posts/UpdateTask/UpdateTaskTwo-request.xml') 
		And request payload
	
        
        When method post
        * print response
       
        Then status 200
		