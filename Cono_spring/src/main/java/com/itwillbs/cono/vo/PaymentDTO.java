package com.itwillbs.cono.vo;

public class PaymentDTO {
	private String payment_idx;
	private String member_id;
	private String member_phone;
	private String payment_name;
	private String payment_amount;
	
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
	public String getPayment_name() {
		return payment_name;
	}
	public void setPayment_name(String payment_name) {
		this.payment_name = payment_name;
	}
	public String getPayment_amount() {
		return payment_amount;
	}
	public void setPayment_amount(String payment_amount) {
		this.payment_amount = payment_amount;
	}
	
	
}
