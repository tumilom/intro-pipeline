#@ignore
@UpdateTaskThree
Feature:
    Background:
        * def taskOid =  'PE:11554:255103003'
        * def userId = 'YANGS'
		* def boeVersion = '2'
		* def actionType = 'ONHOLD'
		* def configParam = 'UpdateTask'

    Scenario: ONHOLD a Task

        Given url WSC_CC_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        
        * def payload = read('classpath:app/api/reload/services-cc/posts/UpdateTask/UpdateTaskThree-request.xml') 
		And request payload
	
        
        When method post
        * print response
       
        Then status 200
		