package com.itwillbs.cono.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.cono.service.MainService;
import com.itwillbs.cono.vo.MemberDTO;


@Controller
public class MainController {
	
	@Autowired
	MainService service;
	
	@RequestMapping(value = "/MemberLogin.func", method = RequestMethod.GET)
	public String login() {
		return "member/login";
	}
	
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
}
