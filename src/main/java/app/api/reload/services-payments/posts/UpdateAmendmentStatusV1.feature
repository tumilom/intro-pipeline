#@ignore
@UpdateAmendmentStatusV1
Feature: Setup UpdateAmendmentStatusV1
    Background: 
       #* def status = 'FAILED'
	   #* def refNumber = '4324483'
       #* def submissionKey = '850769536'
	   
    Scenario: UpdateAmendmentStatusV1
        Given url WSC_PAYMENTS_URL + 'UpdateAmendmentStatusV1'
        * configure headers  = WSC_HTTP_HEADERS
		* def payload = read('classpath:app/api/reload/services-payments/posts/UpdateAmendmentStatusV1-request.xml') 		
        
        And request payload
        When method post
		* print response		
		
        Then status 200
	