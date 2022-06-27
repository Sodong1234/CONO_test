package com.itwillbs.cono.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.cono.mapper.MypageMapper;
import com.itwillbs.cono.vo.AccountInfoDTO;
import com.itwillbs.cono.vo.CancelDTO;
import com.itwillbs.cono.vo.CoinDTO;
import com.itwillbs.cono.vo.CouponDTO;
import com.itwillbs.cono.vo.MemberDTO;
import com.itwillbs.cono.vo.OrdDTO;
import com.itwillbs.cono.vo.PageInfo;
import com.itwillbs.cono.vo.PaymentDTO;
import com.itwillbs.cono.vo.ReviewDTO;

@Service
public class MypageService {

	@Autowired
	private MypageMapper mapper;
	
	
	// 1. 최근 조회 게시물 수
	public int getRecentViewListCount() {
		return mapper.selectRecentViewCount();
	}
	
	// 최근 조회 리스트 첫 화면
//	public List<List<String>> getRecentViewList(String sId) {
//		return mapper.selectBoardList(sId);
//	}
	// 최근게시물 조회
	public List<HashMap<String, String>> getRecent(String sId) {
		return mapper.selectRecent(sId);
	}
	
	// 회원정보 가져오기 (for 수정)
	public MemberDTO getMemberDetail(String sId) {
		return mapper.selectMemberInfo(sId);
	}
	// 회원정보 수정
	public int modifyMember(String sId, MemberDTO member) {
		return mapper.updateMemberInfo(sId, member);
	}
	// 코인 내역 리스트 COUNT
		public int getCoinListCount(String sId) {
			return mapper.coinListCount(sId);
		}
	// 코인 이용 내역
	public List<CoinDTO> getCoinInfoList(String sId, PageInfo pageInfo) {
		return mapper.selectCoinInfoList(sId,pageInfo);
	}
	// 현재 보유 코인
	public String getCoinTotal(String sId) {
		return mapper.coinTotal(sId);
	}
	// 결제 정보 입력
	public Integer setPaymentInfo(String sId, String payment_value) {
		return mapper.insertPayment(sId, payment_value);
	}
	// 결제 정보 출력
	public PaymentDTO getPaymentInfo(String sId) {
		return mapper.selectPayment(sId);
	}
	// 코인 충전
	public void setCoinAdd(String sId, String payment_value, String balance) {
		mapper.insertCoinAdd(sId, payment_value, balance);
	}
	//===================== 쿠폰 start =========================	
	// 쿠폰 수
	public int getCouponCount(String sId) {
		return mapper.selectCouponCount(sId);
	}
	// 쿠폰 리스트
	public List<CouponDTO> getCouponList(String sId) {
		return mapper.couponList(sId);
	}
	//===================== 쿠폰 finish =========================	
	//===================== 장바구니 start =========================	
	// 장바구니 아이템 수
//	public int getBasketCount(String sId) {
//		return mapper.selectBasketCount(sId);
//	}
	// 장바구니 리스트
//	public List<HashMap<String, String>> getBasketList(String sId) {
//		return mapper.selectBasketList(sId);
//	}
	//===================== 장바구니 finish =========================	
	// 찜 상품 수
		public int getWishItemCount(String sId) {
			return mapper.selectWishCount(sId);
		}
	
	// 구매완료 리스트
	public List<HashMap<String, String>> getPurchasedList(String sId) {
		return mapper.selectPurchasedList(sId);
	}
	// 예약 중인 상품 COUNT 
//	public int getReservedCount(String sId) {
//		return mapper.selectReservedCount(sId);
//	}
	// 예약 중인 상품 리스트
//	public List<HashMap<String, String>> getReservedList(String sId) {
//		return mapper.selectReservedList(sId);
//	}

	// 위시 리스트 (양윤석)
	public List<HashMap<String, String>> getwishList(String sId) {
		return mapper.selectWishList(sId);
	}
	// 취소 리스트
	public List<HashMap<String, String>> getCanceledList(String sId) {
		return mapper.selectCancelList(sId);
	}

	public int getWaitingCount(String sId) {
		return mapper.selectWaitingCount(sId);
	}
	
	// 내가 쓴 리뷰 확인
	public List<HashMap<String, String>> getReadPurchaseList(String sId, PageInfo pageInfo) {
		return mapper.selectReadPurchaseList(sId, pageInfo);
	}
	
	// 리뷰 개수 조회
	public int getPurchaseListCount(String sId) {
		return mapper.selectPurchaseListCount(sId);
	}
	
	// 리뷰 작성할 아이템 정보 조회
	public HashMap<String, String> getItemInfo(String item_idx) {
		return mapper.selectItemInfo(item_idx);
	}
	
	public List<HashMap<String, String>> getWaitingList(String sId) {
		return mapper.selectWaitingList(sId);
	}
	
	// 후기 등록
	public int uploadReview(ReviewDTO review, String sId, OrdDTO ordresult) {
		return mapper.insertReview(review, sId, ordresult);
	}
	
	// 구매확정
	public void confirmPurchase(String sId, String item_idx, String ord_date) {
		mapper.updateordStatus(sId, item_idx, ord_date);
	}

	// 판매자한테 safe에 저장된 코인 입금
	public void insertCoinSeller(String shop_member_id, String safe_coin, String coin_total) {
		mapper.insertCoinSeller(shop_member_id, safe_coin, coin_total);
	}
	
	// safe 테이블 상태 변경
	public boolean modifySafeStatus(String sId, String item_idx, String ord_date) {
		return mapper.updateSafeStatus(sId, item_idx, ord_date);
	}
	
	// ord 테이블 조회(가지고 다닐거)
	public OrdDTO selectOrd(String sId, String item_idx, String ord_date) {
		return mapper.selectOrd(sId, item_idx, ord_date);
	}
	
	// 회원 탈퇴 로직
	public boolean deleteId(String id, String passwd) {
		return mapper.deleteId(id, passwd);
	}

	// safe_coin 
	public String selectSafeCoin(String sId, String item_idx, String ord_date) {
		return mapper.selectSafeCoin(sId, item_idx, ord_date);
	}
	// coin_total
	public String selectCoinTotal(String shop_member_id) {
		return mapper.selectCoinTotal(shop_member_id);
	}
	// 후기 내역 ListCount 조회
	public int getReviewListCount(String sId) {
		return mapper.selectReviewListCount(sId);
	}
	// 후기 내역 조회
	public List<HashMap<String, String>> getReviewList(String sId, PageInfo pageInfo) {
		return mapper.selectReviewList(sId, pageInfo);
	}

	// 회원 정보 수정페이지 진입 전 비밀번호 확인 작업
	public MemberDTO checkPass(String sId, String passwd) {
		return mapper.checkPass(sId, passwd);
	}
	// 취소신청
	public int setCancelReq(CancelDTO dto) {
		return mapper.insertCancelReq(dto);
	}

	public String selectShop_idx(String item_idx) {
		return mapper.selectShop_idx(item_idx);
	}

	public int insertAccountInfo(String sId, String accountName, String bankName, String accountNum) {
		return mapper.insertAccountInfo(sId, accountName, bankName, accountNum);
	}

	public AccountInfoDTO selectAccountInfo(String sId) {
		return mapper.selectAccountInfo(sId);
	}

	public boolean deleteItem(String shop_idx) {
		return mapper.deleteItem(shop_idx);
	}

	public String selectShop_idxBymember(String id) {
		return mapper.selectShop_idxBymember(id);
	}

	

	
	

	
	


}
