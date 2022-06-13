package com.itwillbs.cono.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.cono.service.MainService;
import com.itwillbs.cono.vo.ItemDTO;
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
	
	// 로그인창 이동
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		return "member/login";
	}
	
	// 로그인
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(@ModelAttribute MemberDTO member, Model model, HttpSession session) {
		String pass = member.getMember_pass();
		String algorithm = "SHA-256";
		String result = hashing(algorithm, pass);
		member.setMember_pass(result);

		MemberDTO memberResult = service.loginMember(member);

		if(memberResult == null) {
			model.addAttribute("msg", "로그인 실패");
			return "member/fail_back";
		} else {
			String member_nick = memberResult.getMember_nick();
			System.out.println(member_nick);
			session.setAttribute("sId", memberResult.getMember_id());
			session.setAttribute("member_nick", member_nick);
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
	
	// 회원가입 방법 선택창 이동
	@RequestMapping(value = "joinHow", method = RequestMethod.GET)
	public String joinHow() {
		return "member/joinHow";
	}
	
	// 회원가입 창이동 
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join() {
		return "member/join";
	}
	// 회원가입 프로 - 회원가입 쿠폰 지급
	@RequestMapping(value = "joinPost", method = RequestMethod.POST)
	public String joinPost(@ModelAttribute MemberDTO member, Model model) {
		// 비밀번호 암호화
		String pass = member.getMember_pass();
		String algorithm = "SHA-256";
		String result = hashing(algorithm, pass);
		member.setMember_pass(result);
		
		int insertCount = service.joinMember(member);
		System.out.println(insertCount);
		
		if(insertCount > 0) {
			service.setShopInfo(member.getMember_id(), member.getMember_nick());  // 회원가입 시 상점 기본 정보 입력
			service.joinCoupon(member.getMember_id());	// 회원가입 쿠폰 DB 입력
			model.addAttribute("msg","회원가입을 축하합니다! 가입 축하 쿠폰이 지급되었습니다!");
			return "member/success_msg";
		} else {
			model.addAttribute("msg","회원가입 실패!");
			return "fail_msg";
		}
	}
	
	// 16진수 암호화
	
	private String hashing(String algorithm, String strPlaintext) {
		String strHashedData = "";
		try {
			MessageDigest md = MessageDigest.getInstance(algorithm);
			
			byte[] byteText = strPlaintext.getBytes();
			System.out.println(Arrays.toString(byteText));
			
			md.update(byteText);
			
			byte[] digest = md.digest();
			
			for(byte b : digest) {
				strHashedData += Integer.toHexString(b & 0xFF).toUpperCase();
			}
		} catch (NoSuchAlgorithmException e) {
			System.out.println("입력한 암호화 알고리즘 존재 x");
			e.printStackTrace();
		}
		System.out.println(strHashedData);
		return strHashedData;
	}
	
	// 검색
	@RequestMapping(value = "search_item", method = RequestMethod.GET)
	public String search_item(String searchText, Model model) {
		List<HashMap<String, String>>  cardList = service.getCardList("%" + searchText + "%");
		model.addAttribute("searchText", searchText);
		model.addAttribute("cardList", cardList);
		return "search/search_item";
	}
	
	@RequestMapping(value = "search_category", method = RequestMethod.GET)
	public String search_item_fashion(Model model, String cgr) {
		List<HashMap<String, String>>  cardList = service.getCategoryCardList(cgr);
		model.addAttribute("cardList", cardList);
		return "search/search_item";
	}
	
	// 무한 스크롤
//	@RequestMapping(value="/infiniteScrollDown", method = RequestMethod.POST)
//	public @ResponseBody List<HashMap<String, String>> infiniteScrollDownPOST(@RequestBody HashMap<String, String> card ) {
//			card.keySet();
//			Integer item_idxTostart = card.;
//			return service.infiniteScrollDown(item_idxTostart);
//	}
	
	
	// 실시간 인기순위 - 김혜은
	@RequestMapping(value = "/hotItem", method = RequestMethod.GET)
	public String HotItem(HttpSession session) {
		
		List<ItemDTO> hotList = service.getHotItemList();
		System.out.println(hotList);
		
		session.setAttribute("hotList", hotList);
		return "redirect:/";
	}
	
	
	
	
	
	
	
}
