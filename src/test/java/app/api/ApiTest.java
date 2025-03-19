package app.api;

import app.App;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.http.HttpServer;
import com.intuit.karate.http.ServerConfig;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.io.File;
import java.io.FileFilter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.AfterAll;

class ApiTest {


    static String REPORT_PATH = "target/karate-reports";

    @Test
    void testAll() {
        ServerConfig config = App.serverConfig("src/main/java/app");
        HttpServer server = HttpServer.config(config).build();
        Results results = Runner.path("classpath:app/")
                .systemProperty("url.base", "http://localhost:" + server.getPort())
                .outputCucumberJson(true)    
                .parallel(1);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

       @AfterAll
    public static void generateReport() {

        File[] files = new File(REPORT_PATH).getParentFile().listFiles(new FileFilter() {

            @Override
            public boolean accept(File pathname) {
                return pathname.getAbsolutePath().contains("karate-reports");
            }
            
        });
        Collection<File> jsonFiles = new ArrayList<File>();
        for (File file2 : files) {

            jsonFiles.addAll(FileUtils.listFiles(file2, new String[] {"json"}, true));
        }
        generateReport(jsonFiles);
      
    }

    private static void generateReport( Collection<File> jsonFiles ){
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "BootstrapRun");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}

