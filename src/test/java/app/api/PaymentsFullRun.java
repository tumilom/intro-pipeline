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
class PaymentsFullRun {

    static String REPORT_PATH = "target/karate-reports";
    @Test
    void testAll() {
        ServerConfig config = App.serverConfig("src/main/java/app");
        HttpServer server = HttpServer.config(config).build();
   
        //runByTagName(server,1,"@fasttrackfromscratchFullLoad,@era-fasttrackfromscratchFullLoad,@fatal-fasttrackfromscratchFullLoad");
        List<Results> results = new ArrayList<>();
        results.add( ReportingUtils.runByTagName(server,3,"@fatal-fasttrackfromscratchFullLoad,@pic-combinedIA-fasttrackfromscratchFullLoad,@fasttrackfromscratchFullLoad,@era-fasttrackfromscratchFullLoad,@nofasttrackfromscratchFullLoad,@css-fasttrackfromscratchFullLoad"));

        ReportingUtils.assertZeroErrors(results);
        
    }

  
     @AfterAll
    public static void generateReport() {

       ReportingUtils.generateReport(REPORT_PATH, "PaymentsFullRun");
      
    }


}
