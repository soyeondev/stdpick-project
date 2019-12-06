package com.bit.std_1st.vo;

import java.util.Date;

public class SNSVo {
	private int sns_no;
	private String sns_content;
	private String sns_write_date;
	private int cust_no;
	private int provider_no;
	private int sns_img_no;
	private String sns_img_name;
	private int tag_no;
	private String tag_name;
	public SNSVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SNSVo(int sns_no, String sns_content, String sns_write_date, int cust_no, int provider_no,
			int sns_img_no, String sns_img_name, int tag_no, String tag_name) {
		super();
		this.sns_no = sns_no;
		this.sns_content = sns_content;
		this.sns_write_date = sns_write_date;
		this.cust_no = cust_no;
		this.provider_no = provider_no;
		this.sns_img_no = sns_img_no;
		this.sns_img_name = sns_img_name;
		this.tag_no = tag_no;
		this.tag_name = tag_name;
	}
	public int getSns_no() {
		return sns_no;
	}
	public void setSns_no(int sns_no) {
		this.sns_no = sns_no;
	}
	public String getSns_content() {
		return sns_content;
	}
	public void setSns_content(String sns_content) {
		this.sns_content = sns_content;
	}
	
	public String getSns_write_date() {
		return sns_write_date;
	}
	public void setSns_write_date(String sns_write_date) {
		this.sns_write_date = sns_write_date;
	}
	public int getCust_no() {
		return cust_no;
	}
	public void setCust_no(int cust_no) {
		this.cust_no = cust_no;
	}
	public int getProvider_no() {
		return provider_no;
	}
	public void setProvider_no(int provider_no) {
		this.provider_no = provider_no;
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
	
	
	
}
