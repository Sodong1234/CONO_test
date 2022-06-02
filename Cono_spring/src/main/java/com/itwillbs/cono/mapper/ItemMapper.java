package com.itwillbs.cono.mapper;

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

	
}
