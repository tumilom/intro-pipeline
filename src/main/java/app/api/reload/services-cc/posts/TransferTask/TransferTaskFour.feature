#@ignore
@TransferTaskFour
Feature:
    Background:
        * def taskOid =  'PE:11554:25509979'
        * def taskTransferToUserId = 'BURGESP'
		* def boeVersion = '5'
		* def configParam = 'TransferTask'
 
    Scenario: invalid taskoid 
 
        Given url WSC_CC_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        * def payload = read('classpath:app/api/reload/services-cc/posts/TransferTask/TransferTaskFour-request.xml') 
		And request payload

        When method post
        * print response
        Then match response count(/WSUpdateAttrResponse/oid-list/oid) == 1
        Then status 200