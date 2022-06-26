package com.itwillbs.cono.vo;

public class CancelDTO {
//	CREATE TABLE cancel (
//			cancel_idx VARCHAR(20),
//			item_idx VARCHAR(20),
//			member_idx VARCHAR(20),
//			cancel_content VARCHAR(1000),
//			cancel_date VARCHAR(20),
//			cancel_status VARCHAR(3),
//			PRIMARY KEY (cancel_idx,item_idx,member_idx)
//		);
	
	private String cancel_idx;
	private String item_idx;
	private String member_id;
	private String ord_idx;
	private String cancel_content;
	private String cancel_date;
	private String cancel_status;
	
	
	
	public String getOrd_idx() {
		return ord_idx;
	}
	public void setOrd_idx(String ord_idx) {
		this.ord_idx = ord_idx;
	}
	public String getCancel_idx() {
		return cancel_idx;
	}
	public void setCancel_idx(String cancel_idx) {
		this.cancel_idx = cancel_idx;
	}
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
	public String getCancel_content() {
		return cancel_content;
	}
	public void setCancel_content(String cancel_content) {
		this.cancel_content = cancel_content;
	}
	public String getCancel_date() {
		return cancel_date;
	}
	public void setCancel_date(String cancel_date) {
		this.cancel_date = cancel_date;
	}
	public String getCancel_status() {
		return cancel_status;
	}
	public void setCancel_status(String cancel_status) {
		this.cancel_status = cancel_status;
	}
	
	
	
}
