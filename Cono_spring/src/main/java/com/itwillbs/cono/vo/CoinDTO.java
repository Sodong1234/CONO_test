package com.itwillbs.cono.vo;

public class CoinDTO {
	//		CREATE TABLE coin (
	//		coin_idx VARCHAR(50),
	//		member_id VARCHAR(20),
	//	    coin_add VARCHAR(50),
	//	    coin_use VARCHAR(50),
	//	    coin_total VARCHAR(50),
	//	    PRIMARY KEY(coin_idx, member_id)
	//	);

	private String coin_idx;
	private String member_id;
	private String coin_add;
	private String coin_use;
	private String coin_total;
	private String coin_date;
	
	public String getCoin_date() {
		return coin_date;
	}
	public void setCoin_date(String coin_date) {
		this.coin_date = coin_date;
	}
	public String getCoin_idx() {
		return coin_idx;
	}
	public void setCoin_idx(String coin_idx) {
		this.coin_idx = coin_idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getCoin_add() {
		return coin_add;
	}
	public void setCoin_add(String coin_add) {
		this.coin_add = coin_add;
	}
	public String getCoin_use() {
		return coin_use;
	}
	public void setCoin_use(String coin_use) {
		this.coin_use = coin_use;
	}
	public String getCoin_total() {
		return coin_total;
	}
	public void setCoin_total(String coin_total) {
		this.coin_total = coin_total;
	}
	
	
}
