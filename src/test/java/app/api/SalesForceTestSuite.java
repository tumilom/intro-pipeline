package app.api;

import app.App;
import com.intuit.karate.Results;
import com.intuit.karate.http.HttpServer;
import com.intuit.karate.http.ServerConfig;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;

/**
 * Runs load scripts in desired order. Where possible running in parallel.   
 */
class SalesForceTestSuite {

    static String REPORT_PATH = "target/karate-reports";
    @Test
    void testAll() {
        ServerConfig config = App.serverConfig("src/main/java/app");
        HttpServer server = HttpServer.config(config).build();
       
     
       List<Results> results = new ArrayList<>();
       results.add(ReportingUtils.runByTagName(server,3,"@acc45submit"));
       results.add(ReportingUtils.runByTagName(server,3,"@salesforce-scenario1-party,@fasttrackfromscratchSingleCase,@salesforce-scenario2-contacts"));
       results.add(ReportingUtils.runByTagName(server,3,"@salesforce-scenario3-Recovery-Plan,@salesforce-scenario4-tasks,@addPurchaseOrder"));
       results.add(ReportingUtils.runByTagName(server,3,"@salesforce-scenario6-claim-benefit,@salesforce-scenario7-claims-list,@salesforce-scenario8-cp-etc"));
       
       
       ReportingUtils.assertZeroErrors(results);
       
    }

    @AfterAll
    public static void generateReport() {

       ReportingUtils.generateReport(REPORT_PATH, "SalesForceTestSuite");
      
    }

}

