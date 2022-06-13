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

import com.itwillbs.cono.service.MypageService;
import com.itwillbs.cono.vo.CoinDTO;
import com.itwillbs.cono.vo.CouponDTO;
import com.itwillbs.cono.vo.MemberDTO;
import com.itwillbs.cono.vo.PaymentDTO;

@Controller
public class MypageController {

	@Autowired
	private MypageService service;

	// 1. mypage 화면 이동
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String mypage(HttpSession session, Model model) {
		String sId = (String) session.getAttribute("sId");

		// 코인 잔액
		String coin_total = service.getCoinTotal(sId);
		model.addAttribute("coin_total", coin_total);
		
		// 예약 상품 수
//		int reservedCount = service.getReservedCount(sId);
//		model.addAttribute("reservedCount",reservedCount);
		
		// 쿠폰 수
		int couponCount = service.getCouponCount(sId);
		model.addAttribute("couponCount", couponCount);
		
		// 찜 상품 수
		int wishCount = service.getWishItemCount(sId);
		model.addAttribute("wishCount", wishCount);
		// 장바구니 상품 수
//		int basketCount = service.getBasketCount(sId);
//		model.addAttribute("basketCount", basketCount);
		
		// 구매완료 상품
		List<HashMap<String, String>> purchasedList = service.getPurchasedList(sId);
		model.addAttribute("purchasedList",purchasedList);
		
		return "mypage/mypage";
	}

	// 2. 최근조회화면 첫 이동
	@RequestMapping(value = "recentViewList", method = RequestMethod.GET)
	public String recentView(@RequestParam(defaultValue = "1") int pageNum, Model model, HttpSession session) {
		// 페이징 처리에 필요한 전체 게시물 수 조회 - getRecentViewListCount()
		// => 파라미터 : 없음, 리턴타입 : int(listCount)
		// => 게시물이 없을 경우 null 이 아닌 0 이 리턴되므로 Integer 대신 int 사용 가능
//		int listCount = service.getRecentViewListCount();
//		int listLimit = 10; // 한 페이지 당 표시할 게시물 목록 갯수
//		int pageLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수
//
//		int maxPage = (int) Math.ceil((double) listCount / listLimit);
//		int startPage = ((int) ((double) pageNum / pageLimit + 0.9) - 1) * pageLimit + 1;
//		int endPage = startPage + pageLimit - 1;
//		if (endPage > maxPage) {
//			endPage = maxPage;
//		}
//
//		int startRow = (pageNum - 1) * listLimit;
//
//		PageInfo pageInfo = new PageInfo();
//		pageInfo.setPageNum(pageNum);
//		pageInfo.setMaxPage(maxPage);
//		pageInfo.setStartPage(startPage);
//		pageInfo.setEndPage(endPage);
//		pageInfo.setListCount(listCount);
//		pageInfo.setStartRow(startRow);
//		pageInfo.setListLimit(listLimit);

		String sId = (String)session.getAttribute("sId");

		List<List<String>> recentViewList = service.getRecentViewList(sId);
		System.out.println(recentViewList);
		model.addAttribute("recentViewList", recentViewList);

		return "mypage/list_recentView";
	}

	// 팔로잉 & 팔로워
	@RequestMapping(value = "follow", method = RequestMethod.GET)
	public String follow(HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		// 팔로잉 팔로워 정보 
		List<HashMap<String, String>> followingList = service.getfollowingList(sId);
		List<HashMap<String, String>> followerList = service.getfollowerList(sId);
		// 팔로잉 팔로워 수
		int followingCount = service.getFollowingCount(sId);
		int followerCount = service.getFollowerCount(sId);
		model.addAttribute("followingList", followingList);
		model.addAttribute("followerList", followerList);
		model.addAttribute("followingCount", followingCount);
		model.addAttribute("followerCount", followerCount);

		return "mypage/list_follow";
	}
	
	// 언팔
	@RequestMapping(value = "deleteFollowing", method = RequestMethod.GET)
	public String deleteFollowing (HttpSession session, Model model, String shop_idx) {
		String sId = (String)session.getAttribute("sId");
		
		int deleteCount = service.deleteFollowing(sId, shop_idx);
		System.out.println(deleteCount);
		
		return "mypage/list_follow";
	}
 
	// 나의 후기 ( 구매 후기 작성 / 내가 쓴 후기 확인)

	// 알림

	// 회원 정보 수정페이지 이동
	@RequestMapping(value = "memberInfo_modify", method = RequestMethod.GET)
	public String modify(Model model, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		MemberDTO member = service.getMemberDetail(sId); // 기존 데이터 자동 입력

		model.addAttribute("member", member);
		System.out.println(member);
		return "mypage/list_memberInfo_modify_form"; // 폼
	}

	@RequestMapping(value = "memberInfo_modify", method = RequestMethod.POST)
	public String modify(HttpSession session, MemberDTO member, Model model) {
		String sId = (String)session.getAttribute("sId");

		int updateCount = service.modifyMember(sId, member);

		if (updateCount == 0) {
			model.addAttribute("msg", "정보 수정 실패");
			return "fail_back";
		}
		session.invalidate();
		
		return "redirect:/";
	}

