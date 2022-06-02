package com.itwillbs.cono.mapper;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.cono.vo.CategoryDTO;
import com.itwillbs.cono.vo.ItemDTO;
import com.itwillbs.cono.vo.ShopDTO;

public interface ShopMapper {

	// 상점 정보 조회
	ShopDTO selectMyShop(String member_id);

	// 상점 판매 횟수 조회
	String selectShopSellCnt(String member_id);

	// 상점 상품 개수 조회
	String selectShopItemCnt(String member_id);
	
	// 등록된 상품 개수 조회
	int selectItemIdx();
	
	// item 테이블 insert
	int insertItem(@Param("item") ItemDTO item, @Param("member_id") String member_id);
	
	// category 테이블 insert
	int insertCategory(@Param("category") CategoryDTO category, @Param("item") ItemDTO item);

}
