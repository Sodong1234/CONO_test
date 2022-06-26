package com.itwillbs.cono.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.cono.vo.CancelDTO;
import com.itwillbs.cono.vo.CoinDTO;
import com.itwillbs.cono.vo.CouponDTO;
import com.itwillbs.cono.vo.MemberDTO;
import com.itwillbs.cono.vo.OrdDTO;
import com.itwillbs.cono.vo.PageInfo;
import com.itwillbs.cono.vo.PaymentDTO;
import com.itwillbs.cono.vo.ReviewDTO;

public interface MypageMapper {

	// 최근 조회 게시물 수
	public int selectRecentViewCount();
	// 아직 ㄴㄴ
//	public List<List<String>> selectBoardList(String sId);
	// 최근 상품 조회
	public List<HashMap<String, String>> selectRecent(String sId);
	// 회원 상세 조회 (for 수정)
	public MemberDTO selectMemberInfo(String sId);
	// 회원 정보 수정
	public int updateMemberInfo(@Param("sId") String sId, @Param("member") MemberDTO member);
	// 코인 내역 리스트 COUNT
	public int coinListCount(String sId);
	// 코인 내역 조회
	public List<CoinDTO> selectCoinInfoList(@Param("sId") String sId,@Param("pageInfo") PageInfo pageInfo);
	// 현재 보유 코인
	public String coinTotal(String sId);
	// 결제
	public Integer insertPayment(@Param("sId") String sId, @Param("payment_value") String payment_value);
	// 결제 데이터 받아오기
	public PaymentDTO selectPayment(@Param("sId") String sId);
	// 코인 충전
	public void insertCoinAdd(@Param("sId") String sId, @Param("payment_value") String payment_value, @Param("balance") String balance);
	// 쿠폰 수
	public int selectCouponCount(String sId);
	// 쿠폰함 - 보유 쿠폰
	public List<CouponDTO> couponList(String sId);
	// 장바구니 아이템 수
//	public int selectBasketCount(String sId);
	// 장바구니 - 장바구니 아이템 리스트
//	public List<HashMap<String, String>> selectBasketList(String sId);
	// 구매완료 - 구매완료 아이템 리스트
	public List<HashMap<String, String>> selectPurchasedList(String sId);
	// 예약 중인 아이템 수
//	public int selectReservedCount(String sId);
	// 예약 중 - 예약 진행 중인 상품 리스트
//	public List<HashMap<String, String>> selectReservedList(String sId);
	
	// 위시 리스트
	public List<HashMap<String, String>> selectWishList(String sId);
	// 위시 상품 수
	public int selectWishCount(String sId);
	// 취소리스트
	public List<HashMap<String, String>> selectCancelList(String sId);
	// 구매 중 수
	public int selectWaitingCount(String sId);
	// 내가 쓴 리뷰 확인
	public List<HashMap<String, String>> selectReadPurchaseList(@Param("sId") String sId, @Param("pageInfo") PageInfo pageInfo);
	public List<HashMap<String, String>> selectWaitingList(String sId);
	// 후기 개수 조회
	public int selectPurchaseListCount(String sId);
	// 후기 작성할 아이템 조회
	public HashMap<String, String> selectItemInfo(String item_idx);
	// 후기 등록
	public int insertReview(@Param("review") ReviewDTO review, @Param("sId") String sId, @Param("ordresult") OrdDTO ordresult);
	// 구매 확정
	public void updateordStatus(@Param("sId") String sId, @Param("item_idx") String item_idx, @Param("ord_date") String ord_date);
	// 판매자한테 safe에 저장된 코인 입금
	public void insertCoinSeller(@Param("shop_member_id") String shop_member_id, @Param("safe_coin") String safe_coin, @Param("coin_total") String coin_total);
	// safe 테이블 status 변경 
	public boolean updateSafeStatus(@Param("sId") String sId, @Param("item_idx") String item_idx, @Param("ord_date") String ord_date);
	// ord 테이블 조회 (가지고 다닐거)
	public OrdDTO selectOrd(@Param("sId") String sId, @Param("item_idx") String item_idx, @Param("ord_date") String ord_date);
	// 회원 탈퇴 로직
	public boolean deleteId(@Param("id") String id, @Param("passwd") String passwd);
	// safe_coin
	public String selectSafeCoin(@Param("sId") String sId, @Param("item_idx") String item_idx, @Param("ord_date") String ord_date);
	// coin_total
	public String selectCoinTotal(String shop_member_id);
	// 후기 내역 ListCount 조회
	public int selectReviewListCount(String sId);
	// 후기 내역 조회
	public List<HashMap<String, String>> selectReviewList(@Param("sId") String sId, @Param("pageInfo") PageInfo pageInfo);
	// 회원 정보 수정페이지 진입 전 비밀번호 확인 작업
	public MemberDTO checkPass(@Param("sId") String sId, @Param("passwd") String passwd);
	// 취소신청
	public int insertCancelReq(CancelDTO dto);
	// 샵아이디 검색 for 판매자입금
	public String selectShop_idx(String item_idx);
	

	
	
}
