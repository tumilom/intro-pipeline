#@ignore
@TransferTask
Feature:
    Background:
       # * def taskOid =  'PE:11554:0283028810'
        * def taskTransferToUserId = 'YANGS'

		* def configParam = 'TransferTask'

    Scenario: TransferTask

        Given url WSC_CC_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        * def payload = read('classpath:app/api/reload/services-cc/posts/TransferTask-request.xml') 
		And request payload
	
        
        When method post
        * print response
        Then match response count(/WSUpdateAttrResponse/oid-list/oid) == 1
        Then status 200
		