package com.bit.std_1st.vo;

public class SNSLikeVo {
	int like_no;
	int sns_no;
	int cust_no;
	int provider_no;
	public SNSLikeVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SNSLikeVo(int like_no, int sns_no, int cust_no, int provider_no) {
		super();
		this.like_no = like_no;
		this.sns_no = sns_no;
		this.cust_no = cust_no;
		this.provider_no = provider_no;
	}
	public int getLike_no() {
		return like_no;
	}
	public void setLike_no(int like_no) {
		this.like_no = like_no;
	}
	public int getSns_no() {
		return sns_no;
	}
	public void setSns_no(int sns_no) {
		this.sns_no = sns_no;
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
	
	
}
