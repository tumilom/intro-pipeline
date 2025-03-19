Feature: UI steps
	Background: 
	* def JavaApp = Java.type('app.App')
	@addFatalRelationships
	Scenario: add dependent relationships for fatal case
	* def startTime = JavaApp.currentTimeMillis()
	* waitForEnabled("input[value='Add Dep'][id^=ACCDependentRelationshipsTreeviewWidget_][id$=_AddDependant]").click().delay(2000)
	* waitForEnabled("input[value='Find Party']").click().delay(2000)
	
	* waitForEnabled("input[type=Text][id$=_firstnames]").input(Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE+Key.BACK_SPACE + Key.BACK_SPACE+firstNamesVal)		
	* waitForEnabled("input[type=Text][id$=_lastName]").input(Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE+Key.BACK_SPACE + Key.BACK_SPACE+lastNameVal + Key.ENTER)	
	* waitForEnabled("input[value=OK]").click().delay(1000)
	
	* select('select[id$=_QualifyingStatus]','{}'+qualifyVal).delay(1000)
	* waitForEnabled("input[value=OK]").click().delay(1000)
	* def duration = JavaApp.logEvent("addFatalRelationships", startTime, karate)
