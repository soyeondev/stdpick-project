package com.bit.std_1st.vo;

public class Cafe_chkboxVo {
	private int cafe_chkbox_no;
	private String cafe_chkbox_name;
	private int cafe_no;
	
	public Cafe_chkboxVo() {
		// TODO Auto-generated constructor stub
	}

	public int getCafe_chkbox_no() {
		return cafe_chkbox_no;
	}

	public void setCafe_chkbox_no(int cafe_chkbox_no) {
		this.cafe_chkbox_no = cafe_chkbox_no;
	}

	public String getCafe_chkbox_name() {
		return cafe_chkbox_name;
	}

	public void setCafe_chkbox_name(String cafe_chkbox_name) {
		this.cafe_chkbox_name = cafe_chkbox_name;
	}

	public int getCafe_no() {
		return cafe_no;
	}

	public void setCafe_no(int cafe_no) {
		this.cafe_no = cafe_no;
	}

	public Cafe_chkboxVo(int cafe_chkbox_no, String cafe_chkbox_name, int cafe_no) {
		super();
		this.cafe_chkbox_no = cafe_chkbox_no;
		this.cafe_chkbox_name = cafe_chkbox_name;
		this.cafe_no = cafe_no;
	}
	
	
}
