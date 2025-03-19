@readDocumentAuthorisation
Feature: Read Document Authorisation
    Background: 
		# For unit testing uncomment @ignore and 2 lines below
		* def authUserID = 'OASIS'
		* def contentID = 'DT-EOS-00000000000098465128'
    Scenario: Document Authorisation
        Given url DOCUMENT_WSC_CC_URL
        * configure headers  = DOCUMENT_WSC_HTTP_HEADERS
		And param config = 'ReadDocumentAuthorisation'
		And param authUserID = authUserID
		And param contentID = contentID
		When method get
		* print response
		Then status 200
		Then match response /ReadDocumentAuthorisationResponse/additional-data-set/additional-data[./name/text()='READACCESS']/value == 'true'
		Then match response /ReadDocumentAuthorisationResponse/additional-data-set/additional-data[./name/text()='AUTHUSERID']/value == authUserID
		