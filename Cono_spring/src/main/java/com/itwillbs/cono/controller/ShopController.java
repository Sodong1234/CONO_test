package com.itwillbs.cono.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.cono.service.ShopService;
import com.itwillbs.cono.vo.CategoryDTO;
import com.itwillbs.cono.vo.ItemDTO;
import com.itwillbs.cono.vo.ShopDTO;

@Controller
public class ShopController {
	
	@Autowired
	ShopService service;
	
	// ---------------------- 내 상점 조회 - 문현진 ----------------------------
	@RequestMapping(value = "/ProductMyshop.shop", method = RequestMethod.GET)
	public String myShop(HttpSession session, Model model) {
		
		String member_id = session.getAttribute("sId").toString();
		
		// 상점 정보 조회
		ShopDTO myShop = service.getMyShop(member_id);
		
		String[] myShopCountInfo = new String[2];
		
		// 상점 판매 횟수 조회
		myShopCountInfo[0] = service.getShopSellCnt(member_id);
		// 상점 상품 개수 조회
		myShopCountInfo[1] = service.getShopItemCnt(member_id);
		
		// 팔로워 수 & 상점 등록일 조회
		
		model.addAttribute("myShop", myShop);
		model.addAttribute("myShopCountInfo", myShopCountInfo);
		
		return "myshop/my_page";
	}
	// -------------------------------------------------------------------------
	
	// ---------------------- 상품 등록 페이지 이동 - 이소영  ------------------
	@RequestMapping(value = "/ItemUploadForm.shop", method = RequestMethod.GET)
	public String uploadItem() {
		return "myshop/item_upload";
	}
	// -------------------------------------------------------------------------
	
	// -------------------- 상품 등록 비즈니스 로직 - 이소영  ------------------
	@RequestMapping(value = "/ItemUploadPro.shop", method = RequestMethod.POST)
	public String uploadItemPost(MultipartFile uploadFile, @ModelAttribute ItemDTO item, @ModelAttribute CategoryDTO category, Model model) {
		System.out.println(uploadFile);
//		boolean isUploadSuccess = service.uploadItem(item,category);
		return "ItemUploadPro.shop";
	}
	// -------------------------------------------------------------------------
}
