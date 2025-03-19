@salesforce-scenario4-tasks
Feature: task related endpoints
    Background: 
        # prerequistes: customer has a ACC45 claim 
				
		# ACCCU-782 	GET - Returns a list of tasks for the given case
		# ACCCU-783 	POST - Creates a task for the case
		# ACCCU-826     GET - WSC Get tasks for Case
		# ACCCU-1264	POST - TransferTask
		# ACCCU-1265	POST - UpdateTask

    Scenario:       	
		
		* def caseAlias = RUNID +'03'
		* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(caseAlias)' }		
		* def eosCustomerNo  =  overviewResult.eosCustomerNo
		* def eosCustomerNo  =  overviewResult.eosCustomerNo
		* def acc45CaseNo  =  overviewResult.eosCaseNo	
		#* def acc45CaseNo  =  '10060066370'
			
		#tasks: add and get
		* def pcprsp = call read('classpath:app/api/reload/api-cc/posts/add-activities.feature') { caseNo: '#(acc45CaseNo)'} 	
		* def rprsp = call read('classpath:app/api/reload/api-cc/tasks.feature') { claimNumber: '#(acc45CaseNo)'} 
		* def taskOid = pcprsp.actOid
		# GET https://dt1-api.acc.fineos.com/contactcentreapi/contact-centre/cases/10060066373/activities/11554-255060391?_filter=tasksOnly&status.name=Open
		* def getSingleRsp = call read('classpath:app/api/reload/api-cc/tasks-by-id.feature') { claimNumber: '#(acc45CaseNo)',taskOid:'#(taskOid)' } 
		
		# GetTasksForCase
		* def gettfcsp = call read('classpath:app/api/reload/services-cc/GetTasksForCase.feature') { STR_CASENUMBER: '#(acc45CaseNo)'} 		
		* def taskOidToTransferIValue =  pcprsp.actOid.substring(6, pcprsp.actOid.length)
		* def taskOidToTransfer = 'PE:11554:' +  taskOidToTransferIValue
		* print taskOidToTransfer
		
		* def ttRsp = call read('classpath:app/api/reload/services-cc/posts/TransferTask.feature') { taskOid: '#(taskOidToTransfer)'} 	
		* def utRsp = call read('classpath:app/api/reload/services-cc/posts/UpdateTask.feature') { taskOid: '#(taskOidToTransfer)'} 	

	