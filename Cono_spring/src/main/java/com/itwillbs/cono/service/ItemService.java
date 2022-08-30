package com.itwillbs.cono.service;

import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.itwillbs.cono.mapper.ItemMapper;
import com.itwillbs.cono.vo.CoinDTO;
import com.itwillbs.cono.vo.CouponDTO;
import com.itwillbs.cono.vo.ImgDTO;
import com.itwillbs.cono.vo.OrdDTO;
import com.itwillbs.cono.vo.WishDTO;

@Service
public class ItemService {
	
	@Autowired
	ItemMapper mapper;
	
	// dsfsadf
	
	// 상품 상세 정보 조회
	public HashMap<String, String> getItemDetail(String item_idx) {
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
	public void modifyItemQuantity(OrdDTO ord) {
		mapper.updateItemQuantity(ord);
	}
	
	// ord 테이블 insert
	public void insertOrd(OrdDTO ord) {
		mapper.insertOrd(ord);
	}
	
	// safe 테이블 insert
	public void insertSafe(OrdDTO ord, String item_price, String ord_date) {
		mapper.insertSafe(ord, item_price, ord_date);
	}
	
	// coin 테이블 insert (구매자)
	public void insertCoin(OrdDTO ord, String item_price, String coupon_idx) {
		String coin_total = mapper.selectCoinTotal(ord.getMember_id());
		String coupon_price = mapper.selectCouponPrice(coupon_idx);
		if(coupon_price == null) {
			coupon_price = "0";
		}
		coin_total = (Integer.parseInt(coin_total) - Integer.parseInt(item_price)*Integer.parseInt(ord.getOrd_quantity()) + Integer.parseInt(coupon_price)) + "";
		mapper.insertCoin(ord, item_price, coin_total, coupon_price);
	}

	// 상품 수량 체크
	public String checkItemQuantity(OrdDTO ord) {
		return mapper.selectItemQuantity(ord);
	}
	
	// 상품 수량 0일 경우 상품 상태 판매완료로 변경
	public void modifyItemStatus(OrdDTO ord) {
		mapper.updateItemStatus(ord);
	}
	
	// 상품 구매 가능 여부 확인(coin)
	public String checkCoinTotal(OrdDTO ord, String item_price) {
		return mapper.selectCoinTotal(ord.getMember_id());
	}
	
	// 구매자 정보 가져오기
	public HashMap<String, String> getBuyerInfo(String buyer_id) {
		return mapper.selectBuyerInfo(buyer_id);
	}
	
	// 사용 가능한 할인 쿠폰 가져오기
	public List<HashMap<String, String>> getUsableCoupon(String buyer_id, String item_price, String ord_quantity) {
		return mapper.selectUsableCoupon(buyer_id, item_price, ord_quantity);
	}
	
	// 코인 잔액 조회
	public int getBalanceCoin(String buyer_id) {
		return mapper.selectBalanceCoin(buyer_id);
	}
	
	// 쿠폰 상태 업데이트
	public void updateCoupon(String coupon_idx, String item_idx) {
		mapper.updateCoupon(coupon_idx, item_idx);
	}
	
	// 찜 버튼 활성화 (증가)
	public void increaseWish(String item_idx, String member_id) {
		mapper.insertWish(item_idx, member_id);
	}
	
	// 찜 여부 조회
	public WishDTO selectWish(String item_idx, String member_id) {
		return mapper.selectWish(item_idx, member_id);
	}
	
	// 찜 취소
	public void deleteWish(String item_idx, String member_id) {
		mapper.deleteWish(item_idx, member_id);
	}

    // 최근 조회 존재 여부
    public int existRecent(String member_id, String item_idx) {
       return mapper.selectRecentExist(member_id,item_idx);
    } 
    // 최근 조회 insert
    public int insertRecentView(String member_id, String item_idx, int existRecent) {
       return mapper.insertRecentView(member_id, item_idx, existRecent);
    }

	// coin 존재 여부 확인
	public List<CoinDTO> checkCoin(String member_id) {
		return mapper.selectCoin(member_id);
	}

	// 조회수 증가
	public void increaseReadCount(String item_idx) {
		mapper.updateReadcount(item_idx);
		// TODO Auto-generated method stub
		
	}

	public String selectOrdDate(OrdDTO ord) {
		return mapper.selectOrdDate(ord);
		
	}

	// 최근 조회 리스트 첫 화면
	public List<List<String>> getRecentViewList(String sId) {
		return mapper.selectBoardList(sId);
	}

	
	// coin 테이블 insert (판매자)
//	public void insertCoinSeller(OrdDTO ord, String item_price) {
//		mapper.insertCoinSeller(ord, item_price);
//	}
	
}
