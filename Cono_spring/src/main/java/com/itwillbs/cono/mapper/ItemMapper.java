package com.itwillbs.cono.mapper;

import java.util.HashMap;
import java.util.List;

import com.itwillbs.cono.vo.ImgDTO;

public interface ItemMapper {
	
	// 상품 상세 정보 조회 ddd
	HashMap<String, String> selectItemDetail(String item_idx);
	
	// 상품 이미지 조회 ddd
	List<ImgDTO> selectImgList(String item_idx);
	
}
