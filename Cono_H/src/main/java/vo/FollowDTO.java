package vo;

public class FollowDTO {
//	CREATE TABLE follow (
//			member_id varchar(20),
//			shop_idx varchar(20),
//			PRIMARY KEY (member_id, shop_idx)
//		);
	
	private String member_id;
	private String shop_idx;
	
	
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


	
}
