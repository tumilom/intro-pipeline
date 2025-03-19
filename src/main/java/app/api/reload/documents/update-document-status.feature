@updateDocumentStatus
Feature: Working with Documents
    Background: 
        # Updating Document Status
		# For unittesting uncomment 2 lines below and remove @ignore	
		
	    #	* def documentContentId = 'DT-EOS-00000000000098463836'
	    #	* def filename = '2024/10/23/3dd60fb4-fb7e-41a9-9cf3-57b460315e23.docx'
		
		
    Scenario: Update document <documentContentId> status
        Given url WSC_CC_URL + 'UpdateDocument'
        * configure headers  = WSC_HTTP_HEADERS
		* def payload = read('classpath:app/api/reload/documents/UpdateDocumentStatus-request.xml') 
        * print 'Updating document '+ documentContentId +' status'
        And request payload
        When method post
		* print response
        Then status 200
		Then match response /WSUpdateResponse/additional-data-set/additional-data[./name/text()='SERVICE_RESPONSE_CODE']/value == '200'
