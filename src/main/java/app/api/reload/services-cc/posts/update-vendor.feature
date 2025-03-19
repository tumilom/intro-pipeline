@updateVendor
Feature:
	
    Scenario Outline: Update <vendorId> info
        
		* def response = call read('classpath:app/api/reload/services-cc/posts/UpdateOrCreateVendor.feature'){vendorId:'#(vendorId)',vendorName:'#(vendorName)',extLocationInstanceName:'#(extLocationInstanceName)',extVendorAgencyType:'#(extVendorAgencyType)',extStatus:'#(extStatus)',extStatusReason:'#(extStatusReason)'}				
        Examples:
        | read('update-vendor-data.csv') | 
       

		


  