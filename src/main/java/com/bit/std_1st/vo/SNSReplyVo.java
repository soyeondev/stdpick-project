package com.bit.std_1st.vo;

public class SNSReplyVo {
	int reply_no;
	String reply_content;
	int cust_no;
	int sns_no;
	int provider_no;
	String reply_write_date;
	public SNSReplyVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SNSReplyVo(int reply_no, String reply_content, int cust_no, int sns_no, int provider_no,
			String reply_write_date) {
		super();
		this.reply_no = reply_no;
		this.reply_content = reply_content;
		this.cust_no = cust_no;
		this.sns_no = sns_no;
		this.provider_no = provider_no;
		this.reply_write_date = reply_write_date;
	}
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public int getCust_no() {
		return cust_no;
	}
	public void setCust_no(int cust_no) {
		this.cust_no = cust_no;
	}
	public int getSns_no() {
		return sns_no;
	}
	public void setSns_no(int sns_no) {
		this.sns_no = sns_no;
	}
	public int getProvider_no() {
		return provider_no;
	}
	public void setProvider_no(int provider_no) {
		this.provider_no = provider_no;
	}
	public String getReply_write_date() {
		return reply_write_date;
	}
	public void setReply_write_date(String reply_write_date) {
		this.reply_write_date = reply_write_date;
	}
	

}
