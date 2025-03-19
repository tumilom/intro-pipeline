Feature: UI steps
	Background: 
	* def JavaApp = Java.type('app.App')
	@searchForPerson
	Scenario: Search for nonexistent person
	* def startTime = JavaApp.currentTimeMillis()	
	* waitForEnabled("a[aria-label='Open Party']").click().delay(100)
	* waitForEnabled("input[type=Text][id$=_firstnames]").input(firstNames)		
	* waitForEnabled("input[type=Text][id$=_lastName]").input(lastName)	
	* waitForEnabled("input[value=Search]").click()
	# Add button will get enabled ONLY when nothing found
	* waitForEnabled("input[value=Add]")
	* def duration = JavaApp.logEvent("searchForPerson", startTime, karate)
	
	@addNewPerson
	Scenario: Add a new person record
	* def startTime = JavaApp.currentTimeMillis()	
	* waitForEnabled("input[value=Add]").click()
	* waitForEnabled("input[type=Text][id$=_Date_of_Birth]")	
	* waitForEnabled("input[type=Text][id$=_Date_of_Birth]").input(Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + dateOfBirthVal)
	* waitForEnabled("input[type=Text][id$=_Date_of_Birth]")	
	* select('select[id$=_genderEnum]','{}'+genderVal).delay(1000)	
	* waitForEnabled("input[type=Text][id$=_IRDNumber_IRDNumber_0]").input(irdNumberVal0)
	* waitForEnabled("input[type=Text][id$=_IRDNumber_IRDNumber_1]").input(irdNumberVal1)
	* waitForEnabled("input[type=Text][id$=_IRDNumber_IRDNumber_2]").input(irdNumberVal2)	
	* select('select[id$=_Ethnicity1]','{}'+ethnicityVal).delay(1000)
	
	* waitForEnabled("input[value=New]").click().delay(1000)
	* waitForEnabled("input[value=OK][type=Submit][id$=_AddUsageDropDown_yes]").click().delay(1000)	
	* waitForEnabled("input[id$=_manualAddress_CHECKBOX]").click().delay(500)
	* waitForEnabled("input[type=Text][id$=_AddressLine1]").input(addressLine1Val)		
	* waitForEnabled("input[type=Text][id$=_Suburb]").input(suburbVal)		
	* waitForEnabled("input[type=Text][id$=_TownOrCity]").input(cityVal)
	* waitForEnabled("input[type=Text][id$=_ZipCode]").input(postCodeVal)
	* waitForEnabled("input[value=OK]").click().delay(100)
	* waitForEnabled("input[value=OK]")
	* print driver.title
	Then match driver.title contains 'Add Person'
	* waitForEnabled("input[value=OK]").click().delay(100)
	* waitForEnabled("input[value=OK]")
	Then match driver.title contains 'Person Search'
	* waitForEnabled("input[value=OK]").click().delay(100)
	* waitForEnabled("input[value=OK]")
	Then match driver.title contains 'Add Fatal Dependant Details'
	* select('select[id$=_QualifyingStatus]','{}Qualifies').delay(100)	
	* waitForEnabled("input[value=OK]").click().delay(100)
	* delay(1000)
	* def duration = JavaApp.logEvent("addNewPerson", startTime, karate)

	@searchPersonByCustomerNo
	Scenario: search person by customer number
	* def startTime = JavaApp.currentTimeMillis()
	* waitForEnabled("a[aria-label='Open Party']").click().delay(100)
	* waitForEnabled("[id$=_reference_cell]").click().delay(100)	
	* waitForEnabled("input[type=Text][id$=_ReferenceNumber]").input(customerNoVal + Key.ENTER).delay(2000)
	* def duration = JavaApp.logEvent("searchPersonByCustomerNo", startTime, karate)

	@updateDeceasedPerson
	Scenario: update person deceased status	
	* def startTime = JavaApp.currentTimeMillis()
	#* mouse().move("a[id$=EditPartylink]").click()		
	* waitForEnabled("span[id^=additionalPersonInformationCardWidget_][id$=_editIcon]").click().delay(2000)	
	* waitForEnabled("input[id$=_deceased_CHECKBOX]").click().delay(500)		
	* waitForEnabled("input[type=Text][id$=_dateOfDeath]")	
	* mouse().move('input[type=Text][id$=_dateOfDeath]').click()
	* waitForEnabled("input[type=Text][id$=_dateOfDeath]").input(Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + dateOfDeathVal+Key.ENTER+Key.TAB)	
	* waitForEnabled("input[type=Text][id$=_dateOfDeath]")	
	* waitForEnabled("input[id$=_notificationsIssued_CHECKBOX]").click().delay(1000)		
	* waitForEnabled("input[id$=_okButtonBean][value=OK]").click().delay(1000)	
	* def duration = JavaApp.logEvent("updateDeceasedPerson", startTime, karate)

	@logout
	Scenario: Logout from FrontOffice
	* def startTime = JavaApp.currentTimeMillis()
	* waitForEnabled("a[aria-label='Logout']")
	* mouse().move("a[aria-label='Logout']").click()
	* waitForEnabled("input[id$=_Logout_yes]").click()
	* def duration = JavaApp.logEvent("logout", startTime, karate)
	
	@addBankAccount
	Scenario: Logout from FrontOffice		
	* def startTime = JavaApp.currentTimeMillis()
	* waitForEnabled("input[value=Add]").click()
	* waitForEnabled("input[id$=_descriptionTextBox]").input('PP')
	* waitForEnabled("input[id$=_Bank_rcbSearchButton_Bank]").click()
	* waitForEnabled("input[value=Add]")
	Then match driver.title contains 'Account Search'
	* waitForEnabled("input[value=Add]").click()
	* waitForEnabled("input[id$=_bankCodeMaskBean_bankCodeMaskBean_0]").input(bankCode)
	* delay(100)	
	* waitForEnabled("input[id$=_RoutingNumberMaskBean_RoutingNumberMaskBean_0]").input(bankBranch)
	* delay(100)	
	* waitForEnabled("input[id$=_AccountNumberMaskBean_AccountNumberMaskBean_0]").input(accountNo)
	* delay(100)	
	* waitForEnabled("input[id$=_AccountNumberMaskBean_AccountNumberMaskBean_1]").input(suffix)
	* delay(100)	
	* waitForEnabled("input[value=OK]").click()
	* waitForEnabled("input[value=Add]")
	Then match driver.title contains 'Account Search'
	* waitForEnabled("{td}"+accountNo+'-'+suffix).click()	
	* waitForEnabled("input[value=OK]").click()
	* waitForEnabled("input[id$=_descriptionTextBox]")
	Then match driver.title contains 'New Payment Preference'
	* waitForEnabled("input[value=OK]").click()
	Then waitForText("#PageMessage1",'The selected Payment Preference has been set as the Default Payment Preference')
	Then match driver.title contains 'Party Details'
	* waitForEnabled("input[value='Make Default']").click()
	Then waitForText("#PageMessage1",'The selected Payment Preference is already the Default Payment Preference.')
	* def duration = JavaApp.logEvent("addBankAccount", startTime, karate)