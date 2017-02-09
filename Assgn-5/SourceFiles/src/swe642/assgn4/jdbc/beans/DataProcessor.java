// Name: Prasad Khedekar  G# - G00973357

package swe642.assgn4.jdbc.beans;

import java.util.*;
import swe642.assgn4.jdbc.beans.DataBean;

public class DataProcessor {
	public static DataBean compute(String data){
		double mean = 0;
		double stdDev = 0;
		
		String[] strArray = data.split(",");
		for(String t : strArray)
		{
			mean += Double.valueOf(t);
		}

		mean = mean/strArray.length;

		for(String t : strArray)
		{
			stdDev += ((Double.valueOf(t) - mean) * (Double.valueOf(t) - mean)) ;		
		}

		stdDev = stdDev/strArray.length;

		stdDev = Math.sqrt(stdDev);
		
		DataBean computedData = new DataBean();
		computedData.setMean(mean);
		computedData.setStdDev(stdDev);
		return computedData;
	}
}
