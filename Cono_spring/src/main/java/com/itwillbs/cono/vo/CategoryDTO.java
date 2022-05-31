package com.itwillbs.cono.vo;
/*
CREATE TABLE category  (
	category_big varchar(20),
	category_small varchar(20),
	item_idx varchar(20),
	category_small_readCnt varchar(20),
	PRIMARY KEY (category_big, category_small)
);
 */
public class CategoryDTO {
	private String category_big;
	private String category_small;
	private String item_idx;
	private String category_small_readCnt;
	
	public CategoryDTO() {}
	
	public CategoryDTO(String category_big, String category_small, String item_idx, String category_small_readCnt) {
		this.category_big = category_big;
		this.category_small = category_small;
		this.item_idx = item_idx;
		this.category_small_readCnt = category_small_readCnt;
	}

	public String getCategory_big() {
		return category_big;
	}
	public void setCategory_big(String category_big) {
		this.category_big = category_big;
	}
	public String getCategory_small() {
		return category_small;
	}
	public void setCategory_small(String category_small) {
		this.category_small = category_small;
	}
	public String getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(String item_idx) {
		this.item_idx = item_idx;
	}
	public String getCategory_small_readCnt() {
		return category_small_readCnt;
	}
	public void setCategory_small_readCnt(String category_small_readCnt) {
		this.category_small_readCnt = category_small_readCnt;
	}
	
	@Override
	public String toString() {
		return "CategoryDTO [category_big=" + category_big + ", category_small=" + category_small + ", item_idx="
				+ item_idx + ", category_small_readCnt=" + category_small_readCnt + "]";
	}
	
	
}
