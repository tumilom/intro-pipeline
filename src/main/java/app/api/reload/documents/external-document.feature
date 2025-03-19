@ignore
@createDocumentFromExternalDocumentJunitTest
Feature:
	Background: 
		# Simple tests of createDocumentFromExternalDocument endpoint
		# For a unit testing uncomment line below, update medFeesNo value, remove @ignore
		#* def keyId = '10060066881'
		#* def systemUser = '_OASIS'
		#* def dmsDocType = 'WGTRANSCRIPT'
		#* def additionalMetadata = '_Daryl C_Coordinated_Compensation - Eligibility.pdf'
		#* def expectedStatus = 200
	@createExternalDoc	
    Scenario: Add external document
		* def JavaApp = Java.type('app.App');
		* def receivedDate = JavaApp.daysInPast('3','yyyyMMddHHmmss')
		* def receivedDateZulu = JavaApp.daysInPast('3','yyyy-MM-dd') +'T00:00:00Z'
		* def dmsDocId = dmsDocType + '_' + receivedDate + '_1_' + keyId + systemUser + additionalMetadata +'.pdf'
		* def documentContentId = 'KarateDMS-' + receivedDate       
		* print dmsDocId
        * def path = '/api/v1/document/createDocumentFromExternalDocument'
		Given url WS_REST_URL + path
        * configure headers = DOCUMENT_JSONAPI_HTTP_HEADERS
        And request read('classpath:app/api/reload/documents/add-external-document.json')
        When method post
        * print response
		Then assert responseStatus == expectedStatus
        
	