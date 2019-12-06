package com.bit.std_1st.vo;

public class MPCafePassVo {

	private int mps_pay_no;
	private int mps_totalprice;
	//private int mps_get_pass_no;
	private String mps_pass_content;
	private String mps_cafe_name;
	private String mps_cafe_hrs;
	private String mps_cafe_loc;
	private String mps_cafe_phone;
	
	
	public String getMps_cafe_phone() {
		return mps_cafe_phone;
	}
	public void setMps_cafe_phone(String mps_cafe_phone) {
		this.mps_cafe_phone = mps_cafe_phone;
	}
	public int getMps_pay_no() {
		return mps_pay_no;
	}
	public void setMps_pay_no(int mps_pay_no) {
		this.mps_pay_no = mps_pay_no;
	}
	public int getMps_totalprice() {
		return mps_totalprice;
	}
	public void setMps_totalprice(int mps_totalprice) {
		this.mps_totalprice = mps_totalprice;
	}
	public String getMps_pass_content() {
		return mps_pass_content;
	}
	public void setMps_pass_content(String mps_pass_content) {
		this.mps_pass_content = mps_pass_content;
	}
	public String getMps_cafe_name() {
		return mps_cafe_name;
	}
	public void setMps_cafe_name(String mps_cafe_name) {
		this.mps_cafe_name = mps_cafe_name;
	}
	public String getMps_cafe_hrs() {
		return mps_cafe_hrs;
	}
	public void setMps_cafe_hrs(String mps_cafe_hrs) {
		this.mps_cafe_hrs = mps_cafe_hrs;
	}
	public String getMps_cafe_loc() {
		return mps_cafe_loc;
	}
	public void setMps_cafe_loc(String mps_cafe_loc) {
		this.mps_cafe_loc = mps_cafe_loc;
	}
	
	public MPCafePassVo(int mps_pay_no, int mps_totalprice, String mps_pass_content, String mps_cafe_name,
			String mps_cafe_hrs, String mps_cafe_loc, String mps_cafe_phone) {
		super();
		this.mps_pay_no = mps_pay_no;
		this.mps_totalprice = mps_totalprice;
		this.mps_pass_content = mps_pass_content;
		this.mps_cafe_name = mps_cafe_name;
		this.mps_cafe_hrs = mps_cafe_hrs;
		this.mps_cafe_loc = mps_cafe_loc;
		this.mps_cafe_phone = mps_cafe_phone;
	}
	public MPCafePassVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "MPCafePassVo [mps_pay_no=" + mps_pay_no + ", mps_totalprice=" + mps_totalprice + ", mps_pass_content="
				+ mps_pass_content + ", mps_cafe_name=" + mps_cafe_name + ", mps_cafe_hrs=" + mps_cafe_hrs
				+ ", mps_cafe_loc=" + mps_cafe_loc + ", mps_cafe_phone=" + mps_cafe_phone + "]";
	}
	
	
	
	
}
