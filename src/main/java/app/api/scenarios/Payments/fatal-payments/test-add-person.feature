@fatal
Feature:
    Background: 
        
    Scenario: 
		
		* def JavaApp = Java.type('app.App');
		* def nowDate = JavaApp.daysFromNow('0')
		* def nowDateVal = JavaApp.daysInPast('0','dd/MM/yyyy')
		
		* def firstNames = 'Sarah' 
		* def lastName = 'Yang' 
		
	
		* driver url = FRONTOFFICE_URL +'/home.jsp'
	
		* def sfpRes = call read('classpath:app/api/scenarios/Payments/fatal-payments/add-fatal-parties.feature')
		
		#* def sfc1Res02 = call read('classpath:app/api/reload/web/webui-claim-steps.feature@addCSSBebefitAmountAdjustment'){ caseNo : '#(caseNo)', adjType : '#(adjType)',entitlementName : '#(entitlementName)',startDateVal : '#(startDateVal)',unitVal : '#(unitVal)',rateVal : '#(rateVal)'}
		#* def adjType = 'Child Support Instruction' 
		# * def sfc1Res03 = call read('classpath:app/api/reload/web/webui-claim-steps.feature@addAdjustmentWithAmountAndReference'){ caseNo : '#(caseNo)', adjType : '#(adjType)', amountVal :'17', referenceVal: '#(caseNo)', startDateVal: '#(nowDateVal)' }
		
		