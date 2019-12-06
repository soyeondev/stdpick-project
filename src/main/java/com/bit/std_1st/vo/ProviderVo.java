package com.bit.std_1st.vo;

import org.springframework.web.multipart.MultipartFile;

public class ProviderVo {

	private int provider_no;
	private String pro_name;
	private String pro_nick;
	private String pro_img;
	private MultipartFile upload1;
	private String phone;
	private String addr;
	private String email;
	private String id;
	private String pwd;
	private String pro_info;
	
	public ProviderVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProviderVo(int provider_no, String pro_name, String pro_nick, String pro_img, MultipartFile upload1,
			String phone, String addr, String email, String id, String pwd, String pro_info) {
		super();
		this.provider_no = provider_no;
		this.pro_name = pro_name;
		this.pro_nick = pro_nick;
		this.pro_img = pro_img;
		this.upload1 = upload1;
		this.phone = phone;
		this.addr = addr;
		this.email = email;
		this.id = id;
		this.pwd = pwd;
		this.pro_info = pro_info;
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

	public String getPro_nick() {
		return pro_nick;
	}

	public void setPro_nick(String pro_nick) {
		this.pro_nick = pro_nick;
	}

	public String getPro_img() {
		return pro_img;
	}

	public void setPro_img(String pro_img) {
		this.pro_img = pro_img;
	}

	public MultipartFile getUpload1() {
		return upload1;
	}

	public void setUpload1(MultipartFile upload1) {
		this.upload1 = upload1;
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

	public String getPro_info() {
		return pro_info;
	}

	public void setPro_info(String pro_info) {
		this.pro_info = pro_info;
	}

	@Override
	public String toString() {
		return "ProviderVo [provider_no=" + provider_no + ", pro_name=" + pro_name + ", pro_nick=" + pro_nick
				+ ", pro_img=" + pro_img + ", upload1=" + upload1 + ", phone=" + phone + ", addr=" + addr + ", email="
				+ email + ", id=" + id + ", pwd=" + pwd + ", pro_info=" + pro_info + "]";
	}

	
	
	
}
