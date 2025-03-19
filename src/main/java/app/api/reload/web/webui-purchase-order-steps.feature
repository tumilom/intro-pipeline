Feature: Purchase Orders UI steps
	Background: 
	* def JavaApp = Java.type('app.App')

	@createSurgeryPO
 	Scenario: Create Surgery PO
	* def startTime = JavaApp.currentTimeMillis()
	* waitForEnabled("{span}Surgery QE").click()	
	* waitForEnabled("input[type=Text][id$=_DateReceived]")
	* mouse().move('input[type=Text][id$=_DateReceived]').click()
	* waitForEnabled("input[type=Text][id$=_DateReceived]").input(dateNow)
	* mouse().move('input[type=Text][id$=_SurgeryDate]').click()
	* def selEntitlement = call read('classpath:app/api/reload/web/select-entitlement.feature'){entCode:'AFT100'}
	* select('select[id$=_Priority]','{}Urgent (0 - 30 Days)').delay(100)
	* select('select[id$=_Surgery_Body_Site]','{}Ankle - Left').delay(100)
	* select('select[id$=_SurgeryManagingSite]','{}Northern Service Centre').delay(400)
	
	
	* waitForEnabled("select[id$=_VendorBean]").focus()
	* delay(1000)
	* waitForEnabled("select[id$=_VendorBean]").click()
	* delay(1000)
	* waitForEnabled("textarea[id$=_extSurgeryARTPDiagnosis]").input('Diagnosis by Karate')
	
	* waitForEnabled("select[id$=_VendorBean]").click()
	* select('select[id$=_VendorBean]','{}TRBoulcott Hospital')
	* waitForEnabled("select[id$=_ProviderBean]")	
	* select('select[id$=_ProviderBean]','{}Usmar, Sarah, Dr').delay(100)
	* waitForEnabled("select[id$=_FacilityBean]")	
	* waitUntil("document.readyState == 'complete'")
	* select('select[id$=_FacilityBean]','{}Boulcott Hospital & Specialist Centre').delay(100)
	* waitUntil("document.readyState == 'complete'")
	* waitForEnabled("input[value='Create PO']").click()
	* waitForEnabled("input[value='Authorise PO']").click()
	* waitForEnabled("input[value='Save PO']").click()
	* def duration = JavaApp.logEvent("createSurgeryPO", startTime, karate)	
	#* waitForEnabled("input[id$='warningsLeavingPagePopup_yes']").click()
	
	@createACC32
 	Scenario: Create ACC32 Treatment Extension
	* def startTime = JavaApp.currentTimeMillis()
	* waitForEnabled("{span}ACC32 QE").click()
	* waitForEnabled("input[type=Text][id$=_vendorcode]").input('VAB908')
	* mouse().move('input[id$=_providercode]').click()
	* waitForEnabled("input[type=Text][id$=_providercode]").input('A51778')
	* mouse().move('input[id$=_ACC32FormNo]').click()
	* waitForEnabled("input[type=Text][id$=_ACC32FormNo]").input(caseNumber + dateNow)
	* mouse().move('input[type=Text][id$=_DateSigned]').click()
	* waitForEnabled("input[type=Text][id$=_DateSigned]").input(dateNow)
	* mouse().move('input[type=Text][id$=_DateSigned]').click()
	* def selEntitlement = call read('classpath:app/api/reload/web/select-entitlement.feature'){entCode:'COPY'}
	* waitForEnabled("input[value='Create and Authorise PO']").click()
	* waitForText('body', 'Choose a purchase order document type')
	* waitForEnabled("input[value='Cancel']").click()
	* def duration = JavaApp.logEvent("createACC32", startTime, karate)

	@createGeneral
 	Scenario: Create ACC32 Treatment Extension
	* def startTime = JavaApp.currentTimeMillis()		
	* waitForEnabled("{span}General QE").click()
	* waitForEnabled("select[id$=_RehabActionBean]")	
	* select('select[id$=_RehabActionBean]','{}Home and Living').delay(100)
	* mouse().move('input[id$=_providercode]').click()
	* waitForEnabled("select[id$=_InterventionTypeBean]")	
	* select('select[id$=_InterventionTypeBean]','{}Medical Notes/Reports - SIHL').delay(100)
	* def selEntitlement = call read('classpath:app/api/reload/web/select-entitlement.feature'){entCode:'COPY'}
	
	* waitForEnabled("input[type=Text][id$=_periodEndDate0]").input(dateNow)
	
	* waitForEnabled("input[type=Text][id$=_vendorcode]").input('VAB908')
	* mouse().move('input[id$=_providercode]').click()
	* waitForEnabled("input[type=Text][id$=_providercode]").input('A51778')
	
	* waitForEnabled("input[value='Create PO']").click()
	* waitForEnabled("input[value='Authorise PO']").click()
	* waitForEnabled("input[value='Save PO']").click()
	* def duration = JavaApp.logEvent("createGeneral", startTime, karate)