package com.itwillbs.cono.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.cono.service.AdminService2;
import com.itwillbs.cono.vo.MemberDTO;
import com.itwillbs.cono.vo.PageInfo;

@Controller
public class AdminController2 {
	
	@Autowired
	AdminService2 service;
	
	// ------ 회원 관리 리스트 (관리자) - 김혜은 ------
	@RequestMapping(value = "/AdminMemberList", method = RequestMethod.GET)
	public String MemberList(@RequestParam(defaultValue = "") String searchType, @RequestParam(defaultValue = "") String search,
			@RequestParam(defaultValue = "1") int pageNum, Model model) {
		
		int listCount = service.getMemberListCount(searchType, "%" + search + "%");
		
		int listLimit = 15;	// 페이지 당 글 목록 갯수
		int pageLimit = 5;	// 페이지 당 페이지 목록 갯수
		
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
		
//		// 회원 리스트
		List<MemberDTO> memberList = service.getMemberList(searchType, "%" + search + "%", pageInfo);
		
		// Model 객체에 저장
		model.addAttribute("memberList", memberList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "redirect:/userCenter/admin_member_list";
	}
	
	
	// 거래 리스트
	@RequestMapping(value = "AdminDealList", method = RequestMethod.GET)
	public String dealList() {
		return "userCenter/admin_deal_list";
	}
	
	
	
	
	
	
	
}
