package com.bit.std_1st.vo;

public class CustomerApplyVo {
	private int cust_no;
	private String cust_name;
	private String cust_nick;
	private String cust_img;
	private String phone;
	private String addr;
	private String email;
	private String id;
	private String pwd;
	private String cust_info;
	private int apply_no;
	private String apply_content;
	private String std_aprv;
	private int std_no;
	
	public CustomerApplyVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CustomerApplyVo(int cust_no, String cust_name, String cust_nick, String cust_img, String phone, String addr,
			String email, String id, String pwd, String cust_info, int apply_no, String apply_content, String std_aprv,
			int std_no) {
		super();
		this.cust_no = cust_no;
		this.cust_name = cust_name;
		this.cust_nick = cust_nick;
		this.cust_img = cust_img;
		this.phone = phone;
		this.addr = addr;
		this.email = email;
		this.id = id;
		this.pwd = pwd;
		this.cust_info = cust_info;
		this.apply_no = apply_no;
		this.apply_content = apply_content;
		this.std_aprv = std_aprv;
		this.std_no = std_no;
	}

	public int getCust_no() {
		return cust_no;
	}

	public void setCust_no(int cust_no) {
		this.cust_no = cust_no;
	}

	public String getCust_name() {
		return cust_name;
	}

	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getCust_info() {
		return cust_info;
	}

	public void setCust_info(String cust_info) {
		this.cust_info = cust_info;
	}

	public int getApply_no() {
		return apply_no;
	}

	public void setApply_no(int apply_no) {
		this.apply_no = apply_no;
	}

	public String getApply_content() {
		return apply_content;
	}

	public void setApply_content(String apply_content) {
		this.apply_content = apply_content;
	}

	public String getStd_aprv() {
		return std_aprv;
	}

	public void setStd_aprv(String std_aprv) {
		this.std_aprv = std_aprv;
	}

	public int getStd_no() {
		return std_no;
	}

	public void setStd_no(int std_no) {
		this.std_no = std_no;
	}


	
}
