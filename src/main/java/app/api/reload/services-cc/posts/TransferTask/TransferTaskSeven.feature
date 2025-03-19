#@ignore
@TransferTaskSeven
Feature:
    Background:
        * def taskOid =  'PE:11554:0255099792'
        * def taskTransferToUserId = 'INVALID'
		* def boeVersion = '14'
		* def configParam = 'TransferTask'
 
    Scenario: Transfer Task to an invalid user
 
        Given url WSC_CC_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        * def payload = read('classpath:app/api/reload/services-cc/posts/TransferTask/TransferTaskSeven-request.xml') 
		And request payload

        When method post
        * print response
        Then match response count(/WSUpdateAttrResponse/oid-list/oid) == 1
        Then status 200