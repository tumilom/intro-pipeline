#@ignore
@TransferTaskFive
Feature:
    Background:
        * def taskOid =  'PE:11554:0255099792'
        * def taskTransferToUserId = 'YANGS'
		* def boeVersion = '10'
		* def taskOid1 =  'PE:11554:0255099792'
        * def taskTransferToUserId1 = 'YANGS'
		* def boeVersion1 = '10'
		* def configParam = 'TransferTask'
 
    Scenario: one request has two same tasks 
 
        Given url WSC_CC_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        * def payload = read('classpath:app/api/reload/services-cc/posts/TransferTask/TransferTaskFive-request.xml') 
		And request payload

        When method post
        * print response
        Then match response count(/WSUpdateAttrResponse/oid-list/oid) == 1
        Then status 200