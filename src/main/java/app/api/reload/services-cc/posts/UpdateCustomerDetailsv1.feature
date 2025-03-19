@ignore
@UpdateCustomerDetailsv1
Feature: Setup UpdateCustomerDetailsv1
    Background: 
      # * strCustomerNumber = '20096038'				
	   
    Scenario: UpdateCustomerDetailsv1
        Given url WSC_CC_URL + 'UpdateCustomerDetailsv1'
        * configure headers  = WSC_HTTP_HEADERS
		* def payload = read('classpath:app/api/reload/services-cc/posts/UpdateCustomerDetailsv1-request.xml') 		
       
        And request payload
        When method post
		* print response	
		
        Then status 200
		
       
