package com.itwillbs.cono.vo;

import java.sql.Date;

public class MessageDTO {
	/*
		create table message(
		  no int auto_increment primary key,
		  room int not null,
		  member_id varchar(20),
		  shop_idx varchar(20),
		  send_nick varchar(20) not null,
		  recv_nick varchar(20) not null,
		  send_time datetime not null,
		  read_time datetime not null,
		  content varchar(1000) not null,
		  read_chk int not null
		);
	*/
	/*
	  create table message(
	  message_idx VARCHAR(20),
	  room VARCHAR(20),
	  member_id varchar(20),
	  shop_idx varchar(20),
	  send_nick varchar(20) not null,
	  recv_nick varchar(20) not null,
	  send_time VARCHAR(20) not null,
	  read_time VARCHAR(20) not null,
	  content varchar(1000) not null,
	  read_chk VARCHAR(2)
	  );
	 */
	
	private String no; 
	private int room;
	private String send_nick;
	private String recv_nick;
	private String send_time;
	private String read_time;
	private String content;
	private String read_chk;
	
	private String member_id;
	private String shop_idx;
	
	// 현재 사용자의 메세지 상대 profile을 담는다.
	private String profile;
	
	// 안읽은 메세지 갯수 
	private int unread;

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public int getRoom() {
		return room;
	}

	public void setRoom(int room) {
		this.room = room;
	}

	public String getSend_nick() {
		return send_nick;
	}

	public void setSend_nick(String send_nick) {
		this.send_nick = send_nick;
	}

	public String getRecv_nick() {
		return recv_nick;
	}

	public void setRecv_nick(String recv_nick) {
		this.recv_nick = recv_nick;
	}

	public String getSend_time() {
		return send_time;
	}

	public void setSend_time(String send_time) {
		this.send_time = send_time;
	}

	public String getRead_time() {
		return read_time;
	}

	public void setRead_time(String read_time) {
		this.read_time = read_time;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRead_chk() {
		return read_chk;
	}

	public void setRead_chk(String read_chk) {
		this.read_chk = read_chk;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getShop_idx() {
		return shop_idx;
	}

	public void setShop_idx(String shop_idx) {
		this.shop_idx = shop_idx;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public int getUnread() {
		return unread;
	}

	public void setUnread(int unread) {
		this.unread = unread;
	}


	
	
	
	
}