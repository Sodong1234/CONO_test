package com.itwillbs.cono.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.cono.service.ItemService;
import com.itwillbs.cono.vo.CouponDTO;
import com.itwillbs.cono.vo.ImgDTO;
import com.itwillbs.cono.vo.OrdDTO;

@Controller
public class ItemController {
	
	@Autowired
	ItemService service;
	
	// ------------------- 상품 상세 정보 조회 (구매자) - 이소영 ---------------
	@RequestMapping(value = "itemDetail", method = RequestMethod.GET)
	public String getItemDetail(String item_idx, Model model, HttpServletRequest request) {
		
		// 상품 상세 정보 조회
		HashMap<String, String> itemDetail = service.getItemDetail(item_idx); 
		
		// 상품 이미지 조회
		List<ImgDTO> imgList = service.selectImgList(item_idx);
		model.addAttribute("itemDetail", itemDetail);
		model.addAttribute("imgList", imgList);

		return "item/item_detail";
	}
	// -------------------------------------------------------------------------
	
	// ------------------------ 상품 구매 시 결제 창 이동 ----------------------
	@RequestMapping(value = "PurchaseItem", method = RequestMethod.POST)
	public String purchaseItem(String item_idx, String order_quantity, String img_name, HttpSession session, Model model) {
		
		String buyer_id = session.getAttribute("sId").toString(); 
		
		// 구매자 정보 가져오기
		HashMap<String, String> buyerInfo = service.getBuyerInfo(buyer_id);
			
		// 상품 정보 가져오기
		HashMap<String, String> itemDetail = service.getItemDetail(item_idx);
		
		// 사용 가능한 할인 쿠폰 조회 
		List<HashMap<String, String>> coupons = service.getUsableCoupon(buyer_id);
		
		// 코인 잔액 조회
		int balanceCoin = service.getBalanceCoin(buyer_id);
		
		model.addAttribute("itemDetail", itemDetail);
		model.addAttribute("buyerInfo", buyerInfo);
		model.addAttribute("coupons", coupons);
		model.addAttribute("balanceCoin", balanceCoin);
		model.addAttribute("order_quantity", order_quantity);
		model.addAttribute("img_name", img_name);
		
		return "item/payment";
	}
	// -------------------------------------------------------------------------
	
	// ----------------------------- 상품 결제 진행 ----------------------------
	@RequestMapping(value = "PayItem", method = RequestMethod.POST)
	public String payItem(HttpSession session, @ModelAttribute CouponDTO coupon, @RequestParam String item_idx, @RequestParam String item_price, OrdDTO ord, Model model) {
		
		String member_id = session.getAttribute("sId").toString();
		
		if(member_id == null) {
			return "redirect:/login";
		}
		ord.setMember_id(member_id);
		
		// 상품 구매 가능 여부 확인(coin)
		boolean checkCoin = service.checkCoinTotal(ord, item_price);
		if(!checkCoin) {
			model.addAttribute("msg", "코인이 부족합니다");
			return "myshop/fail_back";
		}
		
		// item 테이블 수량 변경
		service.modifyItemQuantity(ord);
		
		// item 수량이 0일 경우 판매 완료로 변경
		if(service.checkItemQuantity(ord).equals("0")) {
			service.modifyItemStatus(ord);
		}
		// coupon 테이블 update
		// 가져온 coupon_idx 가 0이면 쿠폰 선택을 안함
		if(coupon.getCoupon_idx().equals("0")) {
			coupon.setCoupon_price("0");
		} else {
			service.updateCoupon(coupon.getCoupon_idx(), item_idx);
		}
		// ord 테이블 insert	
		service.insertOrd(ord);
		
		// safe 테이블 insert
		service.insertSafe(ord, item_price);
		// coin 테이블 insert (구매자)
		service.insertCoin(ord, item_price, coupon.getCoupon_idx());
		
		// coin 테이블 insert (판매자)	==> 아니 판매자는 아직 돈 들어가면 안된다... 바보양..
//		service.insertCoinSeller(ord, item_price);
		
		
		return "redirect:/";
	}
	// -------------------------------------------------------------------------
}
