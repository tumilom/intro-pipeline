#@ignore
@UpdateTask
Feature:
    Background:
       # * def taskOid =  'PE:11554:0283028810'
        * def userId = 'YANGS'
		* def configParam = 'UpdateTask'

    Scenario: UpdateTask

        Given url WSC_CC_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        
        * def payload = read('classpath:app/api/reload/services-cc/posts/UpdateTask-request.xml') 
		And request payload
	
        
        When method post
        * print response
       
        Then status 200
		