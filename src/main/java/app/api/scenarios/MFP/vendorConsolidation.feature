@vendorConsolidation
Feature: Setup Vendors for party merge
    Background: create 2 searchable vendors and update 1 vendor as duplicate
        * def JavaApp = Java.type('app.App');
		* def dateNow = JavaApp.daysFromNow('0') 
    Scenario Outline: Update <vendorId> info
        
		* def response = call read('classpath:app/api/reload/services-cc/posts/UpdateOrCreateVendor.feature'){vendorId:'#(vendorId)',vendorName:'#(vendorName)',extLocationInstanceName:'#(extLocationInstanceName)',extVendorAgencyType:'#(extVendorAgencyType)',extStatus:'#(extStatus)',extStatusReason:'#(extStatusReason)'}				
      
	  Examples:
        | vendorId | vendorName				 | extLocationInstanceName | extVendorAgencyType  		|extStatus	|extStatusReason |
        | OD1015   | Jessica Rose Long OD1015| Auckland City 			| Individual Registration 	|Active	|Unknown		|
		| OD1014   | Jessica Rose Long OD1014| Auckland City			| Individual Registration 	|Active	|Unknown		|
		| OD1015   | Jessica Rose Long OD1015| Auckland City 			| Individual Registration 	|Removed	|Duplicate Vendor		|
