package com.bit.std_1st.vo;

public class PaymentVo {
	private String pay_no;
	private String pay_name;
	private int totalprice;
	private String coupon_no;
	private int cust_no;
	
	public PaymentVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public PaymentVo(String pay_no, String pay_name, int totalprice, String coupon_no, int cust_no) {
		super();
		this.pay_no = pay_no;
		this.pay_name = pay_name;
		this.totalprice = totalprice;
		this.coupon_no = coupon_no;
		this.cust_no = cust_no;
	}

	public String getPay_no() {
		return pay_no;
	}

	public void setPay_no(String pay_no) {
		this.pay_no = pay_no;
	}

	public String getPay_name() {
		return pay_name;
	}

	public void setPay_name(String pay_name) {
		this.pay_name = pay_name;
	}

	public int getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}

	public String getCoupon_no() {
		return coupon_no;
	}

	public void setCoupon_no(String coupon_no) {
		this.coupon_no = coupon_no;
	}

	public int getCust_no() {
		return cust_no;
	}

	public void setCust_no(int cust_no) {
		this.cust_no = cust_no;
	}

	@Override
	public String toString() {
		return "PaymentVo [pay_no=" + pay_no + ", pay_name=" + pay_name + ", totalprice=" + totalprice + ", coupon_no="
				+ coupon_no + ", cust_no=" + cust_no + "]";
	}
	
	
	

}
