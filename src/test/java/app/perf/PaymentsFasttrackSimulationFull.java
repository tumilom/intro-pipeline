package app.perf;

import com.intuit.karate.gatling.javaapi.KarateProtocolBuilder;
import io.gatling.javaapi.core.ScenarioBuilder;
import io.gatling.javaapi.core.Simulation;

import static com.intuit.karate.gatling.javaapi.KarateDsl.*;
import static io.gatling.javaapi.core.CoreDsl.rampUsers;
import static io.gatling.javaapi.core.CoreDsl.scenario;



public class PaymentsFasttrackSimulationFull extends Simulation {

    public PaymentsFasttrackSimulationFull() {

        KarateProtocolBuilder protocol = karateProtocol(
            uri("/customerapi/customer/claims/{id}/benefits").nil()
            
        );
       String karateEnv = System.getenv("KARATE_ENV");
       if(karateEnv!=null){
            protocol.runner.karateEnv(karateEnv);
       }
       
       protocol.nameResolver = (req, ctx) -> req.getHeader("wsConfigName");

        //FeederBuilder.Batchable<String> providersFeeder =  csv("app/api/reload/services-cc/posts/update-provider-data-perf.csv").random();
        //ScenarioBuilder updateProviderScenario = scenario("updateProviderScenario").feed(providersFeeder).exec(karateFeature("classpath:app/api/reload/services-cc/posts/update-provider.feature"));
        ScenarioBuilder fatalFasttrackScenario = scenario("payments_Fatal").exec(karateFeature("classpath:app/api/scenarios/Payments/fatal-payments/fatal-fasttrackfromscratch.feature","@fatal-fasttrackfromscratchFullLoad"));
        ScenarioBuilder fasttrackScenario = scenario("payments_Faststrack").exec(karateFeature("classpath:app/api/scenarios/Payments/fasttrackfromscratch.feature","@fasttrackfromscratchFullLoad"));
        ScenarioBuilder picScenario = scenario("payments_PIC_Combined").exec(karateFeature("classpath:app/api/scenarios/Payments/pic-payments/pic-combinedIA-fasttrackfromscratch.feature","@pic-combinedIA-fasttrackfromscratchFullLoad"));
        ScenarioBuilder eraScenario = scenario("payments_era").exec(karateFeature("classpath:app/api/scenarios/Payments/ERA-payments/era-fasttrackfromscratch.feature","@era-fasttrackfromscratchFullLoad"));
        ScenarioBuilder cssScenario = scenario("payments_css").exec(karateFeature("classpath:app/api/scenarios/Payments/css-payments/css-fasttrackfromscratch.feature","@css-fasttrackfromscratchFullLoad"));

        setUp(
            fatalFasttrackScenario.injectOpen(rampUsers(1).during(5)).protocols(protocol),
            fasttrackScenario.injectOpen(rampUsers(1).during(5)).protocols(protocol),
            picScenario.injectOpen(rampUsers(1).during(5)).protocols(protocol),
            eraScenario.injectOpen(rampUsers(1).during(5)).protocols(protocol),
            cssScenario.injectOpen(rampUsers(1).during(5)).protocols(protocol)
        );
    }

}