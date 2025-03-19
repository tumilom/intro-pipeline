@ignore
@updateClaimantIRD
Feature: Setup Claimants for Payments
    Background: 
        # Updating IRD number
		# For unittesting uncomment 2 lines below and remove @ignore
		#* def eosCustomerNo = '20103033'
		#* def irdNo = '123123123'
    Scenario: Update Claimant on ${RUNID}<seq>
        Given url WSC_CSS_URL + 'UpdateClaimant'
        * configure headers  = WSC_HTTP_HEADERS		
		* def payload = read('classpath:app/api/reload/services-css/posts/UpdateClaimant-IRD-request.xml') 
        * print 'Updating '+ eosCustomerNo +' Claimant'
        And request payload
        When method post
		* print response
        Then status 200
		* def customerNo  = karate.xmlPath(response , "/WSUpdateResponse/additional-data-set/additional-data[./name/text()='PARAM_STR_CUSTOMERNO']/value")
		* print customerNo
		Then match response /WSUpdateResponse/additional-data-set/additional-data[./name/text()='PARAM_STR_CUSTOMERNO']/value == eosCustomerNo
        Then match response count(/WSUpdateResponse/oid-list/oid[   starts-with(text(),'PE:11536:')  ]) == 1
