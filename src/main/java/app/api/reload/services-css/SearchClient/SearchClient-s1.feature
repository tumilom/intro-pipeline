#@ignore
@SearchClient-s1
Feature: Search Client used by MYACC self trigger invite
    Background: 
		# For get claims for party
		# For a unit testing uncomment lines below, update claimNumber value, remove @ignore		
		* def str_userid = 'SVC_APIM_EOS_CT_TST'
		* def str_firstName = 'Dental'
		* def str_DateOfBirth = '2000-12-31'
		* def str_NHINo = 'OPQ0987'
		* def str_emailAddress = ''
		* def str_areaCode = '04'
		* def str_teleponeNo = '022789456'
		
    Scenario: Happy Path
        Given url WSC_CSS_URL +'SearchClient'
        * configure headers  = WSC_HTTP_HEADERS
		And header userid = str_userid
		And param PARAM_STR_USERID = str_userid
		And param PARAM_STR_FIRSTNAME = str_firstName
		And param PARAM_STR_DATEOFBIRTH = str_DateOfBirth
		And param PARAM_STR_NHINO = str_NHINo		
		And param PARAM_STR_EMAILADDRESS = str_emailAddress
		And param PARAM_STR_AREACODE = str_areaCode
		And param PARAM_STR_TELEPHONENO = str_teleponeNo
		#And param PARAM_STR_CLAIMNO = str_claimNo
			
		When method get
		* print response
		* string responseStr = response
		* karate.write(responseStr, '../src/test/java/app/api/reload/services-css/SearchClient/SearchClient-s1-response 24.5.txt')
		Then status 200				
		
		