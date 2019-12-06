package com.bit.std_1st.vo;

public class QaVo {
	int qa_no;
	String qa_title;
	String qa_content;
	String qa_write_date;
	int b_ref;
	int b_level;
	int b_step;
	int cust_no;
	int man_no;
	String cust_name;
	int provider_no;
	String pro_name;
	int isanswer;
	public QaVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QaVo(int qa_no, String qa_title, String qa_content, String qa_write_date, int b_ref, int b_level, int b_step,
			int cust_no, int man_no, String cust_name, int provider_no, String pro_name, int isanswer) {
		super();
		this.qa_no = qa_no;
		this.qa_title = qa_title;
		this.qa_content = qa_content;
		this.qa_write_date = qa_write_date;
		this.b_ref = b_ref;
		this.b_level = b_level;
		this.b_step = b_step;
		this.cust_no = cust_no;
		this.man_no = man_no;
		this.cust_name = cust_name;
		this.provider_no = provider_no;
		this.pro_name = pro_name;
		this.isanswer = isanswer;
	}
	public int getQa_no() {
		return qa_no;
	}
	public void setQa_no(int qa_no) {
		this.qa_no = qa_no;
	}
	public String getQa_title() {
		return qa_title;
	}
	public void setQa_title(String qa_title) {
		this.qa_title = qa_title;
	}
	public String getQa_content() {
		return qa_content;
	}
	public void setQa_content(String qa_content) {
		this.qa_content = qa_content;
	}
	public String getQa_write_date() {
		return qa_write_date;
	}
	public void setQa_write_date(String qa_write_date) {
		this.qa_write_date = qa_write_date;
	}
	public int getB_ref() {
		return b_ref;
	}
	public void setB_ref(int b_ref) {
		this.b_ref = b_ref;
	}
	public int getB_level() {
		return b_level;
	}
	public void setB_level(int b_level) {
		this.b_level = b_level;
	}
	public int getB_step() {
		return b_step;
	}
	public void setB_step(int b_step) {
		this.b_step = b_step;
	}
	public int getCust_no() {
		return cust_no;
	}
	public void setCust_no(int cust_no) {
		this.cust_no = cust_no;
	}
	public int getMan_no() {
		return man_no;
	}
	public void setMan_no(int man_no) {
		this.man_no = man_no;
	}
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}
	public int getProvider_no() {
		return provider_no;
	}
	public void setProvider_no(int provider_no) {
		this.provider_no = provider_no;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public int getIsanswer() {
		return isanswer;
	}
	public void setIsanswer(int isanswer) {
		this.isanswer = isanswer;
	}
	
	
}
