Feature: UI steps
	Background: 
	* def JavaApp = Java.type('app.App')
	@approveClaimSteps
 	Scenario: Approve Claim Steps
	* def startTime = JavaApp.currentTimeMillis()
	* waitForEnabled("input[value=Close]")
	* waitForEnabled("input[type=submit][id$=EDIT_LINKEDIT_BUTTONCover_Details]").click()
	* select('select[id$=_CoverStatus]','{}Accept').delay(100)
	* waitUntil("document.readyState == 'complete'")
	* select('select[id$=_CoverStatusReason]','{}Criteria for Cover are Met').delay(100)
	* waitForEnabled("textarea[id$=_RegistrationComment]").input('Approved by Karate\n\r')
	* waitForEnabled("input[value=OK]").click()
	* def duration = JavaApp.logEvent("approveClaimSteps", startTime, karate)
	
	@approveMedicalIncapacity
	Scenario: Approve Medical Incapacity Steps
	* def startTime = JavaApp.currentTimeMillis()
	* waitForEnabled("{a}Injury").click()
	* waitForEnabled("{div}Incapacity").click()
	* waitForEnabled("input[value=Approve]").click()
	* waitForEnabled("input[value=OK]").click()
	* def duration = JavaApp.logEvent("approveMedicalIncapacity", startTime, karate)
	#Then waitForText("#PageMessage1",'Weekly Compensation could not be found. Please set up Weekly Compensation.')
	
	@addCollectionPoint
	Scenario: Add Collection Point
	* def startTime = JavaApp.currentTimeMillis()
	* waitForEnabled("{a}Earnings & Exclusion Periods").click()
	* waitForEnabled("{div}Collection Periods").click()
	* waitForEnabled("input[type=Text][id$=_EffectiveDate]")
	* mouse().move('input[type=Text][id$=_EffectiveDate]').click()
	* waitForEnabled("input[type=Text][id$=_EffectiveDate]").input(Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + effectiveDateVal)
	* waitForEnabled("input[type=Text][id$=_EffectiveDate]")
	* waitForEnabled("input[value=Add]")
	* mouse().move('input[value=Add]').click()
	* def duration = JavaApp.logEvent("addCollectionPoint", startTime, karate)

	@setupEarnings
	Scenario: Setup Earnings
	* def startTime = JavaApp.currentTimeMillis()
	* waitForEnabled("{div}Collection Point Data").click()
	* waitForEnabled("input[value=Edit]").click()
	* waitForEnabled("input[value=Add]").click()
	* waitForEnabled("input[type=image][title='Select Party']").click()
	* waitForEnabled("input[type=Text][id$=_Customer_Number]").input(employerNumber)
	* waitForEnabled("input[value=Search]").click().delay(100)
	* waitUntil("document.readyState == 'complete'")
	* select('select[id$=_OccCat]','{}'+employmentType).delay(100)	
	* select('select[id$=_JobCat]','{}'+employmentStatus).delay(100)	
	* mouse().move("input[type=Text][id$=_hrsWrkedPerWk]").click()
	* waitForEnabled("input[type=Text][id$=_hrsWrkedPerWk]").input(Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE +'40.00')
	* waitForEnabled("input[value=Add]").click().delay(100)
	* waitForEnabled("{td}"+earnings01Type).click().delay(100)
	* waitForEnabled("input[value=OK][title=OK][type=Submit]").click().delay(100)
	* waitForEnabled("input[type=Text][id$=_Actual_gross_salary]").input(Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE +earnings01Amount)
	* waitForEnabled("input[type=Submit][title='Save this earnings record']").click().delay(100)
	* waitUntil("document.readyState == 'complete'")
	* waitForEnabled("input[value=Add]").click()
	* waitForEnabled("{td}"+earnings02Type).click().delay(100)
	* waitForEnabled("input[value=OK][title=OK][type=Submit]").click().delay(100)
	* waitForEnabled("input[type=Text][id$=_Actual_gross_salary]").input(Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE +earnings02Amount)
	* waitForEnabled("input[value=OK][title='Save this earnings record'][type=Submit]").click().delay(200)
	* waitForEnabled("input[value=OK]").click().delay(100)
	* waitForEnabled("input[value=OK]").click().delay(100)
	* waitForEnabled("input[value=Calculate][title='Calculates the selected Collection Point']").click().delay(100)
	* def duration = JavaApp.logEvent("setupEarnings", startTime, karate)
	
	
	@setupERAEarnings
	Scenario: Setup Earnings
	* def startTime = JavaApp.currentTimeMillis()	
	* waitForEnabled("{div}Collection Point Data").click()
	* waitForEnabled("input[value=Edit]").click()
	* waitForEnabled("input[value=Add]").click()
	* waitForEnabled("input[type=image][title='Select Party']").click()
	* waitForEnabled("input[type=Text][id$=_Customer_Number]").input(employerNumber)
	* waitForEnabled("input[value=Search]").click().delay(100)
	* waitUntil("document.readyState == 'complete'")
	* select('select[id$=_OccCat]','{}'+employmentType).delay(100)
	* select('select[id$=_extERAPymntOpt]','{}'+eraPaymentOption).delay(100)	
	* waitForEnabled("input[type=Text][id$=_extEmpPayFromDate]")
	* mouse().move('input[type=Text][id$=_extEmpPayFromDate]').click()
	* waitForEnabled("input[type=Text][id$=_extEmpPayFromDate]").input(Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + effectiveDateVal)
	* waitForEnabled("input[type=Text][id$=_extEmpPayFromDate]")
	* mouse().move("input[type=Text][id$=_hrsWrkedPerWk]").click()
	* waitForEnabled("input[type=Text][id$=_hrsWrkedPerWk]").input(Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE +'40.00')
	* waitForEnabled("input[value=Add]").click().delay(100)
	* waitForEnabled("{td}"+earnings01Type).click().delay(100)
	* waitForEnabled("input[value=OK][title=OK][type=Submit]").click().delay(100)
	* waitForEnabled("input[type=Text][id$=_Actual_gross_salary]").input(Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE +earnings01Amount)
	* waitForEnabled("input[type=Submit][title='Save this earnings record']").click().delay(100)
	* waitUntil("document.readyState == 'complete'")
	* waitForEnabled("input[value=Add]").click()
	* waitForEnabled("{td}"+earnings02Type).click().delay(100)
	* waitForEnabled("input[value=OK][title=OK][type=Submit]").click().delay(100)
	* waitForEnabled("input[type=Text][id$=_Actual_gross_salary]").input(Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE +earnings02Amount)
	* waitForEnabled("input[value=OK][title='Save this earnings record'][type=Submit]").click().delay(200)
	* waitForEnabled("input[value=OK]").click().delay(100)
	* waitForEnabled("input[value=OK]").click().delay(100)
	* waitForEnabled("input[value=Calculate][title='Calculates the selected Collection Point']").click().delay(100)
	* def duration = JavaApp.logEvent("setupERAEarnings", startTime, karate)

	@setupEarningsSingleEarningsType
	Scenario: Setup Earnings with one earnings type, ie Self Employed, Shareholder Non PAYE
	* def startTime = JavaApp.currentTimeMillis()
	* waitForEnabled("{a}Earnings & Exclusion Periods").click()
	* waitForEnabled("{div}Collection Point Data").click()
	* waitForEnabled("input[value=Edit]").click()
	* waitForEnabled("input[value=Add]").click()
	* waitForEnabled("input[type=image][title='Select Party']").click()
	* waitForEnabled("input[type=Text][id$=_Customer_Number]").input(employerNumber)
	* waitForEnabled("input[value=Search]").click().delay(100)
	* waitUntil("document.readyState == 'complete'")
	* select('select[id$=_OccCat]','{}'+employmentType).delay(100)
	* mouse().move("input[type=Text][id$=_hrsWrkedPerWk]").click()
	* waitForEnabled("input[type=Text][id$=_hrsWrkedPerWk]").input(Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE +'40.00')
	* waitForEnabled("input[value=Add]").click().delay(100)
	* waitForEnabled("{td}"+earnings01Type).click().delay(100)
	* waitForEnabled("input[value=OK][title=OK][type=Submit]").click().delay(100)
	* waitForEnabled("input[type=Text][id$=_Actual_gross_salary]").input(Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE +earnings01Amount)
	* select('select[id$=_earningsSalaryBasisEnumDropDownBean]','{}'+earningsSource).delay(100)
	* waitForEnabled("input[type=Submit][title='Save this earnings record']").click().delay(100)
	* waitUntil("document.readyState == 'complete'")
	* waitForEnabled("input[value=Add]").click()
	* waitForEnabled("input[value=OK]").click().delay(100)
	* waitForEnabled("input[value=OK]").click().delay(100)
	* waitForEnabled("input[value=Calculate][title='Calculates the selected Collection Point']").click().delay(100)
	* def duration = JavaApp.logEvent("setupEarningsSingleEarningsType", startTime, karate)

	@addSubcase
	Scenario: Add Subcase
	* def startTime = JavaApp.currentTimeMillis()		
	* mouse().move("a[id$=AddSubCaselink]").click()
	* waitForEnabled("{span}"+subcaseType).click().delay(100)
	* waitForEnabled("{a}"+subcaseType).click().delay(100)
	* def duration = JavaApp.logEvent("addSubcase", startTime, karate)

	@searchForCase
	Scenario: Search for case
	* def startTime = JavaApp.currentTimeMillis()
	* waitForEnabled("a[aria-label='Claims']").click().delay(200)
	* waitForEnabled("input[id$=_caseNumber]").input(caseNo)
	* waitForEnabled("input[value=Search]").focus()
	* delay(50)
	* waitForEnabled("input[value=Search]").click()
	* def duration = JavaApp.logEvent("searchForCase", startTime, karate)
	
	@loginAsOrdinaryUser
	Scenario: Login as ordinary user
	* def startTime = JavaApp.currentTimeMillis()
	* waitForEnabled("input[id=signInFormUsername]")
	#* waitForEnabled("input[id=signInFormUsername]").input(ORDINARY_USER.userid)
	* locateAll('input[id=signInFormUsername]')[1].input(ORDINARY_USER.userid)
	#* waitForEnabled("input[id=signInFormPassword]").input(ORDINARY_USER.userpass)
	* locateAll('input[id=signInFormPassword]')[1].input(ORDINARY_USER.userpass)
	* print "Login as " + ORDINARY_USER.userid
	* def elements = locateAll('input[id=signInFormUsername]')
	* print 'karate.sizeOf(elements): ' + karate.sizeOf(elements)
	
	* waitForEnabled("input[name=signInSubmitButton]").click()
	* def duration = JavaApp.logEvent("login", startTime, karate)

	@loginAsPaymentOfficerUser
	Scenario: Login as payment officer
	* def startTime = JavaApp.currentTimeMillis()
	* waitForEnabled("input[id=signInFormUsername]")
	#* waitForEnabled("input[id=signInFormUsername]").input(PAYMENTOFFICER_USER.userid)
	* locateAll('input[id=signInFormUsername]')[1].input(PAYMENTOFFICER_USER.userid)
	#* waitForEnabled("input[id=signInFormPassword]").input(PAYMENTOFFICER_USER.userpass)
	* locateAll('input[id=signInFormPassword]')[1].input(PAYMENTOFFICER_USER.userpass)
	* print "Login as " + PAYMENTOFFICER_USER.userid
	* waitForEnabled("input[name=signInSubmitButton]").click()
	* def duration = JavaApp.logEvent("login", startTime, karate)
	
	@logout
	Scenario: Logout from FrontOffice
	* def startTime = JavaApp.currentTimeMillis()
	* scroll("a[aria-label='Logout']")
	* waitForEnabled("a[aria-label='Logout']")
	* mouse().move("a[aria-label='Logout']").click()
	* waitForEnabled("input[id$=_Logout_yes]").click()
	* def duration = JavaApp.logEvent("logout", startTime, karate)
	
	@createBenefitPeriod
	Scenario: Create Benefit Period
	* def startTime = JavaApp.currentTimeMillis()
	* waitForEnabled("{div}Periods").click()
	* waitForEnabled("input[title='Maintain Multiple Periods'][type=Submit]").click()
	* waitForEnabled("input[value=Edit]")
	#Once on edit page sort by period 
	* waitForEnabled("{a}Period From").click().delay(100)
	* waitForEnabled("input[value=Edit]").click()
	* select('select[id$=_statusEnumBean]','{}Approved')
	* waitForEnabled("input[title='Calculate Days In Period'][value=Calculate]").click()
	* waitForEnabled("input[value=OK][type=Submit]").click()
	* delay(100)
	* waitForEnabled("input[value=Save][type=Submit]").click()
	* delay(100)	
	* def duration = JavaApp.logEvent("createBenefitPeriod", startTime, karate)
	
	@reviewAll
	Scenario: Review all payments
	* def startTime = JavaApp.currentTimeMillis()	
	* waitForEnabled("{div}Calculated Entitlements").click()
	* delay(100)
	* waitForEnabled("input[value='Review All'][type=Submit]").click()
	* delay(100)
	* waitForEnabled("input[id$=_extPaymentsReviewed_CHECKBOX]").click().delay(500)
	* waitForEnabled("input[value=Save][type=Submit]").click()
	* delay(100)
	* waitForEnabled("input[type=image][id$=_OffsetsAndDeductions_Refresh]").click().delay(100)
	* waitForEnabled("input[value='Review All'][type=Submit]")
	* delay(100)
	* def duration = JavaApp.logEvent("reviewAll", startTime, karate)
	
	@approvePayment
	Scenario: Approve WCE Period
	* def startTime = JavaApp.currentTimeMillis()
	* waitForEnabled("{div}Calculated Entitlements").click()
	* waitForEnabled("input[type=image][id$=_OffsetsAndDeductions_Refresh]").click().delay(100)
	* waitForEnabled("input[value='Review All']").click()
	* waitForEnabled("input[value=Approve][type=Submit]").click()
	* delay(100)	
	* def duration = JavaApp.logEvent("approvePayment", startTime, karate)
	
	@fastTrackPayment
	Scenario: fast track payments
	* def startTime = JavaApp.currentTimeMillis()
	* waitForEnabled("{}Payment History").click()
	* waitForEnabled("input[value='Fast Track Payment'][type=Submit]").click()
	* delay(100)
	* def duration = JavaApp.logEvent("fastTrackPayment", startTime, karate)
	
	@addERAAdjustment
	Scenario: add Employer Reimbursement adjustment
	* def startTime = JavaApp.currentTimeMillis()
	* waitForEnabled("{div}Adjustments").click()											 
	* waitForEnabled("input[value='Add'][id^=BalancedPayeeOffsetsAndDeductionsListView_][id$=_AddButton]").click()
	* waitForEnabled("{td}"+adjType).click()
	* waitForEnabled("{span}"+adjType).click()
	* waitForEnabled("input[value='Add'][id^=QuickAddOffsetsAndDeductionsDetailsWrapperWidget_][id$=_QuickAddButton]").click()
	* waitForEnabled("td[title='"+adjType+"'][id^=OffsetsAndDeductionsListviewWidget]").click()
	* waitForEnabled("input[value='OK'][type=Submit]").click()
	* def duration = JavaApp.logEvent("addERAAdjustment", startTime, karate)
	
	@addAdjustmentWithAmountAndReference
	Scenario: add Adjustment/Deduction with amount, reference and start date
	* def startTime = JavaApp.currentTimeMillis()
	* waitForEnabled("{div}Adjustments").click()											 
	* waitForEnabled("input[value='Add'][id^=BalancedPayeeOffsetsAndDeductionsListView_][id$=_AddButton]").click()
	* waitForEnabled("{td}"+adjType).click()
	* waitForEnabled("{span}"+adjType).click()
	
	* mouse().move('input[type=Text][id$=_Start_Date]').click()
	* waitForEnabled("input[type=Text][id$=_Start_Date]").input(Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + startDateVal)
	* mouse().move('input[type=Text][id$=_End_Date]').click()
	* waitForEnabled("input[type=Text][id$=_adjustmentAmountMoney]").input(Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + amountVal)
	* waitForEnabled("input[type=Text][id$=_Reference]").input(referenceVal)
	* waitForEnabled("input[value='Add'][id^=QuickAddOffsetsAndDeductionsDetailsWrapperWidget_][id$=_QuickAddButton]").click()
	* waitForEnabled("td[title='"+adjType+"'][class='ListCell wrap']")
	* waitForEnabled("input[value='OK'][type=Submit]").click()
	* def duration = JavaApp.logEvent("addAdjustmentWithAmountAndReference", startTime, karate)

	@addCSSBebefitAmountAdjustment
	Scenario: add CSS Benefit Amount adjustment
	* def startTime = JavaApp.currentTimeMillis()
	* waitForEnabled("{div}Recurring Entitlements").click()
	* delay(1000)
	* waitForEnabled("{div}Adjustments").click()
	* delay(1000)											 
	* waitForEnabled("input[value='Add'][id^=BenefitAmountOffsetsAndDeductionsListView_][id$=_AddButton]").click()
	* waitForEnabled("{td}"+adjType).click()
	* waitForEnabled("{span}"+adjType).click().delay(100)
	
	* waitForEnabled("{td}"+entitlementName).click()		
	* waitForEnabled("input[type=Text][id$=_Start_Date]")
	* mouse().move('input[type=Text][id$=_Start_Date]').click()
	* waitForEnabled("input[type=Text][id$=_Start_Date]").input(Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + startDateVal)
	* waitForEnabled("input[type=Text][id$=_Start_Date]")	
	* waitForEnabled("input[type=Text][id$=_unitsBean]")
	* mouse().move('input[type=Text][id$=_unitsBean]').click()
	* waitForEnabled("input[type=Text][id$=_unitsBean]").input(Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + unitVal)
	* waitForEnabled("input[type=Text][id$=_unitsBean]")	
	* waitForEnabled("input[type=Text][id$=_rateBean]")
	* mouse().move('input[type=Text][id$=_rateBean]').click()
	* waitForEnabled("input[type=Text][id$=_rateBean]").input(Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + rateVal)
	* waitForEnabled("input[type=Text][id$=_rateBean]")	
	* waitForEnabled("input[value='Add'][id^=ACCQuickAddOffsetsAndDeductionsDetailsWrapperWidget_][id$=_QuickAddButton]").click()
	* waitForEnabled("input[value='OK'][type=Submit]").click()	
	* def duration = JavaApp.logEvent("addCSSBebefitAmountAdjustment", startTime, karate)

	@addTaxCodeAtBenefitLevel
	Scenario: add Tax Code at Benefit Level
	* def startTime = JavaApp.currentTimeMillis()
	* waitForEnabled("{}Entitlement").click()	
	* waitForEnabled("input[type=Submit][id^=PartyCaseRolesListView_][id$=_editRolesButtonBean]").click()
	* waitForEnabled("{td}"+roleName).click()
	* waitForEnabled("input[type=Submit][id^=pcrList_][id$=_cmdEdit]").click()
	* waitForEnabled("input[type=Submit][id^=DataSetWidget1_][id$=_cmdAdd]").click()	
	* select('select[id$=_TaxTypeEnum]','{}'+taxCode)
    * delay(100)
    * mouse().move('input[type=Text][id^=TaxDetailsWidget_][id$=_PercentageRate]').click()
	* waitForEnabled("input[type=Text][id^=TaxDetailsWidget_][id$=_PercentageRate]").input(Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + Key.BACK_SPACE + taxRate)	
	* select('select[id$=_extWithholdingTaxStatus]','{}'+withHoldingStatus)
	* delay(100)
	* waitForEnabled("input[value='OK'][type=Submit]").click()
	* waitForEnabled("input[value='OK'][type=Submit]").click()
	* waitForEnabled("input[value='OK'][type=Submit]").click()
	* def duration = JavaApp.logEvent("addTaxCodeAtBenefitLevel", startTime, karate)

	@bypassCrtValidations
	Scenario: bypass CRT validations
	* def startTime = JavaApp.currentTimeMillis()
	* waitForEnabled("{div}Services").click()
	* delay(1000)
	* waitForEnabled("{div}Reimbursements").click()
	* delay(1000)
	* waitForEnabled("a[id$=_ValidationStatus]").click()
	* waitForEnabled("input[type=Checkbox][id^=ValidationResultDisplayWidget_0_][id$=_BypassThisChkBox_CHECKBOX]").click()
	* waitForEnabled("input[type=Checkbox][id^=ValidationResultDisplayWidget_1_][id$=_BypassThisChkBox_CHECKBOX]").click()
	* waitForEnabled("input[value='OK'][type=Submit]").click()	
	* waitForEnabled("a[id$=_ValidationStatus][style=' color: red; ;']").click()
	* waitForEnabled("input[type=Checkbox][id^=ValidationResultDisplayWidget_0_][id$=_BypassThisChkBox_CHECKBOX]").click()
	* waitForEnabled("input[type=Checkbox][id^=ValidationResultDisplayWidget_1_][id$=_BypassThisChkBox_CHECKBOX]").click()
	* waitForEnabled("input[type=Checkbox][id^=ValidationResultDisplayWidget_2_][id$=_BypassThisChkBox_CHECKBOX]").click()
	* waitForEnabled("input[value='OK'][type=Submit]").click()
	* waitForEnabled("a[id$=_ValidationStatus][style=' color: red; ;']").click()
	* waitForEnabled("input[type=Checkbox][id^=ValidationResultDisplayWidget_0_][id$=_BypassThisChkBox_CHECKBOX]").click()
	* waitForEnabled("input[type=Checkbox][id^=ValidationResultDisplayWidget_1_][id$=_BypassThisChkBox_CHECKBOX]").click()
	* waitForEnabled("input[type=Checkbox][id^=ValidationResultDisplayWidget_2_][id$=_BypassThisChkBox_CHECKBOX]").click()
	* waitForEnabled("input[value='OK'][type=Submit]").click()
	* waitForEnabled("input[type=Submit][id^=InvoiceListviewWidget_][id$=_ProgressInvoiceBean]").click()
	* def duration = JavaApp.logEvent("bypassCrtValidations", startTime, karate)
	
	
