@bootstrap
@ListWSComposerServices
Feature: List all WSC services
    Background: 
		# For a unit testing uncomment lines below, update value, remove @ignore			
		* def sortCsvLine = function(jsString) { return  jsString.split(',').sort() }
		
    Scenario: Validate ${WSC_CC_URL}
        Given url WSC_CC_URL +  'webservice?getservices'
        * configure headers  = WSC_HTTP_HEADERS 	

		When method get
		* def sortedResponse = sortCsvLine(response)
		Then status 200	
		* print sortedResponse 
		Then match sortedResponse == ["BroadcastTask","CreateClaimSubCase","CreateCustomerTaxCodes","CreateOrUpdateCustomerContactDetails","CreateUpdateCustomerAddressDetails","FacilitySearchIntegration","GetTasksForCase","PartyPeriods","ProviderSearchIntegration","ReadCRMClientDetailsv1","ReadCaseEco","ReadCaseOverview","ReadCaseOwner","ReadClaimCollectionPoints","ReadClaimIndicators","ReadClaimIndicatorsv1","ReadClaimStatus","ReadCustomerDetails","ReadCustomerDetailsv1","ReadCustomerDetailsv2","ReadDocumentAuthorisation","ReadDomainInstances","ReadECODetails","ReadOccupationDetails","ReadPartyFlags","ReadPartyIndicators","ReadPartyIndicatorsv1","ReadPartyIndicatorsv2","ReadTasksForCase","TransferTask","UpdateCustomerDetails","UpdateCustomerDetailsv1","UpdateDocument","UpdateOrCreateFacility","UpdateOrCreateParty","UpdateOrCreateProvider","UpdateOrCreateProviderv1","UpdateOrCreateVendor","UpdatePartyPeriods","UpdateTask","UploadXmlDocument","VendorSearchIntegration"]

	Scenario: Validate ${WSC_CSS_URL}
        Given url WSC_CSS_URL +  'webservice?getservices'
        * configure headers  = WSC_HTTP_HEADERS 	

		When method get
		Then status 200	
		* def sortedResponse = sortCsvLine(response)
		* print sortedResponse 
		Then match sortedResponse == ["CreateAbatementEarnings","CreateAbatementOccupation","CreateInvoice","CreateOrUpdateClaimantAddress","CreateOrUpdateClaimantEmail","CreateOrUpdateClaimantPhone","CreateOutcomeMeasure","ReadCaseManagementDetails","ReadCaseManagementDetailsv1","ReadClaim","ReadClaimInjuryDetails","ReadClaimsForParty","ReadClaimsForPartyv1","ReadClaimsForPartyv2","ReadClaimv1","ReadClaimv2","ReadClaimv3","ReadClientDetails","ReadClientDetailsv1","ReadEarningsCalculationDetails","ReadInvitationDetails","ReadInvoice","ReadLatestEformsForClaimAndType","ReadNextPaymentOutEvent","ReadOutcomeMeasures","ReadPIClaimsForParty","ReadPostIncapacityEarningsDetails","ReadTasks","ReadTasksForCase","SearchClient","SubCase","UpdateClaimant","UpdateInvitationDetails","UpdateMyAccManagedIndicatorStatus"]

	Scenario: validate ${WSC_PS_URL}
        Given url WSC_PS_URL +  'webservice?getservices'
        * configure headers  = WSC_HTTP_HEADERS 	

		When method get
		Then status 200	
		* def sortedResponse = sortCsvLine(response)
		* print sortedResponse 
		Then match sortedResponse == ["BroadcastTask","CreateClaimSubCase","CreateCustomerTaxCodes","CreateOrUpdateCustomerContactDetails","CreateUpdateCustomerAddressDetails","FacilitySearchIntegration","GetTasksForCase","PartyPeriods","ProviderSearchIntegration","ReadCRMClientDetailsv1","ReadCaseEco","ReadCaseOverview","ReadCaseOwner","ReadClaimCollectionPoints","ReadClaimIndicators","ReadClaimIndicatorsv1","ReadClaimStatus","ReadCustomerDetails","ReadCustomerDetailsv1","ReadCustomerDetailsv2","ReadDocumentAuthorisation","ReadDomainInstances","ReadECODetails","ReadOccupationDetails","ReadPartyFlags","ReadPartyIndicators","ReadPartyIndicatorsv1","ReadPartyIndicatorsv2","ReadTasksForCase","TransferTask","UpdateCustomerDetails","UpdateCustomerDetailsv1","UpdateDocument","UpdateOrCreateFacility","UpdateOrCreateParty","UpdateOrCreateProvider","UpdateOrCreateProviderv1","UpdateOrCreateVendor","UpdatePartyPeriods","UpdateTask","UploadXmlDocument","VendorSearchIntegration"]

	Scenario: Validate ${WSC_JUNO_URL}
        Given url WSC_JUNO_URL +  'webservice?getservices'
        * configure headers  = WSC_HTTP_HEADERS 	

		When method get
		Then status 200	
		* def sortedResponse = sortCsvLine(response)
		* print sortedResponse 
		Then match sortedResponse == ["CreateEformTask","CreateOrUpdateEmployer","UpdateEmployerClassification"]

	Scenario: Validate ${WSC_PAYMENTS_URL}
        Given url WSC_PAYMENTS_URL +  'webservice?getservices'
        * configure headers  = WSC_HTTP_HEADERS 	

		When method get
		Then status 200	
		* def sortedResponse = sortCsvLine(response)
		* print sortedResponse 
		Then match sortedResponse == ["CreateOrUpdateEntitlementType","ReceiveSubmissionKeyV1","UpdateAmendmentStatusV1","UpdateIRFlag","UpdateKiwiSaverStatus","UpdatePEITransactionDetails"]
