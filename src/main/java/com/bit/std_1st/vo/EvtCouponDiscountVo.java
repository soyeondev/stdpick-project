package com.bit.std_1st.vo;

public class EvtCouponDiscountVo {
	private String coupon_no;
	private int discount;
	private String isused;
	
	
	public EvtCouponDiscountVo() {
		super();
		// TODO Auto-generated constructor stub
	}


	public EvtCouponDiscountVo(String coupon_no, int discount, String isused) {
		super();
		this.coupon_no = coupon_no;
		this.discount = discount;
		this.isused = isused;
	}


	public String getCoupon_no() {
		return coupon_no;
	}


	public void setCoupon_no(String coupon_no) {
		this.coupon_no = coupon_no;
	}


	public int getDiscount() {
		return discount;
	}


	public void setDiscount(int discount) {
		this.discount = discount;
	}


	public String getIsused() {
		return isused;
	}


	public void setIsused(String isused) {
		this.isused = isused;
	}
}
