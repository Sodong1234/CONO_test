package com.itwillbs.cono.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.cono.vo.PageInfo;



public interface AdminMapper2 {
	

	// ------------------- (관리자) 대시보드 ------------------------------------------
	// 전체 회원
	public int selectDashMember();
	
	// 새로운 회원
	public int selectDashNewMember();
	
	// 답변 대기
	public int selectDashQnaWait();

	// 신고된 글
	public int selectDashReport();

	// 전체 상품
	public int selectDashAllItem();

	// 오늘 등록된 상품
	public int selectDashNewItem();

	// ------------------- (관리자) 회원 정보 조회 - 김혜은 ---------------------------
	// 회원 수
	public Integer selectMemberListCount(@Param("searchType") String searchType, @Param("search") String search);

	// 회원 리스트
	public List<HashMap<String, Object>> selectAllMember(@Param("searchType") String searchType,@Param("search") String search, @Param("pageInfo")PageInfo pageInfo);

	// 회원 정지
	public int updateExitMember(@Param("member_id") String member_id);

	// 회원 되돌리기
	public int updateBackMember(String member_id);

	// 탈퇴 회원 수
	public int selectExitMemberCount();
	
	// 탈퇴 회원 리스트
	public List<HashMap<String, Object>> selectExitMember(PageInfo pageInfo);
	
	// -------------------(관리자) 거래 현황 조회 - 김혜은 ----------------------------
	// 현재 진행 거래 수
	public int selectDealListCount();

	// 현재 진행 거래 리스트
	public List<HashMap<String, Object>> selectAllDeal(int pageNum, int listLimit);

	// 거래 취소 요청 수
	public int selectDealCancelListCount();

	// 거래취소 요청 리스트
	public List<HashMap<String, Object>> selectAllDealCancel(int pageNum, int listLimit);

	// 거래취소
	public int updateDealCancel(@Param("item_idx")String item_idx, @Param("ord_idx") String ord_idx);
	// 쿠폰 반환
	public int updateCouponReturn(String ord_idx);
	// 코인 반환
	public int insertCoinReturn(@Param("coin_total") String coin_total,@Param("safe_coin") String safe_coin,@Param("member_id") String member_id);
	// 총 수량
	public List<HashMap<String, String>> selectItemQuantityTotal(@Param("item_idx") String item_idx,@Param("ord_idx") String ord_idx);
	// 반환 
	public int updateItemQuantityReturn(@Param("itemQuantity_Total")String itemQuantity_Total,@Param("ord_idx") String ord_idx);
	// 취소 수정
	public int updateCancelStatus(@Param("item_idx") String item_idx, @Param("ord_idx") String ord_idx);

	public int updateSafeStatuc(String ord_idx);

	

	

	

	

}
