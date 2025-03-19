function fn() {
	var docuserid = '?userid=SVC_APIM_EOS_DS_TST'
	var eosUrl = 'http://localhost'
	var webappUrl = 'http://localhost:8080/frontoffice'
    var config = { 
		WSC_PS_URL: 		eosUrl + ':18080/fineos-services/wscomposer/',
		WSC_JUNO_URL: 		eosUrl + ':9080/fineos-services/wscomposer/',
		WSC_PAYMENTS_URL:   eosUrl + ':13080/fineos-services/wscomposer/',
		WSC_CC_URL: 		eosUrl + ':15080/fineos-services/wscomposer/',
		WSC_CSS_URL:		eosUrl + ':10080/fineos-services/wscomposer/',
		WS_CSS_REST_URL: 	eosUrl + ':10080/fineos-services',
		WS_REST_URL: 		eosUrl + ':15080/fineos-services',
		FRONTOFFICE_URL: webappUrl,
		CUSTOMER_API_URL: 	eosUrl + ':14080/fineos-customer-api/api/v5.0/customer',
		GC_API_URL: 		eosUrl + ':17080/fineos-employer-api/api/v5.0/groupClient',
		CONTACT_CENTRE_API_URL : eosUrl + ':16080/fineos-contactcentre-api/api/v5.0/contact-centre',
		DOCUMENT_WSC_CC_URL: eosUrl + ':15080/fineos-services/wscomposer/webservice' + docuserid,
		ORDINARY_USER:{'userid':'oasis','userpass':'oasis1'},
        PAYMENTOFFICER_USER:{'userid':'divinaol@fineos.com','userpass':'ml!IOY239P^T'}
    };
	karate.set ("GET_HTTP_HEADER", {  })
    karate.set ("WSC_HTTP_HEADERS", { 'Content-Type': 'application/xml' ,'userid': 'KEYDATACHANGEWPUSER'})
    karate.set ("WS_HTTP_HEADERS_REST", { 'Content-Type': 'application/xml', 'userid': 'oasis'})
    karate.set ("JSONAPI_HTTP_HEADERS", { 'Content-Type': 'application/json', 'userid': 'oasis'})
    karate.set ("JSONAPI_HTTP_HEADERS_CC", { 'Content-Type': 'application/json', 'userid': 'SVC_APIM_EOS_PS_TST'})
	karate.set ("DOCUMENT_JSONAPI_HTTP_HEADERS", { 'Content-Type': 'application/json', 'userid': 'SVC_APIM_EOS_DS_TST'})
	karate.set ("DOCUMENT_WSC_HTTP_HEADERS", { 'Content-Type': 'application/xml', 'userid': 'SVC_APIM_EOS_DS_TST'})

    return config;
  }