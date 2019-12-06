package com.bit.std_1st.vo;

public class FollowerVo {
	private String type;
	private int pick_no;
	private String pick_nick;
	private String pick_img;
	
	public FollowerVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FollowerVo(String type, int pick_no, String pick_nick, String pick_img) {
		super();
		this.type = type;
		this.pick_no = pick_no;
		this.pick_nick = pick_nick;
		this.pick_img = pick_img;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getPick_no() {
		return pick_no;
	}
	public void setPick_no(int pick_no) {
		this.pick_no = pick_no;
	}
	public String getPick_nick() {
		return pick_nick;
	}
	public void setPick_nick(String pick_nick) {
		this.pick_nick = pick_nick;
	}
	public String getPick_img() {
		return pick_img;
	}
	public void setPick_img(String pick_img) {
		this.pick_img = pick_img;
	}
}
