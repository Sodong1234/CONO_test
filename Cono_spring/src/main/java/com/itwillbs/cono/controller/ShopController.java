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
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.cono.service.ShopService;
import com.itwillbs.cono.vo.CategoryDTO;
import com.itwillbs.cono.vo.ImgDTO;
import com.itwillbs.cono.vo.ItemDTO;
import com.itwillbs.cono.vo.MemberDTO;
import com.itwillbs.cono.vo.ShopDTO;

@Controller
public class ShopController {
	
	@Autowired
	ShopService service;
	
	// ---------------------- 내 상점 조회 - 문현진 ----------------------------
	@RequestMapping(value = "/ProductMyshop.shop", method = RequestMethod.GET)
	public String myShop(HttpSession session, Model model) {
		
		String member_id = session.getAttribute("sId").toString();
		
		if(member_id == null) {
			return "redirect:/login";
		}
		
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
	
	// ---------------------- 상품 등록 페이지 이동 - 이소영  ------------------
	@RequestMapping(value = "/ItemUploadForm.shop", method = RequestMethod.GET)
	public String uploadItem() {
		
		return "myshop/item_upload";
	}
	// -------------------------------------------------------------------------
	
	// -------------------- 상품 등록 비즈니스 로직 - 이소영  ------------------
	@RequestMapping(value = "/ItemUploadPro.shop", method = RequestMethod.POST)
	public String uploadItemPost(@ModelAttribute ItemDTO item, @ModelAttribute CategoryDTO category, MultipartFile[] upload, HttpServletRequest request, HttpSession session, Model model) {
        
		String member_id = session.getAttribute("sId").toString();
		
        boolean isUploadSuccess = service.uploadItem(item, category, upload, request, member_id);
        
        if(!isUploadSuccess) {
        	model.addAttribute("msg", "상품 등록 실패");
        	return "fail_back";
        }
        
		return "redirect:/ProductMyshop.shop";
	}
	// -------------------------------------------------------------------------
	
	// ------------------------- 상품 조회(리스트) - 이소영 --------------------
	@RequestMapping(value = "/ItemMng.shop", method = RequestMethod.GET)
	public String selectItemList(String keyword, String sell_status, HttpSession session, Model model) {
		
		String member_id = session.getAttribute("sId").toString();
		
		List<HashMap<String, String>> itemList = service.selectItemList(member_id, keyword, sell_status);
		model.addAttribute("itemList", itemList);
		model.addAttribute("keyword", keyword);
		model.addAttribute("sell_status", sell_status);
		return "myshop/item_mng";
	}
	// -------------------------------------------------------------------------
	
	// --------------------- 상품 숨김 기능 - 이소영 ---------------------------
	@RequestMapping(value = "/ItemHide.shop", method = RequestMethod.GET)
	public String hideItem(String item_idx, String item_hide, Model model) {
		
		int updateCount = service.updateItemHide(item_idx, item_hide);
		
		if(updateCount > 0) {
			return "redirect:/ItemMng.shop";
		} else {
			model.addAttribute("msg", "상품 숨김 실패");
        	return "redirect:/fail_back";
		}
		
	}
	// -------------------------------------------------------------------------
		
	// ----------------------- 상품 상세 정보 조회 - 이소영 --------------------
	@RequestMapping(value = "/ItemDetail.shop", method = RequestMethod.GET)
	public String selectItemDetail(String item_idx, Model model, HttpServletRequest request) {
		
		// 상품 상세 정보 조회
		HashMap<String, String> itemDetail = service.selectItemDetail(item_idx); 
		
		// 상품 이미지 조회
		List<ImgDTO> imgList = service.selectImgList(item_idx);
		model.addAttribute("itemDetail", itemDetail);
		model.addAttribute("imgList", imgList);
		
		return "myshop/item_detail";
	}
	// -------------------------------------------------------------------------
		
	// ------------ 상품 상세 정보 수정 원본 데이터 조회 - 이소영 --------------
	@RequestMapping(value = "/ItemModifyForm.shop", method = RequestMethod.GET)
	public String modifyItem(String item_idx, Model model) {
		
		// 상품 상세 정보 조회
		HashMap<String, String> itemDetail = service.selectItemDetail(item_idx);
		
		// 상품 이미지 조회
		List<ImgDTO> imgList = service.selectImgList(item_idx);
		model.addAttribute("itemDetail", itemDetail);
		model.addAttribute("imgList", imgList);
		
		
		return "myshop/item_modify";
	}
	// -------------------------------------------------------------------------
	
	// -------------- 상품 상세 정보 수정 비즈니스 로직 - 이소영 ---------------
	@RequestMapping(value = "/ItemModifyPro.shop", method = RequestMethod.POST)
	public String modifyItemPost(String item_idx, String imgStatus, ItemDTO item, CategoryDTO category, MultipartFile[] upload, HttpServletRequest request, Model model) {
		
		item.setItem_idx(item_idx);
		
		service.modifyItem(imgStatus, item, category, upload, request);
		
		model.addAttribute("item_idx", item_idx);
		
		return "redirect:/ItemDetail.shop";
	}
	// -------------------------------------------------------------------------
	
	// -------------------- 상품 삭제 페이지 이동 - 이소영 ---------------------
	@RequestMapping(value = "/ItemDelete.shop", method = RequestMethod.GET)
	public String deleteItem(String item_idx, Model model) {
		
		return "myshop/item_delete";
	}
	// -------------------------------------------------------------------------
	
	// -------------------- 상품 삭제 비즈니스 로직 - 이소영 -------------------
	@RequestMapping(value = "/ItemDeletePro.shop", method = RequestMethod.POST)
	public String deleteItemPost(MemberDTO member, String item_idx, HttpServletRequest request, Model model) {
		
		boolean isDeleteSuccess = service.deleteItem(member, item_idx, request);
		
		if(!isDeleteSuccess) {
			model.addAttribute("msg", "상품 삭제 실패");
        	return "redirect:/fail_back";
		}
		return "redirect:/ItemMng.shop";
	}
	// -------------------------------------------------------------------------
	
	// ----------------------- 상품 후기 조회 - 이소영 -------------------------
	
	// -------------------------------------------------------------------------
	
	// --------------- 내상점 수정 원본 데이터 조회 - 문현진 -------------------
	@RequestMapping(value = "/ProductMyshopModifyForm.shop", method = RequestMethod.GET)
	public String getMyShop(HttpSession session, Model model) {
		
		String member_id = session.getAttribute("sId").toString();
		
		// 상점 정보 조회
		ShopDTO myShop = service.getMyShop(member_id);
		
		model.addAttribute("myShop", myShop);
		
		return "myshop/my_page_modify";
	}
	// -------------------------------------------------------------------------
	
	// ---------------- 내상점 수정 비즈니스 로직 - 문현진 ---------------------
	@RequestMapping(value = "/ProductMyshopModifyPro.shop", method = RequestMethod.POST)
	public String getMyShopPost(HttpSession session, HttpServletRequest request, MemberDTO member, ShopDTO shop, MultipartFile upload, Model model) {
		
		member.setMember_id(session.getAttribute("sId").toString());
		
		MemberDTO memberResult = service.checkMember(member);
		
		if(memberResult == null) {
			model.addAttribute("msg", "비밀번호 틀림");
			return "fail_back";
		}
		
		service.modifyMyshop(request, shop, upload, member);
		
		return "redirect:/ProductMyshop.shop";
	}
	// -------------------------------------------------------------------------
	
}
