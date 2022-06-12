package com.itwillbs.cono.vo;


/*
CREATE TABLE qna (
	qna_idx varchar(20),
	member_id varchar(20),
	qna_type varchar(20),
	qna_subject varchar(50),
	qna_content varchar(500),
	qna_re_ref INT,
	qna_re_lev INT,
	qna_re_seq INT,
	qna_date varchar(8),
	qna_status varchar(20)
);

*/
public class AdminQNADTO {

	
	private String qna_idx;
	private String member_id;
	private String qna_type;
	private String qna_subject;
	private String qna_content;
	private int qna_re_ref;
	private int qna_re_lev;
	private int qna_re_seq;
	private String qna_date;
	private String qna_status;
	private int num;
	
	public String getQna_idx() {
		return qna_idx;
	}
	public void setQna_idx(String qna_idx) {
		this.qna_idx = qna_idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getQna_type() {
		return qna_type;
	}
	public void setQna_type(String qna_type) {
		this.qna_type = qna_type;
	}
	public String getQna_subject() {
		return qna_subject;
	}
	public void setQna_subject(String qna_subject) {
		this.qna_subject = qna_subject;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public int getQna_re_ref() {
		return qna_re_ref;
	}
	public void setQna_re_ref(int qna_re_ref) {
		this.qna_re_ref = qna_re_ref;
	}
	public int getQna_re_lev() {
		return qna_re_lev;
	}
	public void setQna_re_lev(int qna_re_lev) {
		this.qna_re_lev = qna_re_lev;
	}
	public int getQna_re_seq() {
		return qna_re_seq;
	}
	public void setQna_re_seq(int qna_re_seq) {
		this.qna_re_seq = qna_re_seq;
	}
	public String getQna_date() {
		return qna_date;
	}
	public void setQna_date(String qna_date) {
		this.qna_date = qna_date;
	}
	public String getQna_status() {
		return qna_status;
	}
	public void setQna_status(String qna_status) {
		this.qna_status = qna_status;
	}
	@Override
	public String toString() {
		return "AdminQNADTO [qna_idx=" + qna_idx + ", member_id=" + member_id + ", qna_type=" + qna_type
				+ ", qna_subject=" + qna_subject + ", qna_content=" + qna_content + ", qna_re_ref=" + qna_re_ref
				+ ", qna_re_lev=" + qna_re_lev + ", qna_re_seq=" + qna_re_seq + ", qna_date=" + qna_date
				+ ", qna_status=" + qna_status + "]";
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	
	
}
