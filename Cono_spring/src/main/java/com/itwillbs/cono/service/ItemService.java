package com.itwillbs.cono.service;

import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.itwillbs.cono.mapper.ItemMapper;
import com.itwillbs.cono.vo.ImgDTO;

@Service
public class ItemService {
	
	@Autowired
	ItemMapper mapper;
	
	// 상품 상세 정보 조회
	public HashMap<String, String> selectItemDetail(String item_idx) {
		return mapper.selectItemDetail(item_idx);
	}
	
	// 상품 이미지 조회
	public List<ImgDTO> selectImgList(String item_idx) {
		return mapper.selectImgList(item_idx);
	}
	
}
