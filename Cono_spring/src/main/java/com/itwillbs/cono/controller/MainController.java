package com.itwillbs.cono.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.cono.service.MainService;
import com.itwillbs.cono.vo.MemberDTO;


@Controller
public class MainController {
	
	@Autowired
	MainService service;
	
	// 홈 버튼 클릭시 - 메인 페이지 이동
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String home() {
		return "redirect:/";
	}
	
	@RequestMapping(value = "/MemberLogin.func", method = RequestMethod.GET)
	public String login() {
		return "member/login";
	}
	
	// 로그인
	@RequestMapping(value = "/MemberLoginPro.func", method = RequestMethod.POST)
	public String login(@ModelAttribute MemberDTO member, Model model, HttpSession session) {
		
		MemberDTO memberResult = service.loginMember(member);
		
		if(memberResult == null) {
			model.addAttribute("msg", "가입 실패!");
			return "member/fail_back";
		} else {
			session.setAttribute("sId", memberResult.getMember_id());
			return "redirect:/";
		}
	}
	// 로그아웃
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.getAttribute("sId");
		session.invalidate();
		return "redirect:/";
	}
	
	// 회원가입 창이동 
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join() {
		return "main/join";
	}
	// 회원가입 프로 - 회원가입 쿠폰 지급
	@RequestMapping(value = "joinPost", method = RequestMethod.POST)
	public String joinPost(@RequestParam MemberDTO member, Model model) {
		
		int insertCount = service.joinMember(member);
		
		if(insertCount == 1) {
			service.joinCoupon(member.getMember_id());	// 회원가입 쿠폰 DB 입력
			model.addAttribute("msg","회원가입을 축하합니다! 가입 축하 쿠폰이 지급되었습니다!");
			return "success_msg";
		} else {
			model.addAttribute("msg","회원가입 실패!");
			return "fail_msg";
		}
	}
}
