// Name: Prasad Khedekar  G# - G00973357

package swe642.assgn4.jdbc.beans;

public class DataBean {
	private double mean;
	private double stdDev;
	
	public DataBean() {}
	
	public DataBean (float mean, double stdDev){
		this.mean = mean;
		this.stdDev = stdDev;
	}

	public double getMean() {
		return mean;
	}

	public void setMean(double mean) {
		this.mean = mean;
	}

	public double getStdDev() {
		return stdDev;
	}

	public void setStdDev(double stdDev) {
		this.stdDev = stdDev;
	}
	
}
