package com.bit.std_1st.vo;

public class LoginVo {
    private String id;
    private String nick_name;
    private String role;
    private String cust_img;
    private int no;
    

    @Override
	public String toString() {
		return "LoginVo [id=" + id + ", nick_name=" + nick_name + ", role=" + role + ", cust_img=" + cust_img + ", no="
				+ no + "]";
	}
	public LoginVo() {
    }
	public LoginVo(String id, String nick_name, String role, int no,String cust_img) {
		super();
		this.id = id;
		this.nick_name = nick_name;
		this.role = role;
		this.no = no;
		this.cust_img=cust_img;
	}
	
	

	public String getCust_img() {
		return cust_img;
	}
	public void setCust_img(String cust_img) {
		this.cust_img = cust_img;
	}
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNick_name() {
		return nick_name;
	}

	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	/*
	 * public LoginVo(String id, String nick_name, String role) { this.id = id;
	 * this.nick_name = nick_name; this.role = role; }
	 * 
	 * public String getId() { return id; }
	 * 
	 * public void setId(String id) { this.id = id; }
	 * 
	 * public String getNick_name() { return nick_name; }
	 * 
	 * public void setNick_name(String nick_name) { this.nick_name = nick_name; }
	 * 
	 * public String getRole() { return role; }
	 * 
	 * public void setRole(String role) { this.role = role; }
	 */
}
