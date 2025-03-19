function fn() {
  var userid = '?userid=KEYDATACHANGEWPUSER'
  var eosApisUrl = 'https://eos-dt-api.apac.fineos.com'
  var proxyHost = karate.properties['http.proxyHost'] || '';
  var proxyPort = karate.properties['http.proxyPort'] || '';
  var proxyUrl = 'http://'+proxyHost+':'+proxyPort;
   
  karate.configure('connectTimeout', 120000);
  karate.configure('readTimeout', 120000);  
  karate.configure('retry',{ count:20, interval:2000});
  
  var config = { 
	FRONTOFFICE_URL: 'http://oasis:oasis1@localhost:8080/frontoffice',
	BATCHID : karate.properties['envBatchId'],
	RUNNERID : karate.properties['envRunnerId'],
	RUNID : karate.properties['envRunnerId'] + karate.properties['envBatchId'],
  UPLOADXMLDOC_USERID: 'KEYDATACHANGEWPUSER',
  WSC_CC_USERID:'KEYDATACHANGEWPUSER',
  WSC_PS_USERID:'KEYDATACHANGEWPUSER'
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
            headless: false
        });
    }
	
  return config;
}
