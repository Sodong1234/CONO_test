package com.itwillbs.cono.vo;

public class PaymentDTO {
	private String payment_idx;
	private String member_id;
	private String member_phone;
	private String payment_value;
	private String payment_date;
	
	public String getPayment_idx() {
		return payment_idx;
	}
	public void setPayment_idx(String payment_idx) {
		this.payment_idx = payment_idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getPayment_value() {
		return payment_value;
	}
	public void setPayment_value(String payment_value) {
		this.payment_value = payment_value;
	}
	public String getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}
	

	
	
}
