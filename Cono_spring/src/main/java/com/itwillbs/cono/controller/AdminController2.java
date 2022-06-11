package com.itwillbs.cono.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.cono.service.AdminService2;
import com.itwillbs.cono.vo.PageInfo;

@Controller
public class AdminController2 {
	
	@Autowired
	AdminService2 service;
	
	// ------ 회원 관리 리스트 (관리자) - 김혜은 ------
	@RequestMapping(value = "/AdminMemberList", method = RequestMethod.GET)
	public String MemberList(@RequestParam(defaultValue = "") String searchType, @RequestParam(defaultValue = "") String search,
			@RequestParam(defaultValue = "1") int pageNum, Model model) {
		
		int listLimit = 15;	// 페이지 당 글 목록 갯수
		int pageLimit = 5;	// 페이지 당 페이지 목록 갯수
		
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
	
	
	@RequestMapping(value = "/AdminMemberList", method = RequestMethod.POST)
	public String MemberListPost(@RequestParam(defaultValue = "") String searchType, @RequestParam(defaultValue = "") String search,
			@RequestParam(defaultValue = "1") int pageNum, Model model) {
		
		int listLimit = 15;	// 페이지 당 글 목록 갯수
		int pageLimit = 5;	// 페이지 당 페이지 목록 갯수
		
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
	
	// ------ 회원 탈퇴  (관리자) - 김혜은 ------
	@RequestMapping(value = "/AdminMemberExit", method = RequestMethod.GET)
	public String adminMemberExit() {
		
		return "";
	}
	
	// ------ 회원 탈퇴  (관리자) - 김혜은 ------
	@RequestMapping(value = "/AdminMemberExit", method = RequestMethod.POST)
	public String adminMemberExitPost() {
		
		return "";
	}
	
	
	// ------ 거래 리스트 (관리자) - 김혜은
	@RequestMapping(value = "/AdminDealList", method = RequestMethod.GET)
	public String dealList(@RequestParam(defaultValue = "1")int pageNum, Model model) {
		
		// 페이징 처리
		int listLimit = 10;
		int pageLimit = 5;
		
		// 현재 거래 수 조회
		int listCount = service.getAdminDealListCount();
		System.out.println(listCount);
		
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
	
	
	
	
	
	
	
}
