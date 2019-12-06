package com.bit.std_1st.vo;

public class FollowVo {
	private int follow_no;
	private String type;
	private int no;
	private String f_type;
	private int f_no;
	
	public FollowVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FollowVo(int follow_no, String type, int no, String f_type, int f_no) {
		super();
		this.follow_no = follow_no;
		this.type = type;
		this.no = no;
		this.f_type = f_type;
		this.f_no = f_no;
	}
	public int getFollow_no() {
		return follow_no;
	}
	public void setFollow_no(int follow_no) {
		this.follow_no = follow_no;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getF_type() {
		return f_type;
	}
	public void setF_type(String f_type) {
		this.f_type = f_type;
	}
	public int getF_no() {
		return f_no;
	}
	public void setF_no(int f_no) {
		this.f_no = f_no;
	}
}
