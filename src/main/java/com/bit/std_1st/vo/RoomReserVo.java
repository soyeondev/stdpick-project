package com.bit.std_1st.vo;


public class RoomReserVo {
	private int reser_no;
	private int room_no;
	private String reser_date;
	private int reser_start;
	private int reser_time;
	private int user_num;
	private String pay_no;
	private String room_name;
	private String id;
	
	public RoomReserVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public RoomReserVo(int reser_no, int room_no, String reser_date, int reser_start, int reser_time, int user_num,
			String pay_no, String room_name, String id) {
		super();
		this.reser_no = reser_no;
		this.room_no = room_no;
		this.reser_date = reser_date;
		this.reser_start = reser_start;
		this.reser_time = reser_time;
		this.user_num = user_num;
		this.pay_no = pay_no;
		this.room_name = room_name;
		this.id = id;
	}

	public int getReser_no() {
		return reser_no;
	}

	public void setReser_no(int reser_no) {
		this.reser_no = reser_no;
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}

	public String getReser_date() {
		return reser_date;
	}

	public void setReser_date(String reser_date) {
		this.reser_date = reser_date;
	}

	public int getReser_start() {
		return reser_start;
	}

	public void setReser_start(int reser_start) {
		this.reser_start = reser_start;
	}

	public int getReser_time() {
		return reser_time;
	}

	public void setReser_time(int reser_time) {
		this.reser_time = reser_time;
	}

	public int getUser_num() {
		return user_num;
	}

	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}

	public String getPay_no() {
		return pay_no;
	}

	public void setPay_no(String pay_no) {
		this.pay_no = pay_no;
	}

	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "RoomReserVo [reser_no=" + reser_no + ", room_no=" + room_no + ", reser_date=" + reser_date
				+ ", reser_start=" + reser_start + ", reser_time=" + reser_time + ", user_num=" + user_num + ", pay_no="
				+ pay_no + ", room_name=" + room_name + "]";
	}

	
	
}
