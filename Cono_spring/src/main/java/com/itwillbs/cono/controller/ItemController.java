package com.itwillbs.cono.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.cono.service.ItemService;
import com.itwillbs.cono.vo.ImgDTO;

@Controller
public class ItemController {
	
	@Autowired
	ItemService service;
	
	// ------------------- 상품 상세 정보 조회 (구매자) - 이소영 ---------------
	@RequestMapping(value = "itemDetail", method = RequestMethod.GET)
	public String getItemDetail(String item_idx, Model model, HttpServletRequest request) {
		
		// 상품 상세 정보 조회
		HashMap<String, String> itemDetail = service.selectItemDetail(item_idx); 
		
		// 상품 이미지 조회
		List<ImgDTO> imgList = service.selectImgList(item_idx);
		model.addAttribute("itemDetail", itemDetail);
		model.addAttribute("imgList", imgList);

		return "item/item_detail";
	}
	// -------------------------------------------------------------------------
}
