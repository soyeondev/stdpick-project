package com.bit.std_1st.vo;

public class ReviewVo {
	private int review_no;
	private String review_content;
	private int grade;
	private int cafe_no;
	private int cust_no;
	private String review_reply;
	private int review_img_no;
	private String review_img;
	private String cust_name;
	private String cust_img;
	
	
	public ReviewVo() {
		// TODO Auto-generated constructor stub
	}
	
	

	public ReviewVo(int review_no, String review_content, int grade, int cafe_no, int cust_no, String review_reply,
			int review_img_no, String review_img, String cust_name, String cust_img) {
		super();
		this.review_no = review_no;
		this.review_content = review_content;
		this.grade = grade;
		this.cafe_no = cafe_no;
		this.cust_no = cust_no;
		this.review_reply = review_reply;
		this.review_img_no = review_img_no;
		this.review_img = review_img;
		this.cust_name = cust_name;
		this.cust_img = cust_img;
	}



	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getCafe_no() {
		return cafe_no;
	}

	public void setCafe_no(int cafe_no) {
		this.cafe_no = cafe_no;
	}

	public int getCust_no() {
		return cust_no;
	}

	public void setCust_no(int cust_no) {
		this.cust_no = cust_no;
	}

	public String getReview_reply() {
		return review_reply;
	}

	public void setReview_reply(String review_reply) {
		this.review_reply = review_reply;
	}

	public int getReview_img_no() {
		return review_img_no;
	}

	public void setReview_img_no(int review_img_no) {
		this.review_img_no = review_img_no;
	}

	public String getReview_img() {
		return review_img;
	}

	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}

	public String getCust_name() {
		return cust_name;
	}

	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}

	public String getCust_img() {
		return cust_img;
	}

	public void setCust_img(String cust_img) {
		this.cust_img = cust_img;
	}


	

}
