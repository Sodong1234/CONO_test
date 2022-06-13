package com.itwillbs.cono.service;

import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.itwillbs.cono.mapper.ItemMapper;
import com.itwillbs.cono.vo.ImgDTO;
import com.itwillbs.cono.vo.OrderDTO;

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
//	public void modifyItemStatus(String item_idx) {
//		mapper.updateItemStatus(item_idx);
//	}
	
	// item 테이블 수량 변경
	public void modifyItemQuantity(OrderDTO ord) {
		mapper.updateItemQuantity(ord);
	}
	
	// ord 테이블 insert
	public void insertOrd(OrderDTO ord) {
		mapper.insertOrd(ord);
	}
	
	// safe 테이블 insert
	public void insertSafe(OrderDTO ord, String order_quantity, String item_price) {
		mapper.insertSafe(ord, order_quantity, item_price);
	}
	
	// coin 테이블 insert (구매자)
	public void insertCoin(String member_id, String order_quantity, String item_price) {
		String coin_total = mapper.selectCoinTotal(member_id);
		System.out.println("coin_total : " + coin_total);
		mapper.insertCoin(member_id, order_quantity, item_price, coin_total);
	}

	// 상품 수량 체크
	public String checkItemQuantity(OrderDTO ord) {
		return mapper.selectItemQuantity(ord);
	}
	
	// 상품 수량 0일 경우 상품 상태 판매완료로 변경
	public void modifyItemStatus(OrderDTO ord) {
		mapper.updateItemStatus(ord);
	}
	
	// 상품 구매 가능 여부 확인(coin)
	public boolean checkCoinTotal(OrderDTO ord, String item_price) {
		
		Integer checkCoin = mapper.selectCoinTotalValue(ord, item_price);
		if(checkCoin < 0 || checkCoin == null) {
			return false;
		} else {
			return true;
		}
	}

	
	// coin 테이블 insert (판매자)
//	public void insertCoinSeller(OrdDTO ord, String item_price) {
//		mapper.insertCoinSeller(ord, item_price);
//	}
	
}
