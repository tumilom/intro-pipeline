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
class MyACCTestSuite {

    static String REPORT_PATH = "target/karate-reports";
    @Test
    void testAll() {
        ServerConfig config = App.serverConfig("src/main/java/app");
        HttpServer server = HttpServer.config(config).build();
      
       List<Results> results = new ArrayList<>();
       results.add(ReportingUtils.runByTagName(server,3,"@acc45submit,@fasttrackfromscratchSingleCase,@nofasttrackfromscratchSingleCase"));
       results.add(ReportingUtils.runByTagName(server,1,"@customer-scenario1-customer-taxcode-payment-preference,@customer-scenario2-abatement"));
       results.add(ReportingUtils.runByTagName(server,1,"@customer-scenario3-Recovery-Plan,@customer-scenario4-client-reimbursement"));
       //tests in scenario5 below require Westpack Auto to run as precondition
       //results.add(ReportingUtils.runByTagName(server,1,"@customer-scenario5-payments-info"));
       results.add(ReportingUtils.runByTagName(server,1,"@customer-scenario6-claims-info"));
       
       ReportingUtils.assertZeroErrors(results);
       
    }

    @AfterAll
    public static void generateReport() {

       ReportingUtils.generateReport(REPORT_PATH, "MyACCTestSuite");
      
    }

}

