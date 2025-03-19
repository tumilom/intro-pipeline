@era-adj
Feature:
    Background: 
        
    Scenario: 
		
		* def JavaApp = Java.type('app.App');
		* def nowDate = JavaApp.daysFromNow('0')
		* def nowDateVal = JavaApp.daysInPast('0','dd/MM/yyyy')
		
		* def wceCaseNo = 'WCE10060067408' 
		#'WCE10060066894'
		
		* def adjType = 'ERA Instruction' 
		
		* print wceCaseNo
	
		* driver url = FRONTOFFICE_URL +'/home.jsp'
	
		* def sfc1Res01 = call read('classpath:app/api/reload/web/webui-claim-steps.feature@searchForCase'){ caseNo : '#(wceCaseNo)'}
		
		* def sfc1Res02 = call read('classpath:app/api/reload/web/webui-claim-steps.feature@addERAAdjustment'){ caseNo : '#(wceCaseNo)', adjType : '#(adjType)'}
		* def adjType = 'Child Support Instruction' 
		* def sfc1Res03 = call read('classpath:app/api/reload/web/webui-claim-steps.feature@@addAdjustmentWithAmountAndReference'){ caseNo : '#(wceCaseNo)', adjType : '#(adjType)', amountVal :'17', referenceVal: '#(wceCaseNo)', startDateVal: '#(nowDateVal)' }
		
		