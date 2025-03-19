@UpdateAmendmentStatus
Feature:
    Background: 
        
    Scenario Outline: Update Amendment <refNumber> information      
	
		
		* def response = call read('classpath:app/api/reload/services-payments/posts/UpdateAmendmentStatusV1.feature') { status: '#(status)', refNumber: '#(refNumber)', submissionKey: '#(submissionKey)'}			
				
       
        Examples:
	    | read('UpdateAmendmentStatus.csv') 
        