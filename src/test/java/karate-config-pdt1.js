function fn() {
	var docuserid = '?userid=SVC_APIM_EOS_DS_TST'
    var eosUrl = 'https://pdt1-api.acc.fineos.com'
	var webappUrl = 'https://pdt1-webapp.acc.fineos.com'
    var proxyHost = karate.properties['http.proxyHost'] || '';
    var proxyPort = karate.properties['http.proxyPort'] || '';
	var proxyUrl = 'http://'+proxyHost+':'+proxyPort;
    var config = { 
		eosApisUrl:			eosUrl,
		WSC_PS_URL: 		eosUrl + '/fineos-services-ps/wscomposer/',
		WSC_JUNO_URL: 		eosUrl + '/fineos-services-juno/wscomposer/',
		WSC_PAYMENTS_URL:   eosUrl + '/fineos-services-payments/wscomposer/',
		WSC_CC_URL: 		eosUrl + '/fineos-services-cc/wscomposer/',
		WSC_CSS_URL: 		eosUrl + '/fineos-services-css/wscomposer/',	
        WS_CSS_REST_URL: 	eosUrl + '/fineos-services-css',	
		WS_REST_URL: 		eosUrl + '/fineos-services-cc',
        FRONTOFFICE_URL: webappUrl,
		CUSTOMER_API_URL: 	eosUrl + '/customerapi/customer',
		GC_API_URL: 		eosUrl + '/groupclientapi/groupClient',
		CONTACT_CENTRE_API_URL : eosUrl + '/contactcentreapi/contact-centre',
		DOCUMENT_WSC_CC_URL: eosUrl + '/fineos-services-cc/wscomposer/webservice' + docuserid,
        ORDINARY_USER:{'userid':'oasis@fineos.com','userpass':'ml!IOY239P^T'},
        PAYMENTOFFICER_USER:{'userid':'divinaol@fineos.com','userpass':'ml!IOY239P^T'}
    };
	
	// Only set the proxy if proxyHost is defined
    if (proxyHost) {
        karate.configure('proxy', proxyUrl);
        karate.configure('driver', {
            type: 'chrome',
            showDriverLog: true,
            headless: true,
            addOptions: ['--proxy-server=' + proxyUrl]
        });
		karate.configure('proxy', proxyUrl);
    } else {
        karate.configure('driver', {
            type: 'chrome',
            showDriverLog: true,
            headless: true
        });
    }
	    var authResult = karate.callSingle('classpath:/app/api/authentication/auth.feature', config);

    karate.set ("GET_HTTP_HEADER", { 'Authorization': 'Bearer ' + authResult.response.access_token })
	karate.set ("WSC_HTTP_HEADERS", { 'Authorization': 'Bearer ' + authResult.response.access_token, 'Content-Type': 'application/xml','userid': 'KEYDATACHANGEWPUSER'})
    karate.set ("WS_HTTP_HEADERS_REST", { 'Authorization': 'Bearer ' + authResult.response.access_token ,'Content-Type': 'application/xml', 'userid': 'oasis'})
	karate.set ("JSONAPI_HTTP_HEADERS", { 'Authorization': 'Bearer ' + authResult.response.access_token, 'Content-Type': 'application/json', 'userid': 'oasis'})
	karate.set ("JSONAPI_HTTP_HEADERS_CC", { 'Authorization': 'Bearer ' + authResult.response.access_token, 'Content-Type': 'application/json', 'userid': 'SVC_APIM_EOS_PS_TST'})
	karate.set ("DOCUMENT_JSONAPI_HTTP_HEADERS", { 'Authorization': 'Bearer ' + authResult.response.access_token, 'Content-Type': 'application/json', 'userid': 'SVC_APIM_EOS_DS_TST'})
	karate.set ("DOCUMENT_WSC_HTTP_HEADERS", { 'Authorization': 'Bearer ' + authResult.response.access_token, 'Content-Type': 'application/xml', 'userid': 'SVC_APIM_EOS_DS_TST'})
	
    return config;
  }