	// 계좌 정보 관리
	@RequestMapping(value = "accountInfo", method = RequestMethod.GET)
	public String account(HttpSession session, Model model) {
		return "mypage/list_account";
	}
	// 회원 탈퇴
	@RequestMapping(value = "delete_id", method = RequestMethod.GET)
	public String delete_id (HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		
		String coin_total = service.getCoinTotal(sId);
		model.addAttribute("coin_total", coin_total);
		return "mypage/list_delete_id";
	}
	// ===============================================

	// 코인 이용 내역
	@RequestMapping(value = "coin", method = RequestMethod.GET)
	public String coin(HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");

//			int listCount = service.getCoinListCount(sId);	// 전체 코인 내역 수
//			int listLimit = 10; // 한 페이지 당 표시할 목록 갯수
//			int pageLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수
//			
//			// 페이징 처리를 위한 계산 작업
//			int maxPage = (int)Math.ceil((double)listCount / listLimit);
//			int startPage = ((int)((double)pageNum / pageLimit + 0.9) - 1) * pageLimit + 1;
//			int endPage = startPage + pageLimit - 1;
//			if(endPage > maxPage) {
//				endPage = maxPage;
//			}
//			// 조회 시작 게시물 번호(행 번호) 계산
//			int startRow = (pageNum - 1) * listLimit;
//			
//			// 페이징 처리 정보를 PageInfo 객체에 저장
//			PageInfo pageInfo = new PageInfo();
//			pageInfo.setPageNum(pageNum);
//			pageInfo.setMaxPage(maxPage);
//			pageInfo.setStartPage(startPage);
//			pageInfo.setEndPage(endPage);
//			pageInfo.setListCount(listCount);
//			pageInfo.setStartRow(startRow);
//			pageInfo.setListLimit(listLimit);

		String coin_total = service.getCoinTotal(sId);
		List<CoinDTO> coin = service.getCoinInfoList(sId);
//		System.out.println(coin.toString());
//			
		model.addAttribute("coin_total", coin_total);
		model.addAttribute("coin", coin);
		System.out.println(coin.isEmpty());
		return "mypage/center_coin";
	}

	// 코인 결제 창 이동
	@RequestMapping(value = "payment", method = RequestMethod.POST)
	public String coinPayment(HttpSession session, Model model, String payment_value) {
		String sId = (String)session.getAttribute("sId");
		service.setPaymentInfo(sId, payment_value);
		PaymentDTO payment = service.getPaymentInfo(sId);
		model.addAttribute("payment", payment);
		return "mypage/center_coin_payment";
	}
	
	// 코인 충전
	@RequestMapping(value = "addCoin", method = RequestMethod.GET)
	public String coinAdd (HttpSession session, String payment_value) {
		String sId = (String)session.getAttribute("sId");
		String balance = service.getCoinTotal(sId);
		service.setCoinAdd(sId, payment_value, balance);
		
		return "redirect:/mypage";
	}

	// 쿠폰
	@RequestMapping(value = "coupon", method = RequestMethod.GET)
	public String coupon(HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");

		List<CouponDTO> couponList = service.getCouponList(sId);
		model.addAttribute("couponList", couponList);
		return "mypage/center_coupon";
	}
	// 예약중인 상품 조회
//	@RequestMapping(value = "reserved", method = RequestMethod.GET)
//	public String reserved(HttpSession session, Model model) {
//		String sId = (String) session.getAttribute("sId");
//
//		List<HashMap<String, String>> reservedList = service.getReservedList(sId);
//		model.addAttribute("reservedList",reservedList);
//		return "mypage/center_reservedList";
//	}
	// 위시 리스트 (양윤석)
	@RequestMapping(value = "wish", method = RequestMethod.GET)
	public String wish(HttpSession session, Model model) {
		String sId = (String) session.getAttribute("sId");
		// 위시 리스트 상품
		List<HashMap<String, String>> wishList = service.getwishList(sId);
		model.addAttribute("wishList", wishList);
		return "mypage/list_wish";
	}
	// 장바구니
//	@RequestMapping(value = "basket", method = RequestMethod.GET)
//	public String basket(HttpSession session, Model model) {
//		String sId = (String) session.getAttribute("sId");
//
//		List<HashMap<String, String>> basketList = service.getBasketList(sId);
//		model.addAttribute("basketList",basketList);
//
//		return "mypage/center_basket";
//	}

	// 구매완료
//	@RequestMapping(value = "purchased", method = RequestMethod.GET)
//	public String purchased(HttpSession session, Model model) {
//		String sId = (String) session.getAttribute("sId");
//
//		List<HashMap<String, String>> purchasedList = service.getPurchasedList(sId);
//		model.addAttribute("purchasedList",purchasedList);
//		return "redirect:/mypage";
//	}
	

}
