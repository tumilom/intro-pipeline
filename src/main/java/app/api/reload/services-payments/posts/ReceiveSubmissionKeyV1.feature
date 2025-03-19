#@ignore
@ReceiveSubmissionKeyV1
Feature: Setup ReceiveSubmissionKeyV1
    Background: 
       * def batchId = '20231031_133249_DirectCreditFile_Auto'
       * def submissionKey = '196035555'
	   
    Scenario: ReceiveSubmissionKeyV1
        Given url WSC_PAYMENTS_URL + 'ReceiveSubmissionKeyV1'	
        * configure headers  = WSC_HTTP_HEADERS
		* def payload = read('classpath:app/api/reload/services-payments/posts/ReceiveSubmissionKeyV1-request.xml') 		
        And request payload
        When method post
		* print response
		
		
        Then status 200
		
       
