@updateFacility
Feature:
    
    Scenario Outline: Update <facilityId> info
        
		* def response = call read('classpath:app/api/reload/services-cc/posts/UpdateOrCreateFacility.feature'){facilityId:'#(facilityId)',facilityName:'#(facilityName)', extStatus:'#(extStatus)',extStatusReason:'#(extStatusReason)'}				
        Examples:
        | read('update-facility-data.csv') | 
        
