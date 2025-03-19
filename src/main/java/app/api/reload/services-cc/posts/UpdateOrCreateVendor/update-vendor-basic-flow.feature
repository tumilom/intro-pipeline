@ignore
@updateVendor-basic-flow
Feature:
	Background: 
        * def JavaApp = Java.type('app.App');
		* def dateNow = JavaApp.daysFromNow('0') 
    Scenario Outline: Update <vendorId> info
        
		* def response = call read('classpath:app/api/reload/services-cc/posts/UpdateOrCreateVendor/UpdateOrCreateVendor-basic-flow.feature'){vendorId:'#(vendorId)',vendorName:'#(vendorName)',extLocationInstanceName:'#(extLocationInstanceName)',extVendorAgencyType:'#(extVendorAgencyType)',extStatus:'#(extStatus)',extStatusReason:'#(extStatusReason)'}				
        Examples:
        | vendorId | vendorName 	   		| extLocationInstanceName | extVendorAgencyType |extStatus |extStatusReason  |
        | VAB908   | TRAuckland City Physio | Wellington City 		  | Community Pharmacy	|Held	   |Duplicate Vendor |

		


  