package com.itwillbs.cono.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.cono.vo.MemberDTO;
import com.itwillbs.cono.vo.PageInfo;

public interface AdminMapper2 {
	
	// ------ 회원 수 - 김혜은 ------
	int selectMemberListCount(@Param("searchType") String searchType, @Param("search") String search);

	// ------ 회원 리스트 - 김혜은 ------
	List<MemberDTO> selectAllMember(@Param("searchType") String searchType, @Param("search") String search, PageInfo pageInfo);

}
