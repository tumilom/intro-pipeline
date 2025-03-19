#@ignore
@casedetails-purchaseorder
Feature: Read casedetails-purchaseorder
    Background: 	
		# For a unit testing uncomment lines below, update values, remove @ignore
		#* def poList = '11878653,11878656'
		* def strUserid = 'OASIS'		
		
   Scenario: casedetails-purchaseorder
        * def path = '/casedetails/purchaseorder/bulkread'

        Given url WS_REST_URL + path       
        * configure headers  = WS_HTTP_HEADERS_REST
		And param PO-REFNO-LIST = poList
		And param userid = strUserid
		
		When method get
		* print response
		Then status 200
		
		#Then match response count(/ReadPurchaseOrderResponse/OLApprovalGroup) == 2
		
	Scenario Outline: caseDetailsWithPurchaseOrders
	
		* def caseAlias = 'ZA55344'
		#* def caseAlias = 'RT87585'
		
		* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(caseAlias)' }
		
        * def path = '/casedetails/purchaseorder/bulkread'

        Given url WS_REST_URL + path       
        * configure headers  = WS_HTTP_HEADERS_REST
		And param PO-REFNO-LIST = overviewResult.poList
		And param userid = strUserid
		
		When method get
		* print response
		Then status 200
				
		Then match response count(/ReadPurchaseOrderResponse/OLApprovalGroup) == 3
			
	@caseDetailsWithPurchaseOrders		
	Examples:
        | seq	| 
        | 13 	| 	
