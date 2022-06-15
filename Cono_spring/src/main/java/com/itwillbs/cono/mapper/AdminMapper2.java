package com.itwillbs.cono.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.cono.vo.PageInfo;



public interface AdminMapper2 {
	
	// ------------------- (관리자) 회원 정보 조회 - 김혜은 ---------------------------
	// 회원 수
	public int selectMemberListCount(@Param("searchType") String searchType, @Param("search") String search);

	// 회원 리스트
	public List<HashMap<String, Object>> selectAllMember(@Param("searchType") String searchType,@Param("search") String search, @Param("pageInfo")PageInfo pageInfo);

	// 회원 탈퇴
	public int updateExitMember(@Param("member_id") String member_id);

	
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
	public int updateDealCancel(@Param("item_idx")String item_idx, @Param("safe_status") String safe_status);
	
	

}
