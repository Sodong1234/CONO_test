package com.itwillbs.cono.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.cono.vo.CategoryDTO;
import com.itwillbs.cono.vo.ImgDTO;
import com.itwillbs.cono.vo.ItemDTO;

public interface ItemMapper {
	
	// 등록된 상품 개수(item_idx) 조회
	Integer selectItemIdx();
	
	// item 테이블 insert
	int insertItem(@Param("item") ItemDTO item, @Param("member_id") String member_id);
	
	// category 테이블 insert
	int insertCategory(@Param("category") CategoryDTO category, @Param("item") ItemDTO item);
	
	// img 테이블 img_idx 조회
	Integer selectImgIdx(ItemDTO item);
	
	// img 테이블 insert
	void insertImg(@Param("img") ImgDTO img, @Param("item") ItemDTO item);
	
	// 상품 관리 (상품 리스트 조회)
	List<HashMap<String, String>> selectItemList(@Param("member_id") String member_id, @Param("keyword") String keyword, @Param("sell_status") String sell_status);

	
}
