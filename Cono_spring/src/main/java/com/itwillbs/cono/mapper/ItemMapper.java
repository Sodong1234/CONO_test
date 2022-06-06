package com.itwillbs.cono.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.cono.vo.CategoryDTO;
import com.itwillbs.cono.vo.ImgDTO;
import com.itwillbs.cono.vo.ItemDTO;
import com.itwillbs.cono.vo.MemberDTO;

public interface ItemMapper {
	
	// 상품 상세 정보 조회 ddd
	HashMap<String, String> selectItemDetail(String item_idx);
	
	// 상품 이미지 조회 ddd
	List<ImgDTO> selectImgList(String item_idx);
	
}
