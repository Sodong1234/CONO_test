package vo;
/*
CREATE TABLE item (
   item_idx varchar(20),
   shop_idx varchar(20),
   item_title varchar(20),
   item_content varchar(2000),
   item_price varchar(20),
   item_date varchar(8),
   item_endDate varchar(8),
   item_status varchar(3),
   item_hide varchar(3),
   item_readCnt varchar(20),
   item_region varchar(40),
   item_quantity varchar(10),
   PRIMARY KEY (item_idx ,shop_idx) 
);
 */
public class ItemDTO {
	private String item_idx;
	private String shop_idx;
	private String item_title;
	private String item_content;
	private String item_price;
	private String item_date;
	private String item_endDate;
	private String item_status;
	private String item_hide;
	private String item_readCnt;
	private String item_region;
	private String item_quantity;
	
	public String getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(String item_idx) {
		this.item_idx = item_idx;
	}
	public String getShop_idx() {
		return shop_idx;
	}
	public void setShop_idx(String shop_idx) {
		this.shop_idx = shop_idx;
	}
	public String getItem_title() {
		return item_title;
	}
	public void setItem_title(String item_title) {
		this.item_title = item_title;
	}
	public String getItem_content() {
		return item_content;
	}
	public void setItem_content(String item_content) {
		this.item_content = item_content;
	}
	public String getItem_price() {
		return item_price;
	}
	public void setItem_price(String item_price) {
		this.item_price = item_price;
	}
	public String getItem_date() {
		return item_date;
	}
	public void setItem_date(String item_date) {
		this.item_date = item_date;
	}
	public String getItem_endDate() {
		return item_endDate;
	}
	public void setItem_endDate(String item_endDate) {
		this.item_endDate = item_endDate;
	}
	public String getItem_status() {
		return item_status;
	}
	public void setItem_status(String item_status) {
		this.item_status = item_status;
	}
	public String getItem_hide() {
		return item_hide;
	}
	public void setItem_hide(String item_hide) {
		this.item_hide = item_hide;
	}
	public String getItem_readCnt() {
		return item_readCnt;
	}
	public void setItem_readCnt(String item_readCnt) {
		this.item_readCnt = item_readCnt;
	}
	public String getItem_region() {
		return item_region;
	}
	public void setItem_region(String item_region) {
		this.item_region = item_region;
	}
	public String getItem_quantity() {
		return item_quantity;
	}
	public void setItem_quantity(String item_quantity) {
		this.item_quantity = item_quantity;
	}
	
	@Override
	public String toString() {
		return "ItemDTO [item_idx=" + item_idx + ", shop_idx=" + shop_idx + ", item_title=" + item_title
				+ ", item_content=" + item_content + ", item_price=" + item_price + ", item_date=" + item_date
				+ ", item_endDate=" + item_endDate + ", item_status=" + item_status + ", item_hide=" + item_hide
				+ ", item_readCnt=" + item_readCnt + ", item_region=" + item_region + ", item_quantity=" + item_quantity
				+ "]";
	}
	
	
}


