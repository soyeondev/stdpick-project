package com.bit.std_1st.vo;

public class SNSImgVo {
	private int sns_img_no;
	private String sns_img_name;
	private int sns_no;
	public SNSImgVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SNSImgVo(int sns_img_no, String sns_img_name, int sns_no) {
		super();
		this.sns_img_no = sns_img_no;
		this.sns_img_name = sns_img_name;
		this.sns_no = sns_no;
	}
	public int getSns_img_no() {
		return sns_img_no;
	}
	public void setSns_img_no(int sns_img_no) {
		this.sns_img_no = sns_img_no;
	}
	public String getSns_img_name() {
		return sns_img_name;
	}
	public void setSns_img_name(String sns_img_name) {
		this.sns_img_name = sns_img_name;
	}
	public int getSns_no() {
		return sns_no;
	}
	public void setSns_no(int sns_no) {
		this.sns_no = sns_no;
	}
	
	

}
