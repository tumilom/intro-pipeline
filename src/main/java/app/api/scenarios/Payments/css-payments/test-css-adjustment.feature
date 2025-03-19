@css-adj
Feature:
    Background: 
        
    Scenario: 
		
		* def JavaApp = Java.type('app.App');
		* def nowDate = JavaApp.daysFromNow('0')
		* def nowDateVal = JavaApp.daysInPast('0','dd/MM/yyyy')
		
		* def caseNo = 'CSS10060066387' 
		#'WCE10060066894'
		
		* def adjType = 'Home Based Rehabilitation Non Taxable Instruction' 
		* def entitlementName = 'Grocery Delivery Costs for Online Grocery Orders'		
		* def startDateVal = JavaApp.daysInPast('0','dd/MM/yyyy')
		* def unitVal = '5'
		* def rateVal = '25'
		
	
		* driver url = FRONTOFFICE_URL +'/home.jsp'
	
		* def sfc1Res01 = call read('classpath:app/api/reload/web/webui-claim-steps.feature@searchForCase'){ caseNo : '#(caseNo)'}
		
		* def sfc1Res02 = call read('classpath:app/api/reload/web/webui-claim-steps.feature@addCSSBebefitAmountAdjustment'){ caseNo : '#(caseNo)', adjType : '#(adjType)',entitlementName : '#(entitlementName)',startDateVal : '#(startDateVal)',unitVal : '#(unitVal)',rateVal : '#(rateVal)'}
		#* def adjType = 'Child Support Instruction' 
		# * def sfc1Res03 = call read('classpath:app/api/reload/web/webui-claim-steps.feature@addAdjustmentWithAmountAndReference'){ caseNo : '#(caseNo)', adjType : '#(adjType)', amountVal :'17', referenceVal: '#(caseNo)', startDateVal: '#(nowDateVal)' }
		
		