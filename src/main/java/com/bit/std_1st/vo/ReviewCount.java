package com.bit.std_1st.vo;

public class ReviewCount {
	private int grade;
	private int cnt;
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getCnt() {
		return cnt;
	}
	
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	public ReviewCount() {
		// TODO Auto-generated constructor stub
	}
	public ReviewCount(int grade, int cnt) {
		super();
		this.grade = grade;
		this.cnt = cnt;
	}
	
	
}
