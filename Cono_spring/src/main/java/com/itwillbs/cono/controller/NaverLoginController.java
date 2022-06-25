package com.itwillbs.cono.controller;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.itwillbs.cono.service.MainService;
import com.itwillbs.cono.vo.MemberDTO;
import com.itwillbs.cono.vo.NaverLoginBO;

@Controller
public class NaverLoginController {
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@Autowired
	MainService service;
	
	// 로그인페이지
	//로그인 첫 화면 요청 메소드
	
//	@RequestMapping(value = "/naver_login", method = { RequestMethod.GET, RequestMethod.POST })
//	public String login(Model model, HttpSession session) {
//		
//		/* 네아로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
//		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
//		/* 인증요청문 확인 */
//		System.out.println("네이버:" + naverAuthUrl);
//		/* 객체 바인딩 */
//		model.addAttribute("urlNaver", naverAuthUrl);
//
//		/* 생성한 인증 URL을 View로 전달 */
//		return "member/joinHow";
//	}
	
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/naver_login", method = { RequestMethod.GET, RequestMethod.POST })
	public String callbackNaver(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws Exception {
		System.out.println("로그인 성공 callbackNaver");
		OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
	    apiResult = naverLoginBO.getUserProfile(oauthToken);
	    
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj;
		
		jsonObj = (JSONObject) jsonParser.parse(apiResult);
		JSONObject response_obj = (JSONObject) jsonObj.get("response");			
		// 프로필 조회
		String id = (String) response_obj.get("id");
		String email = (String) response_obj.get("email");
		String nickname = (String) response_obj.get("nickname");
		String birthday = (String) response_obj.get("birthday");
		String mobile = (String) response_obj.get("mobile");
		String birthyear = (String) response_obj.get("birthyear");
		
		System.out.println("id : " + id);
		System.out.println("email : " + email);
		System.out.println("nickname : " + nickname);
		System.out.println("birthday : " + birthday);
		
		mobile = mobile.split("-")[0] + mobile.split("-")[1] + mobile.split("-")[2];
		// 세션에 사용자 정보 등록
		// session.setAttribute("islogin_r", "Y");
//		session.setAttribute("signIn", apiResult);
		
		MemberDTO member = new MemberDTO();
        member.setMember_id(email.split("@")[0]);
        member.setMember_pass(id);
        member.setMember_nick(nickname);
        member.setMember_email(email);
        member.setMember_birth(birthyear + "-" + birthday);
        member.setMember_phone(mobile);
	        
        System.out.println("멤버 : " + member.toString());
        // 일치하는 snsId 없을 시 회원가입
        System.out.println(service.loginMember(member));
        
        if (service.loginMember(member) == null) {
            service.joinMember(member);
            service.setShopInfo(member.getMember_id(), member.getMember_nick());  // 회원가입 시 상점 기본 정보 입력
			service.joinCoupon(member.getMember_id());	// 회원가입 쿠폰 DB 입력
			model.addAttribute("msg","회원가입을 축하합니다! 가입 축하 쿠폰이 지급되었습니다!");
			return "member/success_msg";
        }
        session.setAttribute("sId", member.getMember_id());
		session.setAttribute("member_nick", nickname);
		
        /* 네이버 로그인 성공 페이지 View 호출 */
		return "redirect:/";
	}
}
