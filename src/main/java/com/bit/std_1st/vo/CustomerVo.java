package com.bit.std_1st.vo;

import org.springframework.web.multipart.MultipartFile;

public class CustomerVo {
	private int cust_no;
	private String cust_name;
	private String cust_nick;
	private MultipartFile upload;
	private String cust_img;
	private String phone;
	private String addr;
	private String email;
	private String id;
	private String pwd;
	private String cust_info;
	
	
	@Override
	public String toString() {
		return "CustomerVo [cust_no=" + cust_no + ", cust_name=" + cust_name + ", cust_nick=" + cust_nick + ", upload="
				+ upload + ", cust_img=" + cust_img + ", phone=" + phone + ", addr=" + addr + ", email=" + email
				+ ", id=" + id + ", pwd=" + pwd + ", cust_info=" + cust_info + "]";
	}

	public CustomerVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CustomerVo(int cust_no, String cust_name, String cust_nick, MultipartFile upload, String cust_img, String phone, String addr,
			String email, String id, String pwd, String cust_info) {
		super();
		this.cust_no = cust_no;
		this.cust_name = cust_name;
		this.cust_nick = cust_nick;
		this.upload = upload;
		this.cust_img = cust_img;
		this.phone = phone;
		this.addr = addr;
		this.email = email;
		this.id = id;
		this.pwd = pwd;
		this.cust_info = cust_info;
	}
	

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
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


}
