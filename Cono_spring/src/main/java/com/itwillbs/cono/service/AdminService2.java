package com.itwillbs.cono.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.cono.mapper.AdminMapper2;
import com.itwillbs.cono.vo.PageInfo;

@Service
public class AdminService2 {

	@Autowired
	private AdminMapper2 mapper;
	
	// ------------------- (관리자) 회원 정보 조회 - 김혜은 ---------------------------
	// 회원 수
	public Integer getMemberListCount(String searchType, String search) {
		
		return mapper.selectMemberListCount(searchType, search);
	}
	
	// 회원 리스트
	public List<HashMap<String, Object>> getMemberList(String searchType, String search, PageInfo pageInfo) {
		
		return mapper.selectAllMember(searchType, search, pageInfo);
	}

	// 회원 정지
	public int exitMember(String member_id) {
		
		return mapper.updateExitMember(member_id);
	}
	
	// 회원 되돌리기
	public int backMember(String member_id) {

		return mapper.updateBackMember(member_id);
	}
	
	// 탈퇴 회원 수
	public int getExitMemberListCount() {

		return mapper.selectExitMemberCount();
	}

	// 탈퇴 회원 리스트 조회
	public List<HashMap<String, Object>> getExitMemberList(PageInfo pageInfo) {
		
		return mapper.selectExitMember(pageInfo);
	}


	// -------------------(관리자) 거래 현황 조회 - 김혜은 ----------------------------
	// 현재 진행 거래 수
	public int getAdminDealListCount() {
		
		return mapper.selectDealListCount();
	}

	// 현재 진행 거래 리스트
	public List<HashMap<String, Object>> getAdminDealList(int pageNum, int listLimit) {

		return mapper.selectAllDeal(pageNum, listLimit);
	}
	
	// 거래 취소 요청 수
	public int getAdminDealCancelListCount() {
		
		return mapper.selectDealCancelListCount();
	}

	// 거래취소요청 리스트
	public List<HashMap<String, Object>> getAdminDealCancelList(int pageNum, int listLimit) {
		
		return mapper.selectAllDealCancel(pageNum, listLimit);
	}

	//  거래취소 (관리자)
	public int dealCancel(String item_idx, String safe_status) {
		
		return mapper.updateDealCancel(item_idx, safe_status);
	}

	

	
	



}
