package com.itwillbs.cono.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.cono.service.AdminService2;
import com.itwillbs.cono.service.MypageService;
import com.itwillbs.cono.vo.PageInfo;

@Controller
public class AdminController2 {
	
	@Autowired
	AdminService2 service;
	@Autowired
	MypageService mypage_service;
	
	// ------ 메인페이지로 이동!
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String home() {
		return "redirect:/";
	}
	
	// ------ 관리자 메인페이지로 이동!
	// 관리자 대시보드
	@RequestMapping(value = "/adminMain", method = RequestMethod.GET)
	public String AdminMain(Model model) {
		
		// 전체 회원수
		int memberCount = service.getDashMemberCount();
		
		// 새로운 회원
		int newMemberCount = service.getDashNewMemberCount();
		
		// 진행중인 거래
		int dealCount = service.getAdminDealListCount();
		
		// 거래취소 요청
		int dealCancel = service.getAdminDealCancelListCount();
		
		// 답변대기
		int qnaWaitCount = service.getQnaWaitCount();
		
		// 신고된 글
		int reportCount = service.getDashReportCount();
		
		// 전체 상품
		int allItemCount = service.getDashAllItemCount();
		
		// 오늘 등록된 상품
		int newItemCount = service.getDashNewItemCount();
		
		model.addAttribute("memberCount", memberCount);
		model.addAttribute("newMemberCount", newMemberCount);
		model.addAttribute("dealCount", dealCount);
		model.addAttribute("dealCancel", dealCancel);
		model.addAttribute("qnaWaitCount", qnaWaitCount);
		model.addAttribute("reportCount", reportCount);
		model.addAttribute("allItemCount", allItemCount);
		model.addAttribute("newItemCount", newItemCount);
		
		return "admin_center/main";
	}
	
	
	// ------ 회원 관리 리스트 (관리자) - 김혜은
	@RequestMapping(value = "/AdminMemberList", method = RequestMethod.GET)
	public String MemberList(@RequestParam(defaultValue = "") String searchType, @RequestParam(defaultValue = "") String search,
			@RequestParam(defaultValue = "1") int pageNum, Model model) {
		
		int listLimit = 10;	// 페이지 당 글 목록 갯수
		int pageLimit = 10;	// 페이지 당 페이지 목록 갯수
		
		// 회원수 조회
		Integer listCount = service.getMemberListCount(searchType, "%" + search + "%");
		
		// 페이징 처리 계산
		int maxPage = (int)Math.ceil((double) listCount / listLimit);
		int startPage = ((int) ((double) pageNum / pageLimit + 0.9) - 1) * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		
		// 조회 시작 게시물 번호(행 번호) 계산
		int startRow = (pageNum - 1) * listLimit;
		
		// 페이징 처리 정보를 PageInfo 객체에 저장
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPageNum(pageNum);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setStartRow(startRow);
		pageInfo.setListLimit(listLimit);
		
		// 회원 리스트
		List<HashMap<String, Object>> memberList = service.getMemberList(searchType, "%" + search + "%", pageInfo);
		System.out.println(memberList);
		
		// Model 객체에 저장
		model.addAttribute("memberList", memberList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "userCenter/admin_member_list";
	}
	
	// ------ 회원 리스트 조회 로직
	@RequestMapping(value = "/AdminMemberList", method = RequestMethod.POST)
	public String MemberListPost(@RequestParam(defaultValue = "") String searchType, @RequestParam(defaultValue = "") String search,
			@RequestParam(defaultValue = "1") int pageNum, Model model) {
		
		int listLimit = 10;	// 페이지 당 글 목록 갯수
		int pageLimit = 10;	// 페이지 당 페이지 목록 갯수
		
		// 회원수 조회
		int listCount = service.getMemberListCount(searchType, "%" + search + "%");
		
		// 페이징 처리 계산
		int maxPage = (int)Math.ceil((double) listCount / listLimit);
		int startPage = ((int) ((double) pageNum / pageLimit + 0.9) - 1) * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		
		// 조회 시작 게시물 번호(행 번호) 계산
		int startRow = (pageNum - 1) * listLimit;
		
		// 페이징 처리 정보를 PageInfo 객체에 저장
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPageNum(pageNum);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setStartRow(startRow);
		pageInfo.setListLimit(listLimit);
		
		// 회원 리스트
		List<HashMap<String, Object>> memberList = service.getMemberList(searchType, "%" + search + "%", pageInfo);
		
		// Model 객체에 저장
		model.addAttribute("memberList", memberList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "userCenter/admin_member_list";
	}
	
	// 탈퇴 회원 리스트 조회
	@RequestMapping(value = "/AdminExitMemberList", method = RequestMethod.GET)
	public String ExitMemberListPost(@RequestParam(defaultValue = "") String searchType, @RequestParam(defaultValue = "") String search,
			@RequestParam(defaultValue = "1") int pageNum, Model model) {
		
		int listLimit = 10;	// 페이지 당 글 목록 갯수
		int pageLimit = 10;	// 페이지 당 페이지 목록 갯수
		
		// 회원수 조회
		int listCount = service.getExitMemberListCount();
		
		// 페이징 처리 계산
		int maxPage = (int)Math.ceil((double) listCount / listLimit);
		int startPage = ((int) ((double) pageNum / pageLimit + 0.9) - 1) * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		
		// 조회 시작 게시물 번호(행 번호) 계산
		int startRow = (pageNum - 1) * listLimit;
		
		// 페이징 처리 정보를 PageInfo 객체에 저장
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPageNum(pageNum);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setStartRow(startRow);
		pageInfo.setListLimit(listLimit);
		
		// 회원 리스트
		List<HashMap<String, Object>> exitList = service.getExitMemberList(pageInfo);
		
		// Model 객체에 저장
		model.addAttribute("exitList", exitList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "userCenter/admin_exit_member_list";
	}
	
	// ----- 회원 되돌리기 
	@RequestMapping(value = "/AdminMemberBack", method = RequestMethod.GET)
	public String adminMemberBack(@RequestParam String member_id, @RequestParam(defaultValue = "1")int pageNum, Model model) {
		
		int exitCount = service.backMember(member_id);
		
		if(exitCount == 0) {
			model.addAttribute("msg", "회원 되돌리기 실패!");
			return "fail_back";
		}
		
		model.addAttribute("pageNum", pageNum);
		
		return "redirect:/AdminMemberList";
	}
	
	// ------ 회원 정지 (관리자) - 김혜은
	@RequestMapping(value = "/AdminMemberExit", method = RequestMethod.GET)
	public String adminMemberExit(HttpSession session, @RequestParam String member_id, @RequestParam(defaultValue = "1")int pageNum, Model model) {
		
		int exitCount = service.exitMember(member_id);
		
		// shop_idx 추출
		String shop_idx = service.selectShopMember(member_id);
		// item_status = '1'
		boolean isDeleteItemSuccess = service.updateItem(shop_idx);
		System.out.println(isDeleteItemSuccess);
		
		session.invalidate();
		
		model.addAttribute("pageNum", pageNum);
		
		return "redirect:/AdminExitMemberList";
	}
	
	// --------------------------------------------------------------------------------------------------------
	// ------ 거래 리스트 (관리자) - 김혜은
	@RequestMapping(value = "/AdminDealList", method = RequestMethod.GET)
	public String dealList(@RequestParam(defaultValue = "1")int pageNum, Model model) {
		
		// 페이징 처리
		int listLimit = 10;
		int pageLimit = 10;
		
		// 현재 거래 수 조회
		int listCount = service.getAdminDealListCount();
		
		// 거래 목록 조회
		List<HashMap<String, Object>> dealList = service.getAdminDealList(pageNum, listLimit);
		
		// 페이징 처리를 위한 계산 작업
		int maxPage = (int) Math.ceil((double) listCount / listLimit);
		int startPage = ((int) ((double) pageNum / pageLimit + 0.9) - 1) * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		
		int startRow = (pageNum - 1) * listLimit;
		
		// 페이징 처리 정보 저장
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPageNum(pageNum);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setStartRow(startRow);
		pageInfo.setListLimit(listLimit);
		
		model.addAttribute("dealList", dealList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "userCenter/admin_deal_list";
	}
	
	
	// ------ 거래 취소 요청 리스트 (관리자) - 김혜은
	@RequestMapping(value = "/AdminDealCancelList", method = RequestMethod.GET)
	public String dealCancelList(@RequestParam(defaultValue = "1")int pageNum, Model model) {
		
		// 페이징 처리
		int listLimit = 10;
		int pageLimit = 10;
		
		// 현재 거래 수 조회
		int listCount = service.getAdminDealCancelListCount();
		
		// 거래 목록 조회
		List<HashMap<String, Object>> cancelList = service.getAdminDealCancelList(pageNum, listLimit);
		
		// 페이징 처리를 위한 계산 작업
		int maxPage = (int) Math.ceil((double) listCount / listLimit);
		int startPage = ((int) ((double) pageNum / pageLimit + 0.9) - 1) * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		
		int startRow = (pageNum - 1) * listLimit;
		
		// 페이징 처리 정보 저장
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPageNum(pageNum);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setStartRow(startRow);
		pageInfo.setListLimit(listLimit);
		
		model.addAttribute("cancelList", cancelList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "userCenter/admin_deal_Cancel";
	}
	
	
	// ------ 거래 취소 (관리자)
	@RequestMapping(value = "/AdminDealCancel", method = RequestMethod.GET)
	public String dealCancel(@RequestParam String item_idx, @RequestParam String safe_coin,
								@RequestParam(defaultValue = "1")int pageNum, 
								@RequestParam String member_id, @RequestParam String ord_idx, Model model) {
		// 취소 작업 요청
		int dealCancel = service.dealCancel(item_idx, ord_idx);
		// 코인 바꾸기 (인서트)
		String coin_total = mypage_service.getCoinTotal(member_id);  // 코인 잔액
		int coinReturn = service.coinReturn(coin_total ,safe_coin , member_id);
		// 쿠폰 반환(업데이트) -> Y -> N
		int couponReturn = service.couponReturn(ord_idx);
		// item 수량 변경(업데이트)
		String itemQuantity_Total = service.itemQuantity_Total(item_idx, ord_idx).get(0).get("item_quantity");
		String ord_quantity = service.itemQuantity_Total(item_idx, ord_idx).get(0).get("ord_quantity");
		int quantityReturn = service.quantityReturn(itemQuantity_Total, ord_quantity, ord_idx);
		// cancel Y 로 변경(업데이트)
		int cancelStatusY = service.cancelStatusY(item_idx, ord_idx);
		// safe 상태 C 로 변경
		int safeStatusC = service.safeStatusC(ord_idx);
		
		
		System.out.println(dealCancel);
		System.out.println("coinReturn" + coinReturn + "--" + "멤버 : " + member_id);
		System.out.println(couponReturn);
		System.out.println(quantityReturn);
		System.out.println(cancelStatusY);
		System.out.println(safeStatusC);
		// 실패 시
		if(dealCancel == 0) {
			model.addAttribute("msg", "거래취소 실패!");
			return "fail_back";
		}
		
		model.addAttribute("pageNum", pageNum);
		
		return "redirect:/AdminDealList";
	}
	
	// ------ 거래 취소 로직 (관리자)
//	@RequestMapping(value = "/AdminDealCancel", method = RequestMethod.POST)
//	public String dealCancelPost(
//								@RequestParam String item_idx, @RequestParam String safe_coin,
//								@RequestParam String safe_status, @RequestParam(defaultValue = "1")int pageNum, Model model) {
//		//취소 작업 요청
//		// safe_status N -> C 로변경
//		int dealCancel = service.dealCancel(item_idx, safe_status);
//		// 쿠폰 반환(업데이트) -> Y -> N
//		int couponReturn = service.couponReturn(item_idx);
//		
//		// item 수량 변경(업데이트)
//		int quantityReturn = service.quantityReturn(item_idx);
//		// cancel Y 로 변경(업데이트)
//		int cancelStatusY = service.cancelStatusY(item_idx);
//		// 코인 바꾸기 (인서트)
//		int coinReturn = service.coinReturn(safe_coin);
//		
//		
//		
//		
//		// 실패 시
//		if(dealCancel == 0) {
//			model.addAttribute("msg", "거래취소 실패!");
//			return "fail_back";
//		}
//		
//		model.addAttribute("pageNum", pageNum);
//		
//		return "/AdminDealCancelList";
//	}
		
	//========================================================================================
	
	
	
}
