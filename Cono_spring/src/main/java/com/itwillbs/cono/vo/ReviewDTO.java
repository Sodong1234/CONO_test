package com.itwillbs.cono.vo;

public class ReviewDTO {
	private String review_idx;
	private String member_id;
	private String item_idx;
	private String review_content;
	private String review_date;
	private String review_score;
	
	
	public String getReview_score() {
		return review_score;
	}
	public void setReview_score(String review_score) {
		this.review_score = review_score;
	}
	public String getReview_idx() {
		return review_idx;
	}
	public void setReview_idx(String review_idx) {
		this.review_idx = review_idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(String item_idx) {
		this.item_idx = item_idx;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	
	
}
