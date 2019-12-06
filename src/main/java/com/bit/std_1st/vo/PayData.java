package com.bit.std_1st.vo;

public class PayData {
	private String room_name;
	private String start_time;
	private String end_time;
	private String time_price;
	private String pass_content;
	private int price;
	
	public PayData(String room_name, String start_time, String end_time, String time_price, String pass_content,
			int price) {
		super();
		this.room_name = room_name;
		this.start_time = start_time;
		this.end_time = end_time;
		this.time_price = time_price;
		this.pass_content = pass_content;
		this.price = price;
	}

	public PayData() {
		// TODO Auto-generated constructor stub
	}

	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

	public String getTime_price() {
		return time_price;
	}

	public void setTime_price(String time_price) {
		this.time_price = time_price;
	}

	public String getPass_content() {
		return pass_content;
	}

	public void setPass_content(String pass_content) {
		this.pass_content = pass_content;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	
	

	

}
