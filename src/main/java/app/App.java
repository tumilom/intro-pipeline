package app;

import com.intuit.karate.http.HttpServer;
import com.intuit.karate.http.ServerConfig;
import com.intuit.karate.http.ServerContext;
import com.intuit.karate.PerfContext;


import io.netty.util.internal.ThreadLocalRandom;

import java.text.SimpleDateFormat;
import java.text.ParseException;

import java.util.Calendar;
import java.util.Date;


public class App {

    public static ServerConfig serverConfig(String root) {
        ServerConfig config = new ServerConfig(root).useGlobalSession(true);
        config.contextFactory(request -> {
            ServerContext context = new ServerContext(config, request);
            String path = request.getPath();
            if (context.setApiIfPathStartsWith("/api/")) {
                context.setLockNeeded(true);
            } else if (path.endsWith(".ico") || path.startsWith("/pub/")) {
                context.setHttpGetAllowed(true);
            }
            return context;
        });
        return config;
    }
    
    public static void main(String[] args) {
        ServerConfig config = App.serverConfig(args[0]);
        HttpServer.config(config).local(false).http(8080).build().waitSync();        
    }

	public static String daysFromNow(String offsetStr ){
		return daysFromNow(offsetStr, "yyyy-MM-dd\'T\'HH:mm:ss");
	}

	public static String daysFromNow(String offsetStr, String format){
		int offset = Integer.valueOf(offsetStr);
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		Calendar date =  java.util.Calendar.getInstance();
		date.add(6,offset);
		return sdf.format(date.getTime());
	}

	public static String daysInPast(String offsetStr ){
		return daysInPast(offsetStr, "yyyy-MM-dd\'T\'HH:mm:ss");
	}

	public static String daysInPast(String offsetStr, String format){
		int offset = Integer.valueOf(offsetStr);
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		Calendar date =  java.util.Calendar.getInstance();
		date.add(6, -1 * offset);
		return sdf.format(date.getTime());
	}
	
	private static long nextScheduledCallInMillis = System.currentTimeMillis() -2500;
	/**
	 * 
	 * @return
	 */
	public static synchronized long millsToWait(){
		long currentTimeMillis = System.currentTimeMillis();
		long waittime = nextScheduledCallInMillis - currentTimeMillis + 2500;
		long rettime = 0;
		if(waittime > 0){
			nextScheduledCallInMillis = currentTimeMillis + waittime;
			rettime = waittime;
		}else{
			nextScheduledCallInMillis = currentTimeMillis;
		}
		
		return rettime;
	}
	
	public static String waitFewSecsMaybe(){
		return waitBeforeDriverInit();
	}

	public static String waitBeforeDriverInit(){
		long waitMillis = 0;
		try{
			waitMillis = millsToWait();
			Thread.sleep(waitMillis);
		} catch (InterruptedException e) {
			//nothing to do
		}
		return "Wating for " +String.valueOf(waitMillis) +" millis";
	}


	public static String formatDate(String dateStringValue, String currentFormat, String newFormat) throws ParseException{	
		SimpleDateFormat sdf = new SimpleDateFormat(currentFormat);
		sdf.setLenient(false);
		Date dateValue = sdf.parse(dateStringValue);
			
		SimpleDateFormat newFormatter = new SimpleDateFormat(newFormat);			
		return newFormatter.format(dateValue);		
	}

	public static String reverseStr(String str){
	  // Conversion from String object To StringBuffer
		  StringBuffer sbr = new StringBuffer(str);
      // Reverse String
    	return sbr.reverse().toString();
	}

	/**
	 * Replaces digits with characters 0 ==> A, 1 ==> B, .., 9 ==> J. 
	 * @param input
	 * @return Same length string without digits.
	 */
	public static String replaceDigits(String input){
		if(input == null || "".equals(input)){
			return input;
		}

        // Converting the given string
        // into a character array
        char[] charArray = input.toCharArray();
        
        // Traverse the character array
        for (int i = 0; i < charArray.length; i++) {
 
            // Check if the specified character is digit
            // add this character replacement into result variable
            if (Character.isDigit(charArray[i])) {
                charArray[i] = (char) (charArray[i] +17);
            }
		}
		return String.valueOf(charArray);
	
	}

	/**
	 * delegate call to ThreadLocalRandom.current().nextInt
	 * @param from
	 * @param to
	 * @return
	 */
	public static int nextIntRange(int from, int to){
		return ThreadLocalRandom.current().nextInt(from, to);	
	}

	public static long currentTimeMillis(){
		return System.currentTimeMillis();
	}

	public static long logEvent(String eventName, long startTime, PerfContext context) {
		long endTime = System.currentTimeMillis();
		// and here is where you send the performance data to the reporting engine
		context.capturePerfEvent(eventName, startTime, endTime);
		return endTime - startTime;
	 }
}
