package com.itwillbs.cono.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.cono.mapper.AdminMapper2;
import com.itwillbs.cono.vo.PageInfo;

@Service
public class AdminService2 {

	@Autowired
	private AdminMapper2 mapper;
	
	// ------------------- (관리자) 대시보드 ------------------------------------------
	// 전체 회원
	public int getDashMemberCount() {
		
		return mapper.selectDashMember();
	}
	
	// 새로운 회원
	public int getDashNewMemberCount() {
		
		return mapper.selectDashNewMember();
	}
	
	// 답변대기

	public int getQnaWaitCount() {
		
		return mapper.selectDashQnaWait();
	}
	
	// 신고된 글
	public int getDashReportCount() {
		
		return mapper.selectDashReport();
	}
	
	// 전체 상품
	public int getDashAllItemCount() {
		
		return mapper.selectDashAllItem();
	}

	// 오늘 등록된 상품
	public int getDashNewItemCount() {
		
		return mapper.selectDashNewItem();
	}

	// ------------------- (관리자) 회원 정보 조회 - 김혜은 ---------------------------
	// 회원 수
	public Integer getMemberListCount(String searchType, String search) {
		
		return mapper.selectMemberListCount(searchType, search);
	}
	
	// 회원 리스트
	public List<HashMap<String, Object>> getMemberList(String searchType, String search, PageInfo pageInfo) {
		
		return mapper.selectAllMember(searchType, search, pageInfo);
	}

	// 회원 정지 수
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
//	탈퇴회원 shop 아이디 찾기
	public String selectShopMember(String member_id) {
		
		return mapper.selectShopMember(member_id);
	}

//	shop 아이템 찾기
	public boolean updateItem(String shop_idx) {
		
		return mapper.updateItem(shop_idx);
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
	public int dealCancel(String item_idx, String ord_idx) {
		
		return mapper.updateDealCancel(item_idx, ord_idx);
	}

	public int couponReturn(String ord_idx) {
		return mapper.updateCouponReturn(ord_idx);
	}

	public int coinReturn(String coin_total, String safe_coin, String member_id) {
		if(coin_total == null) {
			coin_total = "0";
		}
		coin_total = (Integer.parseInt(coin_total) + Integer.parseInt(safe_coin) + "");
		System.out.println("coin_total : " + coin_total);
		return mapper.insertCoinReturn( coin_total, safe_coin, member_id);
	}

	public List<HashMap<String, String>> itemQuantity_Total(String item_idx, String ord_idx) {
		return mapper.selectItemQuantityTotal(item_idx, ord_idx);
	}

	public int quantityReturn(String itemQuantity_Total, String ord_quantity, String ord_idx) {
		itemQuantity_Total = (Integer.parseInt(itemQuantity_Total) + Integer.parseInt(ord_quantity) + "");
		return mapper.updateItemQuantityReturn(itemQuantity_Total, ord_idx);
	}

	public int cancelStatusY(String item_idx, String ord_idx) {
		return mapper.updateCancelStatus(item_idx, ord_idx);
	}

	public int safeStatusC(String ord_idx) {
		return mapper.updateSafeStatuc(ord_idx);
	}







	

	

	
	



}
