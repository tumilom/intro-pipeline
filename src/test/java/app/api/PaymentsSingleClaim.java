package app.api;

import app.App;

import com.intuit.karate.Results;
import com.intuit.karate.http.HttpServer;
import com.intuit.karate.http.ServerConfig;
import org.junit.jupiter.api.Test;


import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.AfterAll;

/**
 * Runs load scripts in desired order. Where possible running in parallel.   
 */
class PaymentsSingleClaim {

    static String REPORT_PATH = "target/karate-reports";
    @Test
    void testAll() {
        new ReportingUtils();

        ServerConfig config = App.serverConfig("src/main/java/app");
        HttpServer server = HttpServer.config(config).build();
        List<Results> results = new ArrayList<>();
        //runByTagName(server,1,"@fasttrackfromscratchFullLoad,@era-fasttrackfromscratchFullLoad,@fatal-fasttrackfromscratchFullLoad");
        results.add( ReportingUtils.runByTagName(server,3,"@fatal-fasttrackfromscratchSingleCase,@pic-combinedIA-fasttrackfromscratchSingleCase,@fasttrackfromscratchSingleCase,@era-fasttrackfromscratchSingleCase,@nofasttrackfromscratchSingleCase,@css-fasttrackfromscratchSingleCase"));
        ReportingUtils.assertZeroErrors(results);
        
    }

     @AfterAll
    public static void generateReport() {

       
       ReportingUtils.generateReport(REPORT_PATH,"PaymentsSingleClaim");
      
    }

}
