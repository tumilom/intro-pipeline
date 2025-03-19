@ignore
@CreateEformTask-basic-flow
Feature:
    Background:         		
		* def claimantCustomerNo = '20114028'
		* def claimantIRDNo = '013314667'			
		
    Scenario: CreateEformTask information
        Given url WSC_CC_URL +  'CreateEformTask'
        * configure headers  = WSC_HTTP_HEADERS
 
		* def payload = read('classpath:app/api/reload/services/posts/create-eform-task/CreateEformTask-basic-flow-request.xml') 
               
	   And request payload
        When method post
		* print response
		* def taskCreated = karate.xmlPath(response , "/WSUpdateResponse/oid-list/oid/text()")
		* print taskCreated
        Then status 200
		
		