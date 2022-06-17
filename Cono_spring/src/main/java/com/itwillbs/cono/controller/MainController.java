package com.itwillbs.cono.controller;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	// 카카오로그인 / 회원가입 
	@RequestMapping(value = "/kakao_callback", method = RequestMethod.GET)
    public String redirectkakao(@RequestParam String code, HttpSession session, Model model) throws IOException {
        System.out.println("code:: " + code);

        // 접속토큰 get
        String kakaoToken = service.getReturnAccessToken(code);
        
        
        System.out.println("카카오토큰 : " + kakaoToken);
        // 접속자 정보 get
        Map<String, Object> result = service.getUserInfo(kakaoToken);
        String id = (String) result.get("id");
        
        String userName = (String) result.get("nickname");
        String email = (String) result.get("email");
        String birth = (String) result.get("birth");
        String pass = id;
        int num = (int)(Math.random()*100000000)+1;
        String phone = "010" + Integer.toString(num);
        // 분기
        MemberDTO member = new MemberDTO();
        member.setMember_id(email.split("@")[0]);
        member.setMember_pass(pass);
        member.setMember_nick(userName);
        member.setMember_email(email);
        member.setMember_birth(birth);
        member.setMember_phone(phone);
        
        // 일치하는 snsId 없을 시 회원가입
        System.out.println(service.loginMember(member));
        if (service.loginMember(member) == null) {
            service.joinMember(member);
            service.setShopInfo(member.getMember_id(), member.getMember_nick());  // 회원가입 시 상점 기본 정보 입력
			service.joinCoupon(member.getMember_id());	// 회원가입 쿠폰 DB 입력
			model.addAttribute("msg","회원가입을 축하합니다! 가입 축하 쿠폰이 지급되었습니다!");
			return "member/success_msg";
        }

        /* 로그아웃 처리 시, 사용할 토큰 값 */
        session.setAttribute("sId", kakaoToken);
        session.setAttribute("member_nick", userName);

        return "redirect:/";

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
	public String search_item(String searchText, Model model, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		
		List<HashMap<String, String>>  cardList = service.getCardList("%" + searchText + "%");
		
		// 최근 조회
		List<HashMap<String, String>> getRecent = service.getRecent(sId);
		
		model.addAttribute("searchText", searchText);
		model.addAttribute("cardList", cardList);
		model.addAttribute("getRecent", getRecent);
		return "search/search_item";
	}
	
	@RequestMapping(value = "search_category", method = RequestMethod.GET)
	public String search_item_fashion(Model model, String cgr, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		List<HashMap<String, String>>  cardList = service.getCategoryCardList(cgr);
		// 최근 조회
		List<HashMap<String, String>> getRecent = service.getRecent(sId);
		
		model.addAttribute("cardList", cardList);
		model.addAttribute("getRecent", getRecent);
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
