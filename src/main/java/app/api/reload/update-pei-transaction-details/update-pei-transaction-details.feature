@updatepei
Feature:
    Background: 
        * def configParam = 'UpdatePEITransactionDetails'
		* def JavaApp = Java.type('app.App');
		* def updatePeiTransStatusDate = JavaApp.daysFromNow('0')
		
    
    Scenario Outline: Update batch <updatePeiBatchId> to SUCCESS
       
        Given url WSC_PAYMENTS_URL + configParam
        * configure headers  = WSC_HTTP_HEADERS
        And request read('update-pei-transaction-details-status-to-sent-request.xml')
        When method post
       
        * print response
		Then status 200

        Examples:
        | updatePeiBatchId      				  |
        | 20240705_110738_DirectCreditFile_Manual |
        
    
   