package com.itwillbs.cono.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

}
