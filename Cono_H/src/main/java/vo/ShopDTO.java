package vo;

public class ShopDTO {
//	 shop_idx     
//	 | member_id    | varchar(20)  | NO   | PRI | NULL    |       |
//	 | shop_name    | varchar(20)  | YES  |     | NULL    |       |
//	 | shop_img     | varchar(100) | YES  |     | NULL    |       |
//	 | shop_content | varchar(50)  | YES  |     | NULL    |       |
//	 | shop_level
	private String shop_idx;
	private String member_id;
	private String shop_name;
	private String shop_img;
	private String shop_content;
	private String shop_level;
	
	public String getShop_idx() {
		return shop_idx;
	}
	public void setShop_idx(String shop_idx) {
		this.shop_idx = shop_idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getShop_name() {
		return shop_name;
	}
	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}
	public String getShop_img() {
		return shop_img;
	}
	public void setShop_img(String shop_img) {
		this.shop_img = shop_img;
	}
	public String getShop_content() {
		return shop_content;
	}
	public void setShop_content(String shop_content) {
		this.shop_content = shop_content;
	}
	public String getShop_level() {
		return shop_level;
	}
	public void setShop_level(String shop_level) {
		this.shop_level = shop_level;
	}
	
	

}
