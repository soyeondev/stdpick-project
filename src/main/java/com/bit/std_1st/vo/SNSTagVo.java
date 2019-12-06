package com.bit.std_1st.vo;

public class SNSTagVo {
	private int tag_no;
	private String tag_name;
	private int sns_no;
	public SNSTagVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SNSTagVo(int tag_no, String tag_name, int sns_no) {
		super();
		this.tag_no = tag_no;
		this.tag_name = tag_name;
		this.sns_no = sns_no;
	}
	public int getTag_no() {
		return tag_no;
	}
	public void setTag_no(int tag_no) {
		this.tag_no = tag_no;
	}
	public String getTag_name() {
		return tag_name;
	}
	public void setTag_name(String tag_name) {
		this.tag_name = tag_name;
	}
	public int getSns_no() {
		return sns_no;
	}
	public void setSns_no(int sns_no) {
		this.sns_no = sns_no;
	}
}
