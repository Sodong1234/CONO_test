package com.itwillbs.cono.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.cono.vo.ImgDTO;
import com.itwillbs.cono.vo.OrdDTO;

public interface ItemMapper {
	
	// 상품 상세 정보 조회 ddd
	HashMap<String, String> selectItemDetail(String item_idx);
	
	// 상품 이미지 조회 ddd
	List<ImgDTO> selectImgList(String item_idx);
	
	// 구매하기 클릭 시 아이템 상태 변경
	void updateItemStatus(String item_idx);

	// item 테이블 수량 변경
	void updateItemQuantity(OrdDTO ord);
	
	// ord 테이블 insert
	void insertOrd(OrdDTO ord);
	
	// safe 테이블 insert
	void insertSafe(@Param("ord") OrdDTO ord, @Param("item_idx") String item_idx);

	// coin 테이블 insert (구매자)
	void insertCoinBuyer(OrdDTO ord, String item_price);

	// coin 테이블 insert (판매자)
//	void insertCoinSeller(@Param("ord") OrdDTO ord, @Param("item_price") String item_price);
	
}
