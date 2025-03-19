#@ignore
@cc_documents
Feature: ccapi cc_documents

    Background: 
		# For a given claim, get cc_documents 		
		#* def claimNumber = '10060067370'
		
    Scenario: <claimNumber> cc_documents
		* def path = '/cases/<path-claimNumber>/documents'		
		* replace path.path-claimNumber = claimNumber
		
		Given url CONTACT_CENTRE_API_URL + path
		
        * configure headers = JSONAPI_HTTP_HEADERS_CC		
		 
		When method get
		* print response	
		
		* def extVCFContentID = karate.jsonPath(response, "$.elements[?(@.status.name == 'Incomplete' && @.type.name == 'Document' )].extensions.extVCFContentID")
		* print "Document extVCFContentIDs: " + extVCFContentID	
			
		* def fileName = karate.jsonPath(response, "$.elements[?(@.extensions.extVCFContentID == '"+ extVCFContentID +"' )].fileName")	
		* print "Document fileName: " + fileName	

		Then status 200
		