package com.bit.std_1st.vo;

public class InqVo {
	private String cust_nick;
	private String cust_img;
	private int inq_no;
	private int cafe_no;
	private String inq_content;
	private String inq_reply;
	private String issecret;
	private int cust_no;
	
	
	@Override
	public String toString() {
		return "InqVo [cust_nick=" + cust_nick + ", cust_img=" + cust_img + ", inq_no=" + inq_no + ", cafe_no="
				+ cafe_no + ", inq_content=" + inq_content + ", inq_reply=" + inq_reply + ", issecret=" + issecret
				+ ", cust_no=" + cust_no + "]";
	}


	public InqVo() {
		// TODO Auto-generated constructor stub
	}


	public String getCust_nick() {
		return cust_nick;
	}


	public void setCust_nick(String cust_nick) {
		this.cust_nick = cust_nick;
	}


	public String getCust_img() {
		return cust_img;
	}


	public void setCust_img(String cust_img) {
		this.cust_img = cust_img;
	}


	public int getInq_no() {
		return inq_no;
	}


	public void setInq_no(int inq_no) {
		this.inq_no = inq_no;
	}


	public int getCafe_no() {
		return cafe_no;
	}


	public void setCafe_no(int cafe_no) {
		this.cafe_no = cafe_no;
	}


	public String getInq_content() {
		return inq_content;
	}


	public void setInq_content(String inq_content) {
		this.inq_content = inq_content;
	}


	public String getInq_reply() {
		return inq_reply;
	}


	public void setInq_reply(String inq_reply) {
		this.inq_reply = inq_reply;
	}


	public String getIssecret() {
		return issecret;
	}


	public void setIssecret(String issecret) {
		this.issecret = issecret;
	}


	public int getCust_no() {
		return cust_no;
	}


	public void setCust_no(int cust_no) {
		this.cust_no = cust_no;
	}


	public InqVo(String cust_nick, String cust_img, int inq_no, int cafe_no, String inq_content, String inq_reply,
			String issecret, int cust_no) {
		super();
		this.cust_nick = cust_nick;
		this.cust_img = cust_img;
		this.inq_no = inq_no;
		this.cafe_no = cafe_no;
		this.inq_content = inq_content;
		this.inq_reply = inq_reply;
		this.issecret = issecret;
		this.cust_no = cust_no;
	}

	

	
	
	
	

}
