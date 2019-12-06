package com.bit.std_1st.vo;

public class ProvAllSaleVo {
	private String pay_no;
	private String cafe_name;
	private String product;
	private int totalprice;
	private String id;
	
	public ProvAllSaleVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProvAllSaleVo(String pay_no, String cafe_name, String product, int totalprice, String id) {
		super();
		this.pay_no = pay_no;
		this.cafe_name = cafe_name;
		this.product = product;
		this.totalprice = totalprice;
		this.id = id;
	}
	public String getPay_no() {
		return pay_no;
	}
	public void setPay_no(String pay_no) {
		this.pay_no = pay_no;
	}
	public String getCafe_name() {
		return cafe_name;
	}
	public void setCafe_name(String cafe_name) {
		this.cafe_name = cafe_name;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	

}
