package pets;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class ManagementTest {
    @Test
    void testParallel() {
        Results results = Runner.path("classpath:pets")
                .tags("~@ignore")
                .outputCucumberJson(true)
                .reportDir("build/reports/cucumber")
                .parallel(1);

        generateReport(results.getReportDir());
    }

    private static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = org.apache.commons.io.FileUtils.listFiles(
                new File(karateOutputPath),
                new String[]{"json"},
                true
        );

        List<String> jsonPaths = new ArrayList<>();
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));

        File reportOutputDirectory = new File("build");
        Configuration config = new Configuration(reportOutputDirectory, "Petstore Karate - Cucumber Report");
        config.addClassifications("Framework", "Karate");
        config.addClassifications("Build Tool", "Gradle 7.6.1");
        config.addClassifications("JDK", System.getProperty("java.version"));

        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}
