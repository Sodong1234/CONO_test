package com.itwillbs.cono.vo;
/*
CREATE TABLE img(
	img_idx varchar(20),
	item_idx varchar(20),
	shop_name varchar(20),
	img_real_name varchar(50),
	img_name varchar(50),
	PRIMARY KEY (img_idx ,item_idx) 
);
 */
public class ImgDTO {
	private String img_idx;
	private String item_idx;
	private String shop_name;
	private String img_real_name;
	private String img_name;
	
	
	public String getImg_idx() {
		return img_idx;
	}
	public void setImg_idx(String img_idx) {
		this.img_idx = img_idx;
	}
	public String getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(String item_idx) {
		this.item_idx = item_idx;
	}
	public String getShop_name() {
		return shop_name;
	}
	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}
	public String getImg_real_name() {
		return img_real_name;
	}
	public void setImg_real_name(String img_real_name) {
		this.img_real_name = img_real_name;
	}
	public String getImg_name() {
		return img_name;
	}
	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}
	
	
	@Override
	public String toString() {
		return "ImgDTO [img_idx=" + img_idx + ", item_idx=" + item_idx + ", shop_name=" + shop_name + ", img_real_name="
				+ img_real_name + ", img_name=" + img_name + "]";
	}
	
	
	
}
