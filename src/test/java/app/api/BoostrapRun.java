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
class BootstrapRun {

    static String REPORT_PATH = "target/karate-reports";
    @Test
    void testAll() {
        ServerConfig config = App.serverConfig("src/main/java/app");
        HttpServer server = HttpServer.config(config).build();
       
       // runByTagName(server,5,"@updateFacility");
       List<Results> results = new ArrayList<>();
       results.add(ReportingUtils.runByTagName(server,2,"@updateProvider,@updateVendor,@updateFacility,@updateEmployer"));
       results.add(ReportingUtils.runByTagName(server,1,"@warmUpFrontoffice"));
       results.add(ReportingUtils.runByTagName(server,3,"@bootstrap"));
       results.add(ReportingUtils.runByTagName(server,3,"@updateEmployerPP"));
       
       ReportingUtils.assertZeroErrors(results);
       
    }

    @AfterAll
    public static void generateReport() {

       ReportingUtils.generateReport(REPORT_PATH, "BootstrapRun");
      
    }

}

