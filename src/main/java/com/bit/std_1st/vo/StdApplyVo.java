package com.bit.std_1st.vo;

public class StdApplyVo {
	private int apply_no;
	private int cust_no;
	private int std_no;
	private String apply_content;
	private String std_aprv;
	
	public StdApplyVo() {
		// TODO Auto-generated constructor stub
	}
	
	
	@Override
	public String toString() {
		return "StdApplyVo [apply_no=" + apply_no + ", cust_no=" + cust_no + ", std_no=" + std_no + ", apply_content="
				+ apply_content + ", std_aprv=" + std_aprv + "]";
	}



	public StdApplyVo(int apply_no, int cust_no, int std_no, String apply_content, String std_aprv) {
		super();
		this.apply_no = apply_no;
		this.cust_no = cust_no;
		this.std_no = std_no;
		this.apply_content = apply_content;
		this.std_aprv = std_aprv;
	}



	public int getApply_no() {
		return apply_no;
	}
	
	public void setApply_no(int apply_no) {
		this.apply_no = apply_no;
	}
	
	public int getCust_no() {
		return cust_no;
	}
	
	public void setCust_no(int cust_no) {
		this.cust_no = cust_no;
	}
	
	public int getStd_no() {
		return std_no;
	}
	
	public void setStd_no(int std_no) {
		this.std_no = std_no;
	}
	
	public String getApply_content() {
		return apply_content;
	}
	
	public void setApply_content(String apply_content) {
		this.apply_content = apply_content;
	}
	
	public String getStd_aprv() {
		return std_aprv;
	}
	
	public void setStd_aprv(String std_aprv) {
		this.std_aprv = std_aprv;
	}
	
		
	
		
	
}
