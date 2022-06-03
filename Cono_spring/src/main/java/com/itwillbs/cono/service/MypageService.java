package com.itwillbs.cono.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.cono.mapper.MypageMapper;
import com.itwillbs.cono.vo.CoinDTO;
import com.itwillbs.cono.vo.MemberDTO;
import com.itwillbs.cono.vo.PageInfo;

@Service
public class MypageService {

	@Autowired
	private MypageMapper mapper;
	
	
	// 1. 최근 조회 게시물 수
	public int getRecentViewListCount() {
		return mapper.selectRecentViewCount();
	}
	
	// 최근 조회 리스트 첫 화면
	public List<List<String>> getRecentViewList(String searchType, String keyword, PageInfo pageInfo, String sId) {
		return mapper.selectBoardList(searchType, keyword, pageInfo, sId);
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
	public List<CoinDTO> getCoinInfoList(String sId) {
		return mapper.selectCoinInfoList(sId);
	}
	// 현재 보유 코인
	public String getCoinTotal(String sId) {
		return mapper.coinTotal(sId);
	}

}
