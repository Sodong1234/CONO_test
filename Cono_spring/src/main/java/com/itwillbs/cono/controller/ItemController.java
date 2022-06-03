package com.itwillbs.cono.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.cono.service.ItemService;
import com.itwillbs.cono.vo.CategoryDTO;
import com.itwillbs.cono.vo.ItemDTO;

@Controller
public class ItemController {
	
	@Autowired
	ItemService service;
	
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
	
	// -------------------- 상품 조회(리스트) (시작) - 이소영 ------------------
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
	
	// ----------------- 상품 숨김 기능 (시작) - 이소영 ------------------------
		@RequestMapping(value = "/ItemHide.shop", method = RequestMethod.GET)
		public String hideItem(String item_idx, String item_hide, Model model) {
			
			int updateCount = service.updateItemHide(item_idx, item_hide);
			
			if(updateCount > 0) {
				return "redirect:/ItemMng.shop";
			} else {
				model.addAttribute("msg", "상품 숨김 실패");
	        	return "fail_back";
			}
			
		}
	// -------------------------------------------------------------------------
		
	// ------------------ 상품 상세 정보 조회 (시작) - 이소영 ------------------
		@RequestMapping(value = "/ItemDetail.shop", method = RequestMethod.GET)
		public String selectItemDetail(String item_idx, Model model) {
			
			
			
			return "myshop/item_detail";
		}
	// -------------------------------------------------------------------------
}
