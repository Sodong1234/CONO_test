package com.itwillbs.cono.vo;

public class OrdDTO {
	
	private String item_idx;
	private String member_id;
	private String order_date;
	private String order_reqContent;
	private String order_quantity;
	
	public String getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(String item_idx) {
		this.item_idx = item_idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public String getOrder_reqContent() {
		return order_reqContent;
	}
	public void setOrder_reqContent(String order_reqContent) {
		this.order_reqContent = order_reqContent;
	}
	public String getOrder_quantity() {
		return order_quantity;
	}
	public void setOrder_quantity(String order_quantity) {
		this.order_quantity = order_quantity;
	}
	
	@Override
	public String toString() {
		return "OrdDTO [item_idx=" + item_idx + ", member_id=" + member_id + ", order_date=" + order_date
				+ ", order_reqContent=" + order_reqContent + ", order_quantity=" + order_quantity + "]";
	}
	
	
}
