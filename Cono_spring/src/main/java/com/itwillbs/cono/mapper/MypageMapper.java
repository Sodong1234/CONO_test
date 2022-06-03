package com.itwillbs.cono.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.cono.vo.MemberDTO;
import com.itwillbs.cono.vo.PageInfo;

public interface MypageMapper {

	// 최근 조회 게시물 수
	public int selectRecentViewCount();

	public List<List<String>> selectBoardList(String searchType, String keyword, PageInfo pageInfo, String sId);

	// 회원 상세 조회 (for 수정)
	public MemberDTO selectMemberInfo(String sId);

	public int updateMemberInfo(@Param("sId") String sId, @Param("member") MemberDTO member);
	
	
	
}
