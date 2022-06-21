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
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.cono.service.MypageService;
import com.itwillbs.cono.vo.CancelDTO;
import com.itwillbs.cono.vo.CoinDTO;
import com.itwillbs.cono.vo.CouponDTO;
import com.itwillbs.cono.vo.MemberDTO;
import com.itwillbs.cono.vo.PageInfo;
import com.itwillbs.cono.vo.PaymentDTO;
import com.itwillbs.cono.vo.ReviewDTO;

@Controller
public class MypageController {

	@Autowired
	private MypageService service;
	// 비밀번호 암호화 
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
	
	
	// 1. mypage 화면 이동
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String mypage(HttpSession session, Model model) {
		String sId = (String) session.getAttribute("sId");

		// 코인 잔액
		String coin_total = service.getCoinTotal(sId);
		// 6543210
//		for(int i=1; i<coin_total.length()+1; i++) {
//			if(i%3 == 0) {
//				
//			}
//		}
		
		model.addAttribute("coin_total", coin_total);
		System.out.println("Coin_total : " + coin_total);
		// 예약 상품 수
//		int reservedCount = service.getReservedCount(sId);
//		model.addAttribute("reservedCount",reservedCount);
		// 구매 중 상품 수
		int waitingCount = service.getWaitingCount(sId);
		model.addAttribute("waitingCount", waitingCount);
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
		
		// 취소 상품
		List<HashMap<String, String>> canceledList = service.getCanceledList(sId);
		model.addAttribute("canceledList",canceledList);
		
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


	// 내가 구매한 제품 리스트 확인
	@RequestMapping(value = "readOrdList", method = RequestMethod.GET)
	public String readReview(@RequestParam(defaultValue = "1") int pageNum, HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		
		int listCount = service.getPurchaseListCount(sId);
		int listLimit = 10; // 한 페이지 당 표시할 목록 갯수
		int pageLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수
		
		// 페이징 처리를 위한 계산 작업
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		int startPage = ((int)((double)pageNum / pageLimit + 0.9) - 1) * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
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
		List<HashMap<String, String>> purchaseList = service.getReadPurchaseList(sId, pageInfo);
		
		model.addAttribute("purchaseList", purchaseList);
		model.addAttribute("pageInfo", pageInfo);
		return "mypage/list_read_ord_list";
	}
	
	// 구매 확정
	@RequestMapping(value = "confirmPurchase", method = RequestMethod.GET)
	public String confirmPurchase(HttpSession session, String item_idx, String ord_date, Model model) {
		
		String sId = (String)session.getAttribute("sId");
		// 판매자 아뒤 찾기
		String shop_member_id = service.selectShop_idx(item_idx);
		
		// ord 테이블 변경
		service.confirmPurchase(sId, item_idx, ord_date);
		
		// safe_coin
		String safe_coin = service.selectSafeCoin(sId, item_idx, ord_date);
		
		// coin_total
		String coin_total = service.selectCoinTotal(sId);
		
		// 판매자 코인 입금
		service.insertCoinSeller(item_idx, ord_date, shop_member_id, safe_coin, coin_total);
		
		// safe 테이블 status 변경
		service.modifySafeStatus(sId, item_idx, ord_date);
		model.addAttribute("ord_date", ord_date);
		
		return "redirect:/readOrdList";
	}
	
	// 후기 작성 페이지 이동 - 사진 없는 페이지
	@RequestMapping(value = "writeBasicReview", method = RequestMethod.POST)
	public String writeBasicReview(HttpSession session, String item_idx, String ord_date, Model model) {
		
		HashMap<String, String> itemInfo = service.getItemInfo(item_idx);
		
		model.addAttribute("itemInfo", itemInfo);
		model.addAttribute("ord_date", ord_date);
		return "mypage/review_write";
	}
		
	// 후기 insert 작업
	@RequestMapping(value = "uploadReview", method = RequestMethod.POST)
	public String uploadReview(@ModelAttribute ReviewDTO review, String item_idx, String ord_date, HttpSession session, Model model) {
		String insertCheck = "";
		
		String sId = (String)session.getAttribute("sId");
		System.out.println(sId);
		int insertCnt = service.uploadReview(review, sId, item_idx, ord_date);
		
		if(insertCnt > 0) {
			insertCheck = "done";
		}
		
		model.addAttribute("insertCheck", insertCheck);
		
		return "mypage/review_write";
	}
	
	// 후기 내역 조회
	@RequestMapping(value = "reviewList", method = RequestMethod.GET)
	public String getReviewList(@ModelAttribute ReviewDTO review, String item_idx, HttpSession session, Model model) {
		
		String sId = (String)session.getAttribute("sId");
		
		List<HashMap<String, String>> reviewList = service.getReviewList(sId);
		
		model.addAttribute("reviewList", reviewList);
		return "mypage/list_review_list";
	}
	
	// 회원 정보 수정페이지 진입 전 비밀번호 확인 작업
	@RequestMapping(value = "passCheck", method = RequestMethod.GET)
	public String check(HttpSession session, Model model) {
		
		
		return "member/memberCheck";
	}
	
	@RequestMapping(value = "passCheck", method = RequestMethod.POST)
	public String passCheck(@RequestParam String passwd, Model model, HttpSession session) {
		String algorithm = "SHA-256";
		String result = hashing(algorithm, passwd);
		String sId = (String)session.getAttribute("sId");
		MemberDTO member = service.checkPass(sId, result);
		
		if (member == null) {
			model.addAttribute("msg", "패스워드가 올바르지 않습니다!");
			return "fail_back";
		}
		
		return "redirect:/memberInfo_modify";
	}
	
	
	
	// 회원 정보 수정페이지 이동
	@RequestMapping(value = "memberInfo_modify", method = RequestMethod.GET)
	public String modify(Model model, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		MemberDTO member = service.getMemberDetail(sId); // 기존 데이터 자동 입력

		model.addAttribute("member", member);
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
	
	// 회원탈퇴 창 이동
	@RequestMapping(value = "delete_id", method = RequestMethod.GET)
	public String delete_id(HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		String coin_total = service.getCoinTotal(sId);
		
		model.addAttribute("coin_total", coin_total);
		return "mypage/list_delete_id";
	}
	
	
	
	// 회원 탈퇴 로직
	@RequestMapping(value = "delete_id", method = RequestMethod.POST)
	public String delete(@RequestParam String id, @RequestParam String passwd, HttpSession session, Model model) {
		String algorithm = "SHA-256";
		String result = hashing(algorithm, passwd);
		
		boolean isDeleteSuccess = service.deleteId(id, result);

		if (!isDeleteSuccess) {
			model.addAttribute("msg", "입력 정보가 올바르지 않습니다!");
			return "fail_back";
		}
		
		session.invalidate();
		
		return "redirect:/";
	}
	// ===============================================

	// 코인 이용 내역
	@RequestMapping(value = "coin", method = RequestMethod.GET)
	public String coin(HttpSession session, Model model,@RequestParam(defaultValue = "1")int pageNum) {
		String sId = (String)session.getAttribute("sId");


		int listCount = service.getCoinListCount(sId);
		int listLimit = 10; // 한 페이지 당 표시할 게시물 목록 갯수
		int pageLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수

		// 페이징 처리를 위한 계산 작업
		int maxPage = (int) Math.ceil((double) listCount / listLimit);
		int startPage = ((int) ((double) pageNum / pageLimit + 0.9) - 1) * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if (endPage > maxPage) {
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

		
		String coin_total = service.getCoinTotal(sId);
		List<CoinDTO> coin = service.getCoinInfoList(sId,pageInfo);
		
//		System.out.println(coin.toString());
//			
		model.addAttribute("coin_total", coin_total);
		model.addAttribute("coin", coin);
		model.addAttribute("pageInfo",pageInfo);
		System.out.println(coin.toString());
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
		if(balance == null) {
			balance = "0";
		}
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
	// 구매 중
	@RequestMapping(value = "waiting", method = RequestMethod.GET)
	public String waiting(HttpSession session, Model model) {
		String sId = (String) session.getAttribute("sId");

		List<HashMap<String, String>> waitingList = service.getWaitingList(sId);
		model.addAttribute("waitingList",waitingList);
		
		
		return "mypage/center_waiting";
	}

	// 위시 리스트 (양윤석)
	@RequestMapping(value = "wish", method = RequestMethod.GET)
	public String wish(HttpSession session, Model model) {
		String sId = (String) session.getAttribute("sId");
		// 위시 리스트 상품
		List<HashMap<String, String>> wishList = service.getwishList(sId);
		model.addAttribute("wishList", wishList);
		return "mypage/list_wish";
	}

	// 취소 신청 (가준)
	@RequestMapping(value = "cancelReq", method = RequestMethod.POST)
	public String cancelReq(HttpSession session, Model model, String item_idx, String content) {
		String sId = (String) session.getAttribute("sId");
		
		CancelDTO dto = new CancelDTO();
		dto.setItem_idx(item_idx);
		dto.setMember_id(sId);
		dto.setCancel_content(content);
		
		int insertCount = service.setCancelReq(dto);
		
		if(insertCount > 0) {
			model.addAttribute("msg", "취소 접수가 완료되었습니다.");
		} else {
			model.addAttribute("msg", "취소 접수에 실패하였습니다.");
		}
		return "redirect:/mapage/cancel";
	}
	

}
