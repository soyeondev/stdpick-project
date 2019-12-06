package com.bit.std_1st.vo;

public class MPCafeVo {
	
	private int mp_reser_no;
	private String mp_reser_date;
	private String mp_reser_start;
	private int mp_reser_time;
	private int mp_user_num;
	private String mp_room_name;
	private String mp_cafe_name;
	private String mp_cafe_loc;	
	
	public MPCafeVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getMp_reser_no() {
		return mp_reser_no;
	}

	public void setMp_reser_no(int mp_reser_no) {
		this.mp_reser_no = mp_reser_no;
	}

	public String getMp_reser_date() {
		return mp_reser_date;
	}

	public void setMp_reser_date(String mp_reser_date) {
		this.mp_reser_date = mp_reser_date;
	}

	public String getMp_reser_start() {
		return mp_reser_start;
	}

	public void setMp_reser_start(String mp_reser_start) {
		this.mp_reser_start = mp_reser_start;
	}

	public int getMp_reser_time() {
		return mp_reser_time;
	}

	public void setMp_reser_time(int mp_reser_time) {
		this.mp_reser_time = mp_reser_time;
	}

	public int getMp_user_num() {
		return mp_user_num;
	}

	public void setMp_user_num(int mp_user_num) {
		this.mp_user_num = mp_user_num;
	}

	public String getMp_room_name() {
		return mp_room_name;
	}

	public void setMp_room_name(String mp_room_name) {
		this.mp_room_name = mp_room_name;
	}

	public String getMp_cafe_name() {
		return mp_cafe_name;
	}

	public void setMp_cafe_name(String mp_cafe_name) {
		this.mp_cafe_name = mp_cafe_name;
	}

	public String getMp_cafe_loc() {
		return mp_cafe_loc;
	}

	public void setMp_cafe_loc(String mp_cafe_loc) {
		this.mp_cafe_loc = mp_cafe_loc;
	}

	public MPCafeVo(int mp_reser_no, String mp_reser_date, String mp_reser_start, int mp_reser_time, int mp_user_num,
			String mp_room_name, String mp_cafe_name, String mp_cafe_loc) {
		super();
		this.mp_reser_no = mp_reser_no;
		this.mp_reser_date = mp_reser_date;
		this.mp_reser_start = mp_reser_start;
		this.mp_reser_time = mp_reser_time;
		this.mp_user_num = mp_user_num;
		this.mp_room_name = mp_room_name;
		this.mp_cafe_name = mp_cafe_name;
		this.mp_cafe_loc = mp_cafe_loc;
	}
	
	

}
