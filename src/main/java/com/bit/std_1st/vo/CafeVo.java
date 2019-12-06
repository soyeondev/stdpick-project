package com.bit.std_1st.vo;

public class CafeVo {
	private int cafe_no;
	private String license_num;
	private String main_img;
	private String cafe_name;
	private String cafe_info;
	private String cafe_loc;
	private String cafe_phone;
	private String cafe_hrs;
	private String cafe_notice;
	private String cafe_policy;
	private String seats;
	private String provider_no;
	private String room_price;
	private String pass_price;
	private String cafe_facil;
	private String cafe_info_detail;

	
	@Override
	public String toString() {
		return "CafeVo [cafe_no=" + cafe_no + ", license_num=" + license_num + ", main_img=" + main_img + ", cafe_name="
				+ cafe_name + ", cafe_info=" + cafe_info + ", cafe_loc=" + cafe_loc + ", cafe_phone=" + cafe_phone
				+ ", cafe_hrs=" + cafe_hrs + ", cafe_notice=" + cafe_notice + ", cafe_policy=" + cafe_policy
				+ ", seats=" + seats + ", provider_no=" + provider_no + ", room_price=" + room_price + ", pass_price="
				+ pass_price + ", cafe_facil=" + cafe_facil + ", cafe_info_detail=" + cafe_info_detail + "]";
	}

	public CafeVo() {
		// TODO Auto-generated constructor stub
	}

	public CafeVo(int cafe_no, String license_num, String main_img, String cafe_name, String cafe_info, String cafe_loc,
			String cafe_phone, String cafe_hrs, String cafe_notice, String cafe_policy, String seats,
			String provider_no, String room_price, String pass_price, String cafe_facil, String cafe_info_detail) {
		super();
		this.cafe_no = cafe_no;
		this.license_num = license_num;
		this.main_img = main_img;
		this.cafe_name = cafe_name;
		this.cafe_info = cafe_info;
		this.cafe_loc = cafe_loc;
		this.cafe_phone = cafe_phone;
		this.cafe_hrs = cafe_hrs;
		this.cafe_notice = cafe_notice;
		this.cafe_policy = cafe_policy;
		this.seats = seats;
		this.provider_no = provider_no;
		this.room_price = room_price;
		this.pass_price = pass_price;
		this.cafe_facil = cafe_facil;
		this.cafe_info_detail = cafe_info_detail;
	}

	public int getCafe_no() {
		return cafe_no;
	}

	public void setCafe_no(int cafe_no) {
		this.cafe_no = cafe_no;
	}

	public String getLicense_num() {
		return license_num;
	}

	public void setLicense_num(String license_num) {
		this.license_num = license_num;
	}

	public String getMain_img() {
		return main_img;
	}

	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}

	public String getCafe_name() {
		return cafe_name;
	}

	public void setCafe_name(String cafe_name) {
		this.cafe_name = cafe_name;
	}

	public String getCafe_info() {
		return cafe_info;
	}

	public void setCafe_info(String cafe_info) {
		this.cafe_info = cafe_info;
	}

	public String getCafe_loc() {
		return cafe_loc;
	}

	public void setCafe_loc(String cafe_loc) {
		this.cafe_loc = cafe_loc;
	}

	public String getCafe_phone() {
		return cafe_phone;
	}

	public void setCafe_phone(String cafe_phone) {
		this.cafe_phone = cafe_phone;
	}

	public String getCafe_hrs() {
		return cafe_hrs;
	}

	public void setCafe_hrs(String cafe_hrs) {
		this.cafe_hrs = cafe_hrs;
	}

	public String getCafe_notice() {
		return cafe_notice;
	}

	public void setCafe_notice(String cafe_notice) {
		this.cafe_notice = cafe_notice;
	}

	public String getCafe_policy() {
		return cafe_policy;
	}

	public void setCafe_policy(String cafe_policy) {
		this.cafe_policy = cafe_policy;
	}

	public String getSeats() {
		return seats;
	}

	public void setSeats(String seats) {
		this.seats = seats;
	}

	public String getProvider_no() {
		return provider_no;
	}

	public void setProvider_no(String provider_no) {
		this.provider_no = provider_no;
	}

	public String getRoom_price() {
		return room_price;
	}

	public void setRoom_price(String room_price) {
		this.room_price = room_price;
	}

	public String getPass_price() {
		return pass_price;
	}

	public void setPass_price(String pass_price) {
		this.pass_price = pass_price;
	}

	public String getCafe_facil() {
		return cafe_facil;
	}

	public void setCafe_facil(String cafe_facil) {
		this.cafe_facil = cafe_facil;
	}

	public String getCafe_info_detail() {
		return cafe_info_detail;
	}

	public void setCafe_info_detail(String cafe_info_detail) {
		this.cafe_info_detail = cafe_info_detail;
	}
	
	
	
	
}
