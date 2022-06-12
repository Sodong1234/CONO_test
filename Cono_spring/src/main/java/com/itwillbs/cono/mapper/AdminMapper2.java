package com.itwillbs.cono.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.cono.vo.PageInfo;



public interface AdminMapper2 {
	
	// ------ 회원 수 - 김혜은
	public int selectMemberListCount(@Param("searchType") String searchType, @Param("search") String search);

	// ------ 회원 리스트 - 김혜은
	public List<HashMap<String, Object>> selectAllMember(@Param("searchType") String searchType,@Param("search") String search, @Param("pageInfo")PageInfo pageInfo);

	// ------ 회원 탈퇴 (관리자) - 김혜은
	public int updateExitMember(@Param("member_id") String member_id);

	// ------ 현재 진행 거래 수 (관리자) - 김혜은
	public int selectDealListCount();

	// ------ 현재 진행 거래 리스트 - 김혜은
	public List<HashMap<String, Object>> selectAllDeal(int pageNum, int listLimit);

	// ------ 거래취소 (관리자) - 김혜은
	public int updateDealCancel(@Param("item_idx")String item_idx, @Param("safe_status") String safe_status);

	
	

}
