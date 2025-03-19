@salesforce-scenario3-Recovery-Plan
Feature: Recover Plan - Outcome Measure and Consent Details
    Background: 
        # prerequistes: a ACC45 claim
		
		# create a recovery plan sub case
		# retrieve recovery plan
		# client goals		
		# plan phases
		# outcome measures
		# Actions		
		
		# ACCCU-836 	POST - WSC Create claim subcase
		# ACCCU-786 	GET - CC - Returns a list of rehabilitation plans for the given claim

    Scenario: 
        #* def caseNo = '10060066809'	
		* def caseAlias = RUNID +'01'
		* def overviewResult = call read('classpath:app/api/reload/services-cc/readcaseoverview.feature') { medFeesNo: '#(caseAlias)' }
		* def eosCustomerNo  =  overviewResult.eosCustomerNo
		* def acc45CaseNo  =  overviewResult.eosCaseNo		
		
		* def pcscrsp = call read('classpath:app/api/reload/services-cc/posts/CreateClaimSubCase.feature') { parentCaseNumber: '#(acc45CaseNo)'} 		
		
		* def rprsp = call read('classpath:app/api/reload/api-cc/sub-cases-recoveryPlans.feature') { claimNumber: '#(acc45CaseNo)'} 					
		* def rpCaseNo = rprsp.rpCaseNo		
		
		#client goals : add, get and edit
		# ACCCU-802 	POST -CC - Edits a client goal linked to the rehabilitation plan
		# ACCCU-795     GET - Returns a list of client goals for the rehabilitation plan
		# ACCCU-796     POST - Creates a client goal for the rehabilitation plan
		
		
		* def pcgrsp = call read('classpath:app/api/reload/api-cc/posts/add-client-goals.feature') { claimNumber: '#(acc45CaseNo)',recoveryPlanId: '#(rpCaseNo)'} 	
		* def rcgrsp = call read('classpath:app/api/reload/api-cc/client-goals.feature') { claimNumber: '#(acc45CaseNo)',recoveryPlanId: '#(rpCaseNo)'} 	
		* def clientgoalId = rcgrsp.clientgoalId
		* def pecgrsp = call read('classpath:app/api/reload/api-cc/posts/edit-client-goals.feature') { claimNumber: '#(acc45CaseNo)',recoveryPlanId: '#(rpCaseNo)',clientGoalId: '#(clientgoalId)'} 	
		
		# add plan phase manually via Web, login user must have these SAs: ACC_ADDEDITREMOVE_RECOVERYGOAL, ACC_ADDEDITREMOVE_RECOVERYGOAL_ACTION, ACC_EDIT_RECOVERYSTATUS
		 Given driver FRONTOFFICE_URL +'/home.jsp'
		* def login01Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@loginAsOrdinaryUser')
		* waitUntil("document.readyState == 'complete'")
		* def sfc1Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@searchForCase'){ caseNo : '#(rpCaseNo)'}
		* waitForEnabled("input[value=Close]")
		
		* def acsRes = call read('classpath:app/api/reload/web/webui-claim-recovery-plan-steps.feature@addPlanPhase')
		* def logout01Res = call read('classpath:app/api/reload/web/webui-claim-steps.feature@logout')
		
		# plan phases life areas:  get, edit
		# ACCCU-804 	POST - Edits a life area for the plan phase
		# ACCCU-799		GET - Returns a list of life areas for the plan phase
		# ACCCU-794		GET - Returns a list of plan phases for the rehabilitation plan
		
		* def rpprsp = call read('classpath:app/api/reload/api-cc/plan-phases.feature') { claimNumber: '#(acc45CaseNo)',recoveryPlanId: '#(rpCaseNo)'} 	
		* def planPhaseId = rpprsp.planPhaseId		
						
		* def rlarsp = call read('classpath:app/api/reload/api-cc/plan-phases-lifeareas.feature') { claimNumber: '#(acc45CaseNo)',recoveryPlanId: '#(rpCaseNo)',planPhaseId: '#(planPhaseId)'} 	
		* def lifeAreaId = rlarsp.lifeAreaId
		* def pelarsp = call read('classpath:app/api/reload/api-cc/posts/edit-life-areas.feature') { claimNumber: '#(acc45CaseNo)',recoveryPlanId: '#(rpCaseNo)',planPhaseId: '#(planPhaseId)',lifeAreaId: '#(lifeAreaId)'} 	
		
		# outcome measures: add read and get single
		# ACCCU-798 	POST - Creates an eForm for the outcome measure
		# ACCCU-790 	GET - Returns a list of outcome measures for the rehabilitation plan
		# ACCCU-792 	GET - Returns an outcome measure for the rehabilitation plan
		
		* def pomrsp = call read('classpath:app/api/reload/api-cc/posts/add-outcome-measures.feature') { claimNumber: '#(acc45CaseNo)',recoveryPlanId: '#(rpCaseNo)'} 	
		* def romrsp = call read('classpath:app/api/reload/api-cc/outcome-measures.feature') { claimNumber: '#(acc45CaseNo)',recoveryPlanId: '#(rpCaseNo)'} 
		* def outcomeMeasureId = romrsp.outcomeMeasureId
		* def romsrsp = call read('classpath:app/api/reload/api-cc/outcome-measures-getsingle.feature') { claimNumber: '#(acc45CaseNo)',recoveryPlanId: '#(rpCaseNo)',outcomeMeasureId:'#(outcomeMeasureId)'}
		
		#plan phase goals: add and get
		# ACCCU-817 	POST - Creates a goal for the plan phase and links it to a client goal when provided
		# ACCCU-816 	GET - Returns a list of goals for a plan phase
		
		* def pomrsp = call read('classpath:app/api/reload/api-cc/posts/add-planphase-goals.feature') { claimNumber: '#(acc45CaseNo)',recoveryPlanId: '#(rpCaseNo)',planPhaseId: '#(planPhaseId)'} 	
		* def rppgrsp = call read('classpath:app/api/reload/api-cc/plan-phases-goals.feature') { claimNumber: '#(acc45CaseNo)',recoveryPlanId: '#(rpCaseNo)',planPhaseId: '#(planPhaseId)'} 	
		* def planPhaseGoalId = rppgrsp.planphaseGoalId
		
		#Actions: add, read and edit
		# ACCCU-803 	POST - Edits an action for the plan phase goal
		
		* def parsp = call read('classpath:app/api/reload/api-cc/posts/add-actions.feature') { claimNumber: '#(acc45CaseNo)',recoveryPlanId: '#(rpCaseNo)',planPhaseId: '#(planPhaseId)', goalId: '#(planPhaseGoalId)'} 		
		* def rpparsp = call read('classpath:app/api/reload/api-cc/plan-phases-actions.feature') { claimNumber: '#(acc45CaseNo)',recoveryPlanId: '#(rpCaseNo)',planPhaseId: '#(planPhaseId)', goalId: '#(planPhaseGoalId)'} 	
		* def actionId = rpparsp.actionId		
		* def peppgarsp = call read('classpath:app/api/reload/api-cc/posts/edit-planphase-goals-actions.feature') { claimNumber: '#(acc45CaseNo)',recoveryPlanId: '#(rpCaseNo)',planPhaseId: '#(planPhaseId)', goalId: '#(planPhaseGoalId)', actionId: '#(actionId)'} 			