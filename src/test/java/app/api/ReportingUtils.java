package app.api;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

import org.apache.commons.io.FileUtils;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.http.HttpServer;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.io.File;
import java.io.FileFilter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * Runs load scripts in desired order. Where possible running in parallel.   
 */
public class ReportingUtils {

    public ReportingUtils(){}

    public static Results runByTagName(HttpServer server,String... tagName) {
        return runByTagName(server, 1, tagName);
    }

    public static Results runByTagName(HttpServer server, int threadCount, String... tagName) {
        Results results = Runner.path("classpath:app/")
                .systemProperty("url.base", "http://localhost:" + server.getPort())
                .tags(tagName)         
                .outputCucumberJson(true)       
                .parallel(threadCount);

                return results;
      //  
    }

    public static void assertZeroErrors(List<Results> results ){
        int failCount =0;
        StringBuilder errorMsg = new StringBuilder();
        for (Results results4 : results) {
         failCount +=results4.getFailCount();
         errorMsg.append(results4.getErrorMessages()).append(' ');
 
        }
        assertEquals(0, failCount, errorMsg.toString());
 
    }

    
    public static void generateReport(String reportPath,String reportName) {

        File[] files = new File(reportPath).getParentFile().listFiles(new FileFilter() {

            @Override
            public boolean accept(File pathname) {
                return pathname.getAbsolutePath().contains("karate-reports");
            }
            
        });
        Collection<File> jsonFiles = new ArrayList<File>();
        for (File file2 : files) {

            jsonFiles.addAll(FileUtils.listFiles(file2, new String[] {"json"}, true));
        }
        generateReport(jsonFiles,reportName);
      
    }

    private static void generateReport( Collection<File> jsonFiles,String reportName ){
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), reportName);
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}

