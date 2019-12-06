package com.bit.std_1st.vo;
public class EvtCouponVo {
	private String coupon_no;
	private String isused;
	private int evt_no;
	private int cust_no;
	public EvtCouponVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public EvtCouponVo(String coupon_no, String isused, int evt_no, int cust_no) {
		super();
		this.coupon_no = coupon_no;
		this.isused = isused;
		this.evt_no = evt_no;
		this.cust_no = cust_no;
	}
	public String getCoupon_no() {
		return coupon_no;
	}
	public void setCoupon_no(String coupon_no) {
		this.coupon_no = coupon_no;
	}
	public String getIsused() {
		return isused;
	}
	public void setIsused(String isused) {
		this.isused = isused;
	}
	public int getEvt_no() {
		return evt_no;
	}
	public void setEvt_no(int evt_no) {
		this.evt_no = evt_no;
	}
	public int getCust_no() {
		return cust_no;
	}
	public void setCust_no(int cust_no) {
		this.cust_no = cust_no;
	}

}
