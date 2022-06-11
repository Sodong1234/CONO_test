package com.itwillbs.cono.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.cono.vo.PageInfo;



public interface AdminMapper2 {
	
	// ------ 회원 수 - 김혜은 ------
	public int selectMemberListCount(@Param("searchType") String searchType,@Param("search") String search);

	// ------ 회원 리스트 - 김혜은 ------
	public List<HashMap<String, Object>> selectAllMember(@Param("searchType") String searchType,@Param("search") String search, @Param("pageInfo")PageInfo pageInfo);

	// ------ 현재 진행 거래 수 (관리자) - 김혜은 ------
	public int selectDealListCount();

	// ------ 현재 진행 거래 리스트 - 김혜은 ------
	public List<HashMap<String, Object>> selectAllDeal(int pageNum, int listLimit);
	
	

}
