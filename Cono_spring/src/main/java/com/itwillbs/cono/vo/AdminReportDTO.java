package com.itwillbs.cono.vo;

public class AdminReportDTO {
/*
CREATE TABLE report (
   report_idx varchar(20),
   member_id varchar(20),
   item_idx varchar(20),
   report_type varchar(20) NOT NULL,
   report_subject varchar(50) NOT NULL,
   report_content varchar(500) NOT NULL,
   report_date varchar(20) NOT NULL,
   report_status varchar(5),
   report_secret varchar(2),
   primary key(report_idx, member_id, item_idx)
);
 */
	
	private String report_idx;
	private String member_id;
	private String item_idx;
	private String report_type;
	private String report_subject;
	private String report_content;
	private String report_date;
	private String report_status;
	private String report_secret;
	
	
	public String getReport_idx() {
		return report_idx;
	}
	public void setReport_idx(String report_idx) {
		this.report_idx = report_idx;
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
	public String getReport_type() {
		return report_type;
	}
	public void setReport_type(String report_type) {
		this.report_type = report_type;
	}
	public String getReport_subject() {
		return report_subject;
	}
	public void setReport_subject(String report_subject) {
		this.report_subject = report_subject;
	}
	public String getReport_content() {
		return report_content;
	}
	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}
	public String getReport_date() {
		return report_date;
	}
	public void setReport_date(String report_date) {
		this.report_date = report_date;
	}
	public String getReport_status() {
		return report_status;
	}
	public void setReport_status(String report_status) {
		this.report_status = report_status;
	}
	public String getReport_secret() {
		return report_secret;
	}
	public void setReport_secret(String report_secret) {
		this.report_secret = report_secret;
	}
	@Override
	public String toString() {
		return "AdminReportDTO [report_idx=" + report_idx + ", member_id=" + member_id + ", item_idx=" + item_idx
				+ ", report_type=" + report_type + ", report_subject=" + report_subject + ", report_content="
				+ report_content + ", report_date=" + report_date + ", report_status=" + report_status
				+ ", report_secret=" + report_secret + "]";
	}
	
	
}
