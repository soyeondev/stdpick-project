package com.bit.std_1st.vo;

public class ReserCountVo {
	private String reser_date;
	private int reser_count;
	public ReserCountVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReserCountVo(String reser_date, int reser_count) {
		super();
		this.reser_date = reser_date;
		this.reser_count = reser_count;
	}
	public String getReser_date() {
		return reser_date;
	}
	public void setReser_date(String reser_date) {
		this.reser_date = reser_date;
	}
	public int getReser_count() {
		return reser_count;
	}
	public void setReser_count(int reser_count) {
		this.reser_count = reser_count;
	}
	
	

}
