package com.bit.std_1st.vo;

public class GetPassVo {
	private int get_pass_no;
	private int pass_no;
	private String pay_no;
	private int amount;
	
	public GetPassVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GetPassVo(int get_pass_no, int pass_no, String pay_no, int amount) {
		super();
		this.get_pass_no = get_pass_no;
		this.pass_no = pass_no;
		this.pay_no = pay_no;
		this.amount = amount;
	}
	public int getGet_pass_no() {
		return get_pass_no;
	}
	public void setGet_pass_no(int get_pass_no) {
		this.get_pass_no = get_pass_no;
	}
	public int getPass_no() {
		return pass_no;
	}
	public void setPass_no(int pass_no) {
		this.pass_no = pass_no;
	}
	public String getPay_no() {
		return pay_no;
	}
	public void setPay_no(String pay_no) {
		this.pay_no = pay_no;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	

}
