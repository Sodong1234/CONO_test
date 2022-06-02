package com.itwillbs.cono.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.cono.mapper.MypageMapper;
import com.itwillbs.cono.vo.MemberDTO;
import com.itwillbs.cono.vo.PageInfo;
import com.itwillbs.cono.vo.RecentViewDTO;

@Service
public class MypageService {

	@Autowired
	private MypageMapper mapper;
	
	
	// 1. 최근 조회 게시물 수
	public int getRecentViewListCount() {
		return mapper.selectRecentViewCount();
	}
	
	// 최근 조회 리스트 첫 화면
	public List<List<String>> getRecentViewList(String searchType, String keyword, PageInfo pageInfo, RecentViewDTO recentViewDTO) {
		return mapper.selectBoardList(searchType, keyword, pageInfo, recentViewDTO);
	}

	// 회원정보 가져오기 (for 수정)
	public MemberDTO getMemberDetail(String sId) {
		return mapper.selectMemberInfo(sId);
	}

}
