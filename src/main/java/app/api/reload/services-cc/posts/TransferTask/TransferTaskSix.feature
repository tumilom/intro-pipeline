#@ignore
@TransferTaskSix
Feature:
    Background:
        * def taskOid =  'PE:11554:0255099792'
        * def taskTransferToUserId = ''
		* def boeVersion = '13'
		* def taskOid1 =  'PE:11554:0255099885'
        * def taskTransferToUserId1 = 'YANGS'
		* def boeVersion1 = '2'
		* def configParam = 'TransferTask'
 
    Scenario: one request has two same tasks 
 
        Given url WSC_CC_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        * def payload = read('classpath:app/api/reload/services-cc/posts/TransferTask/TransferTaskSix-request.xml') 
		And request payload

        When method post
        * print response
        Then match response count(/WSUpdateAttrResponse/oid-list/oid) == 2
        Then status 200