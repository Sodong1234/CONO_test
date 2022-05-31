package com.itwillbs.cono.vo;


/*
CREATE TABLE notice (
	notice_idx varchar(20),
	admin_id varchar(20),
	notice_subject varchar(50),
	notice_content varchar(500),
	notice_date varchar(8)
);

  
*/
public class AdminNoticeDTO {

	private String notice_idx;
	private String admin_id;
	private String notice_subject;
	private String notice_content;
	private String notice_date;	// java.sql.Date
	public String getNotice_idx() {
		return notice_idx;
	}
	public void setNotice_idx(String notice_idx) {
		this.notice_idx = notice_idx;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getNotice_subject() {
		return notice_subject;
	}
	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}
	@Override
	public String toString() {
		return "AdminNoticeBean [notice_idx=" + notice_idx + ", admin_id=" + admin_id + ", notice_subject="
				+ notice_subject + ", notice_content=" + notice_content + ", notice_date=" + notice_date + "]";
	}
	
	
}
