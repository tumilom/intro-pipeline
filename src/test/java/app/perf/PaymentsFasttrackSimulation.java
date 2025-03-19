package app.perf;

import com.intuit.karate.gatling.javaapi.KarateProtocolBuilder;
import io.gatling.javaapi.core.ScenarioBuilder;
import io.gatling.javaapi.core.Simulation;

import static com.intuit.karate.gatling.javaapi.KarateDsl.*;
import static io.gatling.javaapi.core.CoreDsl.rampUsers;
import static io.gatling.javaapi.core.CoreDsl.scenario;

import io.gatling.javaapi.core.FeederBuilder;
import static io.gatling.javaapi.core.CoreDsl.*;



public class PaymentsFasttrackSimulation extends Simulation {

    public PaymentsFasttrackSimulation() {

        KarateProtocolBuilder protocol = karateProtocol(
            uri("/customerapi/customer/claims/{id}/benefits").nil()
        );
       String karateEnv = System.getenv("KARATE_ENV");
       if(karateEnv!=null){
            protocol.runner.karateEnv(karateEnv);
       }

       protocol.nameResolver = (req, ctx) -> req.getHeader("wsConfigName");
        
        
        FeederBuilder.Batchable<String> fatalFasttrackFeeder =  csv("app/api/scenarios/Payments/fatal-payments/fatal-fast-track-data.csv").circular();
        ScenarioBuilder fatalFasttrackScenario = scenario("payments_Fatal").feed(fatalFasttrackFeeder);
        String[] csvFatalFastTrackHeaders = "seq,defType,causeOfInjury,claimantFirstName,lastname,lodgementOffset,dobOffset,medCode,taxType,irdNo,firstNames,dateOfBirthOffSet,irdNumberVal0,irdNumberVal1,irdNumberVal2,genderVal,ethnicityVal,addressLine1Val,suburbVal,cityVal,postCodeVal,firstNames1,lastName1,dateOfBirthOffSet1,irdNumberVal01,irdNumberVal11,irdNumberVal21,genderVal1,ethnicityVal1,addressLine1Val1,suburbVal1,cityVal1,postCodeVal1,employerNumber,employmentType,earnings01Type,earnings01Amount,earnings02Type,earnings02Amount".split(",");
        fatalFasttrackScenario = reInjectGatlingParamsIntoKarate(fatalFasttrackScenario,csvFatalFastTrackHeaders)
                .exec(karateFeature("classpath:app/api/scenarios/Payments/fatal-payments/fatal-fasttrackfromscratch.feature"));

        FeederBuilder.Batchable<String> fasttrackFeeder =  csv("app/api/scenarios/Payments/fast-track-data.csv").circular();
        ScenarioBuilder fasttrackScenario = scenario("payments_Fasttrack").feed(fasttrackFeeder);
        String[] csvFastTrackHeaders = "seq,defType,causeOfInjury,claimantFirstName,lastname,lodgementOffset,dobOffset,medCode,taxType,irdNo,employerNumber,employmentType,earnings01Type,earnings01Amount,earnings02Type,earnings02Amount".split(",");
        fasttrackScenario = reInjectGatlingParamsIntoKarate(fasttrackScenario,csvFastTrackHeaders)
                .exec(karateFeature("classpath:app/api/scenarios/Payments/fasttrack.feature"));

        String[] csvPicTrackHeaders = "seq,defType,causeOfInjury,claimantFirstName,lastname,lodgementOffset,dobOffset,medCode,taxType,irdNo,picAccidentDateTime,picAccidentDateNoTime,incurredDate,lumpSum,flpPaid,lumpsumWpiScore,paidDate,applicationDate,wpiScore".split(",");
        FeederBuilder.Batchable<String> picFasttrackFeeder =  csv("app/api/scenarios/Payments/pic-payments/pic-combinedIA-fast-track-data.csv").circular();
        ScenarioBuilder picScenario = scenario("payments_PIC_Combined").feed(picFasttrackFeeder);
        picScenario = reInjectGatlingParamsIntoKarate(picScenario,csvPicTrackHeaders)
                .exec(karateFeature("classpath:app/api/scenarios/Payments/pic-payments/pic-combinedIA-fasttrack.feature"));

        String[] csvEraFasttrackHeaders ="seq,defType,causeOfInjury,claimantFirstName,lastname,lodgementOffset,dobOffset,medCode,taxType,irdNo,employerNumber,employmentType,eraPaymentOption,earnings01Type,earnings01Amount,earnings02Type,earnings02Amount".split(",");
        FeederBuilder.Batchable<String> eraFasttrackFeeder =  csv("app/api/scenarios/Payments/era-payments/era-fast-track-data.csv").circular();
        ScenarioBuilder eraScenario = scenario("payments_era").feed(eraFasttrackFeeder);
        eraScenario = reInjectGatlingParamsIntoKarate(eraScenario,csvEraFasttrackHeaders)
            .exec(karateFeature("classpath:app/api/scenarios/Payments/ERA-payments/era-fasttrack.feature"));

        

        String[] csvCSSFasttrackHeaders = "seq,defType,causeOfInjury,claimantFirstName,lastname,lodgementOffset,dobOffset,medCode,taxType,irdNo,adjType,entitlementName,unitVal,rateVal".split(",");
        FeederBuilder.Batchable<String> cssFasttrackFeeder =  csv("app/api/scenarios/Payments/css-payments/css-fast-track-data.csv").circular();

        ScenarioBuilder cssScenario = scenario("payments_css").feed(cssFasttrackFeeder);
        cssScenario = reInjectGatlingParamsIntoKarate(cssScenario,csvCSSFasttrackHeaders)
            .exec(karateFeature("classpath:app/api/scenarios/Payments/css-payments/css-fasttrack.feature"));

        setUp(
            fatalFasttrackScenario.injectOpen(nothingFor(1),rampUsers(1).during(5)).protocols(protocol)
            ,
            fasttrackScenario.injectOpen(rampUsers(10).during(300)).protocols(protocol)
            ,
            picScenario.injectOpen(nothingFor(0),rampUsers(2).during(15)).protocols(protocol)
            ,
            eraScenario.injectOpen(nothingFor(30),rampUsers(10).during(250)).protocols(protocol)
            ,
            cssScenario.injectOpen(nothingFor(22),rampUsers(2).during(200)).protocols(protocol)
        );
    }


    private ScenarioBuilder reInjectGatlingParamsIntoKarate(ScenarioBuilder scenarioBuilderParam,String[] csvHeaders ){
        ScenarioBuilder scenarioBldr = scenarioBuilderParam;
        for(int i =0; i<csvHeaders.length; i++){
            final String header = csvHeaders[i];
            scenarioBldr = scenarioBldr.exec(karateSet(header, session -> session.getString(header)));
        }
        return scenarioBldr;
    }
}