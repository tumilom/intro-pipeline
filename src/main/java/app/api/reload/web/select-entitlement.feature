Feature: simple UI step sequences
	@ignore
	@selectEntitlement
	#Precondition: Purchase Order page with 'Select Ent' button
	# parameters: entCode
	Scenario: Select Entitlement
	* waitForEnabled("input[value='Select Ent']").click()
	* waitForEnabled("{td}"+entCode).click().delay(200)
	* waitForEnabled("input[value=Save]").click()