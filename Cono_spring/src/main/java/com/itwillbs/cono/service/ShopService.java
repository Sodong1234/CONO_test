package com.itwillbs.cono.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.cono.mapper.ShopMapper;
import com.itwillbs.cono.vo.ShopDTO;

@Service
public class ShopService {
	
	@Autowired
	ShopMapper mapper;
	
	// 상점 정보 조회
	public ShopDTO getMyShop(String member_id) {
		return mapper.selectMyShop(member_id);
	}
	
	// 상점 판매 횟수 조회
	public String getShopSellCnt(String member_id) {
		return mapper.selectShopSellCnt(member_id);
	}
	
	// 상점 상품 개수 조회
	public String getShopItemCnt(String member_id) {
		return mapper.selectShopItemCnt(member_id);
	}

}
