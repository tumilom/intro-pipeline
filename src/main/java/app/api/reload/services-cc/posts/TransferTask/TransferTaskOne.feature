#@ignore
@TransferTaskOne
Feature:
    Background:
        * def taskOid =  'PE:11554:0255099792'
        * def taskTransferToUserId = 'YANGS'
		* def boeVersion = '2'
		* def configParam = 'TransferTask'
 
    Scenario: Transfer Task to a valid user
 
        Given url WSC_CC_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        * def payload = read('classpath:app/api/reload/services-cc/posts/TransferTask/TransferTaskOne-request.xml') 
		And request payload

        When method post
        * print response
        Then match response count(/WSUpdateAttrResponse/oid-list/oid) == 1
        Then status 200