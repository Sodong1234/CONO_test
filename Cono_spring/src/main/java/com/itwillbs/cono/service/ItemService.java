package com.itwillbs.cono.service;

import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.itwillbs.cono.mapper.ItemMapper;
import com.itwillbs.cono.vo.ImgDTO;
import com.itwillbs.cono.vo.OrdDTO;

@Service
public class ItemService {
	
	@Autowired
	ItemMapper mapper;
	
	// 상품 상세 정보 조회
	public HashMap<String, String> selectItemDetail(String item_idx) {
		return mapper.selectItemDetail(item_idx);
	}
	
	// 상품 이미지 조회
	public List<ImgDTO> selectImgList(String item_idx) {
		return mapper.selectImgList(item_idx);
	}
	
	// 구매하기 클릭 시 아이템 상태 변경
	public void modifyItemStatus(String item_idx) {
		mapper.updateItemStatus(item_idx);
	}
	
	// item 테이블 수량 변경
	public void modifyItemQuantity(OrdDTO ord) {
		mapper.updateItemQuantity(ord);
	}
	
	// ord 테이블 insert
	public void insertOrd(OrdDTO ord) {
		mapper.insertOrd(ord);
	}
	
	// safe 테이블 insert
	public void insertSafe(OrdDTO ord, String item_price) {
		mapper.insertSafe(ord, item_price);
	}
	
	// coin 테이블 insert (구매자)
	public void insertCoinBuyer(OrdDTO ord, String item_price) {
		mapper.insertCoinBuyer(ord, item_price);
	}
	
	// coin 테이블 insert (판매자)
//	public void insertCoinSeller(OrdDTO ord, String item_price) {
//		mapper.insertCoinSeller(ord, item_price);
//	}
	
}
