package com.bit.std_1st.vo;

public class ReviewAvg {
	private String avg;
	private String total;
	
	public ReviewAvg() {
		// TODO Auto-generated constructor stub
	}
	
	
	

	public ReviewAvg(String avg, String total) {
		super();
		this.avg = avg;
		this.total = total;
	}



	public String getAvg() {
		return avg;
	}



	public void setAvg(String avg) {
		this.avg = avg;
	}



	public String getTotal() {
		return total;
	}



	public void setTotal(String total) {
		this.total = total;
	}



	@Override
	public String toString() {
		return "ReviewAvg [avg=" + avg + ", total=" + total + "]";
	}
	
	
}
