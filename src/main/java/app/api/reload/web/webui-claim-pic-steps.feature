Feature: UI steps
	Background: 
	* def JavaApp = Java.type('app.App')
@updateAccidentDate
	Scenario: update claim accident date 	
	* def startTime = JavaApp.currentTimeMillis()
	* waitForEnabled("input[type=submit][id$=EDIT_LINKEDIT_BUTTONCase_Details]").click()	
	* waitForEnabled("input[type=Text][id$=_AccidentDate]")	
	* mouse().move('input[type=Text][id$=_AccidentDate]').click()
	* waitForEnabled("input[type=Text][id$=_AccidentDate]").input(Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE+Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + accidentDateVal + Key.ENTER + Key.TAB + Key.TAB)	
	* waitForEnabled("input[type=Text][id$=_AccidentDate]")		
	* waitForEnabled("input[id$=_editPageSave][value=OK]").click().delay(1000)	
	* def duration = JavaApp.logEvent("updateAccidentDate", startTime, karate)

@updateIncurredDate
	Scenario: update claim incurred date
		* def startTime = JavaApp.currentTimeMillis()
		* waitForEnabled("input[type=submit][id$=EDIT_LINKEDIT_BUTTONClaim_Details]").click()	
		* waitForEnabled("input[type=Text][id$=_IncurredDate]")	
		* mouse().move('input[type=Text][id$=_IncurredDate]').click()
		* waitForEnabled("input[type=Text][id$=_IncurredDate]").input(Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE+Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + incurredDateVal + Key.ENTER + Key.TAB + Key.TAB)	
		* waitForEnabled("input[type=Text][id$=_IncurredDate]")		
		* waitForEnabled("input[id$=_customSaveButton][value=OK]").click().delay(1000)	
		* def duration = JavaApp.logEvent("updateIncurredDate", startTime, karate)

	@addPICInjuryTypeSensitive
	Scenario: add Determine Entitlement Type single IA - sensitive
		* def startTime = JavaApp.currentTimeMillis()
		* waitForEnabled("{div}Application Details").click()
		
		* waitForEnabled("input[value='Change']").click().delay(2000)
		* select('select[id$=_Record28]','{}'+injuryTypeVal).delay(100)
		* waitForEnabled("input[type=Text][id$=_Record20]")	
		* waitForEnabled("input[type=Text][id$=_Record20]").input(Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + occurredDateVal)
		* waitForEnabled("input[type=Text][id$=_Record20]")		
		* waitForEnabled("textarea[id$=_Record21]").input('Evidence Approved by Karate\n\r')
		* waitForEnabled("input[id$=_editPageSave][value=OK]").click().delay(1000)	
		* def duration = JavaApp.logEvent("addPICInjuryTypeSensitive", startTime, karate)

	@addCombinedIA
	Scenario: add Determine Entitlement Type Combined IA
		* def startTime = JavaApp.currentTimeMillis()
		* waitForEnabled("{div}Application Details").click()
		
		* waitForEnabled("input[value='Change']").click().delay(2000)		
		* select('select[id$=_Record23]','{}'+lumpSumVal).delay(100)
		* waitForEnabled("input[type=Text][id$=_Record25]")	
		* waitForEnabled("input[type=Text][id$=_Record25]").input(Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE +Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + lumpsumWpiVal)
		* waitForEnabled("input[type=Text][id$=_Record24]").click()
		* waitForEnabled("input[type=Text][id$=_Record24]").input(Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + paidDateVal)
		* waitForEnabled("input[type=Text][id$=_Record27]")
		* waitForEnabled("input[type=Text][id$=_Record27]").input(Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + applicationDateVal)
		* select('select[id$=_Record35]','{}'+flpPaidVal).delay(3000)	
		* waitForEnabled("input[id$=_editPageSave][value=OK]").focus().delay(600)
		* waitForEnabled("input[id$=_editPageSave][value=OK]").click().delay(1000)	
		* def duration = JavaApp.logEvent("addCombinedIA", startTime, karate)

	@approveWPI
	Scenario: update lumpsum WPI 
		* def startTime = JavaApp.currentTimeMillis()
		* waitForEnabled("{div}Impairment Assessments").click()
		* waitForEnabled("input[value=Edit]").click().delay(500)
		* waitForEnabled("input[value=Open]").click().delay(100)
		* waitForEnabled("input[type=Text][id$=_Score]").input(Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE+Key.BACK_SPACE + Key.BACK_SPACE+wpiScoreVal)
		* waitForEnabled("input[id$=_editPageSave][value=OK]").click().delay(200)		
		
		# click on datetime field to fire onblur and onfocus javascripts to fire
		* waitForEnabled("input[type=Text][id$=_Assessment_Date]").click()
		* waitForEnabled("input[type=Text][id$=_Assessment_Date]").input(Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + assessmentDateVal)
		
		* mouse().move('input[type=Text][id$=_extWPIDecisionDate]').click()
		* waitForEnabled("input[type=Text][id$=_extWPIDecisionDate]").input(Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + decisionDateVal+Key.ENTER+Key.TAB)	
		
		# leave date time field and do nothing to allow on blur javascript do its magic
		* waitForEnabled("input[id$=_editPageSave][value=OK]").focus().delay(600)
		* select('select[id$=_Assessment_Status]','{}'+assessmentStatusVal)			
		* waitForEnabled("input[id$=_editPageSave][value=OK]").click().delay(2000)	
		* def duration = JavaApp.logEvent("approveWPI", startTime, karate)

	@picCalculateEntitlement
	Scenario: PIC calculate entitlement to create recurring period
		* def startTime = JavaApp.currentTimeMillis()
		* waitForEnabled("{div}Impairment Assessments").click()
		* waitForEnabled("input[id$=_CalculateBenefitButton]").click().delay(2000)	
		* def duration = JavaApp.logEvent("picCalculateEntitlement", startTime, karate)		
		
	@goToPICRecurringPaymentsTab
		Scenario: go to PIC recurring payments tab
		* def startTime = JavaApp.currentTimeMillis()
		* waitForEnabled("{div}Independence Allowance").click()
		* def duration = JavaApp.logEvent("goToPICRecurringPaymentsTab", startTime, karate)
