package com.bit.std_1st.vo;

public class RoomVo {
	private int room_no;
	private String room_name;
	private int cafe_no;
	
	public RoomVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RoomVo(int room_no, String room_name, int cafe_no) {
		super();
		this.room_no = room_no;
		this.room_name = room_name;
		this.cafe_no = cafe_no;
	}
	public int getRoom_no() {
		return room_no;
	}
	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public int getCafe_no() {
		return cafe_no;
	}
	public void setCafe_no(int cafe_no) {
		this.cafe_no = cafe_no;
	}
	
	

}
