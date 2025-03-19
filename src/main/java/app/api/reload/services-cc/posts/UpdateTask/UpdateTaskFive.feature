#@ignore
@UpdateTaskFive
Feature:
    Background:
        * def taskOid =  'PE:11554:255103060'
        * def userId = 'YANGS'
		* def boeVersion = '5'
		* def actionType = 'UPDATE'
		* def configParam = 'UpdateTask'

    Scenario: Update a Task

        Given url WSC_CC_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        
        * def payload = read('classpath:app/api/reload/services-cc/posts/UpdateTask/UpdateTaskFive-request.xml') 
		And request payload
	
        
        When method post
        * print response
       
        Then status 200
		