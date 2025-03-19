package app.perf;

import com.intuit.karate.gatling.javaapi.KarateProtocolBuilder;
import io.gatling.javaapi.core.ScenarioBuilder;
import io.gatling.javaapi.core.Simulation;

import static com.intuit.karate.gatling.javaapi.KarateDsl.*;
import static io.gatling.javaapi.core.CoreDsl.rampUsers;
import static io.gatling.javaapi.core.CoreDsl.scenario;

import io.gatling.javaapi.core.FeederBuilder;
import static io.gatling.javaapi.core.CoreDsl.*;

public class UpdatesFromMFPSimulation extends Simulation {

    public UpdatesFromMFPSimulation() {

        KarateProtocolBuilder protocol = karateProtocol(
                uri("/api/todos/{id}").nil()
        );
       String karateEnv = System.getenv("KARATE_ENV");
       if(karateEnv!=null){
            protocol.runner.karateEnv(karateEnv);
       }
        //providerId,extLocationInstanceName,extClassDesc,extClassCode,extRegisteredForServices,extStatus,extStatusReason
        FeederBuilder.Batchable<String> providersFeeder =  csv("app/api/reload/services-cc/posts/update-provider-data-perf.csv").circular();
        ScenarioBuilder updateProviderScenario = scenario("update_Provider").group("update_provider_group").on(feed(providersFeeder))
        .exec(karateSet("providerId", session -> session.getString("providerId")))
        .exec(karateSet("extLocationInstanceName", session -> session.getString("extLocationInstanceName")))
        .exec(karateSet("extClassDesc", session -> session.getString("extClassDesc")))
        .exec(karateSet("extClassCode", session -> session.getString("extClassCode")))
        .exec(karateSet("extRegisteredForServices", session -> session.getString("extRegisteredForServices")))
        .exec(karateSet("extStatus", session -> session.getString("extStatus")))
        .exec(karateSet("extStatusReason", session -> session.getString("extStatusReason")))
        .exec(karateFeature("classpath:app/api/reload/services-cc/posts/UpdateOrCreateProviderv1.feature"));
        //ScenarioBuilder updateProviderScenario = scenario("update_Provider").exec(karateFeature("classpath:app/api/reload/services-cc/posts/update-provider.feature"));

        //vendorId,vendorName,extLocationInstanceName,extVendorAgencyType,extStatus,extStatusReason
        FeederBuilder.Batchable<String> vendorsFeeder =  csv("app/api/reload/services-cc/posts/update-vendor-data-perf.csv").circular();
        ScenarioBuilder updateVendorScenario = scenario("update_Vendor").group("update_vendor_group").on(feed(vendorsFeeder))
        .exec(karateSet("vendorId", session -> session.getString("vendorId")))
        .exec(karateSet("vendorName", session -> session.getString("vendorName")))
        .exec(karateSet("extLocationInstanceName", session -> session.getString("extLocationInstanceName")))
        .exec(karateSet("extVendorAgencyType", session -> session.getString("extVendorAgencyType")))
        .exec(karateSet("extStatus", session -> session.getString("extStatus")))
        .exec(karateSet("extStatusReason", session -> session.getString("extStatusReason")))
        .exec(karateFeature("classpath:app/api/reload/services-cc/posts/UpdateOrCreateVendor.feature"));
        //.exec(karateFeature("classpath:app/api/reload/services-cc/posts/update-vendor.feature"));

        //facilityId,facilityName,extStatus,extStatusReason
        FeederBuilder.Batchable<String> facilitiesFeeder =  csv("app/api/reload/services-cc/posts/update-facility-data-perf.csv").circular();
        ScenarioBuilder updateFacilityScenario = scenario("update_Facility")
        .group("update_facility_group").on(feed(facilitiesFeeder))
        .exec(karateSet("facilityId", session -> session.getString("facilityId")))
        .exec(karateSet("facilityName", session -> session.getString("facilityName")))
        .exec(karateSet("extStatus", session -> session.getString("extStatus")))
        .exec(karateSet("extStatusReason", session -> session.getString("extStatusReason")))
        .exec(karateFeature("classpath:app/api/reload/services-cc/posts/UpdateOrCreateFacility.feature"));
        
        //ScenarioBuilder updateFacilityScenario = scenario("update_Facility").exec(karateFeature("classpath:app/api/reload/services-cc/posts/update-facility.feature"));

        setUp(
            updateVendorScenario.injectOpen(nothingFor(40),
                rampUsers(5).during(15),
                constantUsersPerSec(5).during(150).randomized(),
                rampUsersPerSec(5).to(10).during(10).randomized(), 
                stressPeakUsers(10).during(20)
            ).protocols(protocol),
            updateFacilityScenario.injectOpen(nothingFor(20),
                rampUsers(5).during(15),
                constantUsersPerSec(5).during(150).randomized()
            ).protocols(protocol),
            updateProviderScenario.injectOpen(nothingFor(1),
                rampUsers(10).during(15),
                constantUsersPerSec(5).during(150).randomized(),
                rampUsersPerSec(5).to(10).during(10).randomized(), 
                stressPeakUsers(10).during(20)
            ).protocols(protocol)
        ).assertions(details("update_facility_group").failedRequests().percent().is(0d))
        .assertions(details("update_provider_group").failedRequests().percent().is(0d))
        .assertions(details("update_vendor_group").failedRequests().percent().is(0d));
    }

}