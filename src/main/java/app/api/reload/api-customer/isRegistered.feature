@isRegistered
Feature:
     Background: 
		# For a given customer, check is registered
		# For a unit testing uncomment line below, update customerNo  value, remove @ignore		
		# * def customerNo = '20093286'
		
	Scenario: Is customer registered
        * def path = '/isRegistered'

        Given url CUSTOMER_API_URL + path
        * configure headers = GET_HTTP_HEADER
        And header userid = 'ANONYMOUS_USER'
        And header ExternalUserId = 'MYACC:' + customerNo
        When method get
        * print response
         And if (response.registered == false) karate.call('classpath:app/api/reload/api-customer/posts/registerCustomer.feature', { customerNo: customerNo}) 
        Then status 200  