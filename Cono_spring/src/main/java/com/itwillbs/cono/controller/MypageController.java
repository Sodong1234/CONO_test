package com.itwillbs.cono.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.cono.service.MypageService;
import com.itwillbs.cono.vo.MemberDTO;
import com.itwillbs.cono.vo.PageInfo;

@Controller
public class MypageController {
	
	@Autowired
	private MypageService service;
	
	// 1. mypage 화면 이동
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String mypage() {
		return "mypage/mypage";
	}
	
	// 2. 최근조회화면 첫 이동
	@RequestMapping(value = "mypage/recentViewList", method = RequestMethod.GET)
	public String recentView(@RequestParam(defaultValue = "1") int pageNum, Model model, HttpSession session) {
		// 페이징 처리에 필요한 전체 게시물 수 조회 - getRecentViewListCount()
		// => 파라미터 : 없음, 리턴타입 : int(listCount)
		// => 게시물이 없을 경우 null 이 아닌 0 이 리턴되므로 Integer 대신 int 사용 가능
		int listCount = service.getRecentViewListCount();
		int listLimit = 10; // 한 페이지 당 표시할 게시물 목록 갯수
		int pageLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수
		
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		int startPage = ((int)((double)pageNum / pageLimit + 0.9) - 1) * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		int startRow = (pageNum - 1) * listLimit;
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPageNum(pageNum);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setStartRow(startRow);
		pageInfo.setListLimit(listLimit);
		
		String sId = (String)session.getAttribute("sId");
		
		List<List<String>> recentViewList = service.getRecentViewList("", "", pageInfo, sId);	
		System.out.println(recentViewList);
		model.addAttribute("recentViewList", recentViewList);
		model.addAttribute("pageInfo", pageInfo);
		
		
		return "mypage/list_recentView";
	}
	
	// 팔로잉 & 팔로워
	
	
		// 나의 후기 ( 구매 후기 작성 / 내가 쓴 후기 확인)
		
		// 알림 
		
		// 1:1 메시지
		
		// 회원 정보 수정
		@RequestMapping(value = "/mypage/memberInfo_modify", method = RequestMethod.GET)
		public String modify(Model model, HttpSession session) {
			String sId = (String)session.getAttribute("sId");
			MemberDTO member = service.getMemberDetail(sId);
			
			model.addAttribute("member",member);
			System.out.println(member);
			return "mypage/memberInfo_modify_form";	// 폼
		}
		
		// 계좌 정보 관리
		
		
		
		// 회원 탈퇴
		
		//===============================================
		
		// 코인 이용 내역
		
		// 쿠폰
		
		// 예약중인 상품 조회

		// 장바구니
		
		// 구매완료
	
}
