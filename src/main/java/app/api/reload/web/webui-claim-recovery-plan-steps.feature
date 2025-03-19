Feature: UI steps
Background: 
	* def JavaApp = Java.type('app.App')	
	@addPlanPhase
	Scenario: add plan phase to Recovery Plan sub case
	* def startTime = JavaApp.currentTimeMillis()
	* waitForEnabled("{div}Progress").click()											 
	* waitForEnabled("input[value='Add Goal'][id$=_addGoal]").click()
	* waitForEnabled("input[value='OK'][type=Submit]").click()
	* def duration = JavaApp.logEvent("addPlanPhase", startTime, karate)