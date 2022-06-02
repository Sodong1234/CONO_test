package com.itwillbs.cono.mapper;

import com.itwillbs.cono.vo.ShopDTO;

public interface ShopMapper {

	// 상점 정보 조회
	ShopDTO selectMyShop(String member_id);

	// 상점 판매 횟수 조회
	String selectShopSellCnt(String member_id);

	// 상점 상품 개수 조회
	String selectShopItemCnt(String member_id);

}
